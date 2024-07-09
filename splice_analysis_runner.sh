#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -p himem
#SBATCH --mem=60G
#SBATCH -c 1
#SBATCH -N 1
#SBATCH -o %x-%j.out

module load R/4.2.1

Rscript splice_analysis.R
