#!/bin/bash
# Alignment for RNA-seq
# The following are the recommended parameters for aligning a sample file using STAR aligner prior to alternative splicing analysis
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


STAR --genomeDir STAR_INDEX_PATH_HERE --runThreadN 1 --readFilesIn SAMPLE_FILES_GO_HERE --readFilesCommand zcat --outFileNamePrefix PREFIX_NAME_FOR_SAMPLE --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate
