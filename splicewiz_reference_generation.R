library(SpliceWiz)

ref_path <- "path_to_where_reference_will_be_generated"

# make sure both fasta and GTF files are same genome versions (both have to be either hg19 or hg38)
buildRef(
    reference_path = ref_path,
    fasta = "Genome_FASTA_file_goes_here",
    gtf = "GTF_file_goes_here",
    ontologySpecies = "Homo sapiens"
)

