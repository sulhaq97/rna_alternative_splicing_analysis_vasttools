# RNA Alternative Splicing Analysis using Vast-Tools

This repository contains scripts to analyze alternative splicing using vast-tools (https://github.com/vastgroup/vast-tools). The scripts need to be run in the following order:
1. Reference generation (splice_reference_runner.sh & splicewiz_reference_generation.R)
2. Align RNA-seq data using STAR aligner (rna_alignment_script.sh)
3. Once all samples aligned, perform splicing analysis (splice_analysis.R & splice_analysis_runner.sh)
