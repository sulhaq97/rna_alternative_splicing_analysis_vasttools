library(SpliceWiz)

pb_path <- "temp_as"
ref_path <- "/cluster/home/sulhaq/splicewiz_ref/"
bam_path <- Sys.glob("../*.bam")
samplos <- c("501.MEL.dmso.B", "501.MEL.dmso.C",
	     "501.MEL.ms023.1uM.A", "501.MEL.ms023.1uM.B", "501.MEL.ms023.1uM.C",
	     "A375.dmso.A", "A375.dmso.B", "A375.dmso.C",
	     "A375.ms023.1uM.A", "A375.ms023.1uM.B", "A375.ms023.1uM.C",
	     "SK.MEL.239.dmso.A", "SK.MEL.239.dmso.B", "SK.MEL.239.dmso.C",
	     "SK.MEL.239.ms023.A", "SK.MEL.239.ms023.B", "SK.MEL.239.ms023.C")

processBAM(
    bamfiles = bam_path,
    sample_names = samplos,
    reference_path = ref_path,
    output_path = pb_path
)


expr <- findSpliceWizOutput(pb_path)

nxtse_path <- "temp_as_nxtse"

collateData(
    Experiment = expr,
    reference_path = ref_path,
    output_path = nxtse_path
)

se <- makeSE(nxtse_path)

se.filtered <- se[applyFilters(se),]
colData(se.filtered)$condition <- c("dmso", "dmso", "ms023.1uM", "ms023.1uM", "ms023.1uM",
				    "dmso", "dmso", "dmso", "ms023.1uM", "ms023.1uM", "ms023.1uM",
                                    "dmso", "dmso", "dmso", "ms023.1uM", "ms023.1uM", "ms023.1uM")

require("edgeR")
res_edgeR <- ASE_edgeR(
    se = se.filtered,
    test_factor = "condition",
    test_nom = "ms023.1uM",
    test_denom = "dmso"
)
save(res_edgeR, file="ms023_1um_AML_res_edgeR.RData")

