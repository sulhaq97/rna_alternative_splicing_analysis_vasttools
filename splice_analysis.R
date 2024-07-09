library(SpliceWiz)
require("edgeR")

# temporary directory where files are stored for the analysis
pb_path <- "temp_as"
# path for splice wiz reference (generated from a previous script) goes here
ref_path <- "path_to_splicewiz_reference"
# path to where all bam files are stored
bam_path <- Sys.glob("../*.bam")

# samples need to be specified like so
samplos <- c("Sample_A_rep1", "Sample_A_rep2", "Sample_A_rep3",
	     "Control_rep1", "Control_rep2", "Control_rep3",)

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
colData(se.filtered)$condition <- c("Sample_A", "Sample_A", "Sample_A",
				    "Control", "Control", "Control")

res_edgeR <- ASE_edgeR(
    se = se.filtered,
    test_factor = "condition",
    test_nom = "Sample_A",
    test_denom = "Control"
)

save(res_edgeR, file="alternative_splicing_results.RData")

