library(SpliceWiz)

ref_path <- "/cluster/home/sulhaq/splicewiz_ref"

buildRef(
    reference_path = ref_path,
    fasta = "/cluster/tools/data/genomes/human/hg19/iGenomes/Sequence/WholeGenomeFasta/genome.fa",
    gtf = "Homo_sapiens.GRCh37.87.SAMI_MODIFIED.gtf",
    ontologySpecies = "Homo sapiens"
)

