#!/bin/bash
# custom file for HT29_MS023_1
# the following are sbatch parameters
#SBATCH -t 20:00:00
#SBATCH -p himem
#SBATCH --mem=60G
#SBATCH -c 1
#SBATCH -N 1
#SBATCH -o %x-%j.out

module load gcc/6.2.0
module load STAR/2.7.9a
module load fastqc/0.11.5
module load trim_galore/0.5.0
module load cutadapt/2.5


STAR --genomeDir /cluster/projects/lokgroup/cdx_omics/CDX_RNA_seq/STARIndex_hg19_genomeSAsparseD2 --runThreadN 1 --readFilesIn HT29_MS023_1.fastq.gz --readFilesCommand zcat --outFileNamePrefix HT29_MS023_1 --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate
