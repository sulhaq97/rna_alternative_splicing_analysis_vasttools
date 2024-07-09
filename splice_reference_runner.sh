#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -p himem
#SBATCH --mem=60G
#SBATCH -c 1
#SBATCH -N 1
#SBATCH -o %x-%j.out

# This is the script for running the reference generation R script
# This script runs on a slurm high-performance computing cluster with the above parameters (recommended)

module load R/4.2.1
Rscript splicewiz_reference_generation.R
