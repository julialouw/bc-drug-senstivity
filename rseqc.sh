#! /bin/bash -l
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=8
#SBATCH --job-name=rseqc_loop
#SBATCH --time=02:00:00
#SBATCH --mem=150G

mamba activate rseqc

bam_stat.py  -i /athena/angsd/scratch/jal4037/angsd/project/alns/*/*.bam > bam_stats.txt

geneBody_coverage.py -r /athena/angsd/scratch/jal4037/angsd/project/genome_generate/hg38_GENCODE_V45_Basic.bed \
	-i /athena/angsd/scratch/jal4037/angsd/project/alns/*/*.bam

infer_experiment.py -r /athena/angsd/scratch/jal4037/angsd/project/genome_generate/hg38_GENCODE_V45_Basic.bed \
        -i /athena/angsd/scratch/jal4037/angsd/project/alns/HER2_sens1_alignment/HER2_sens1.Aligned.sortedByCoord.out.bam > inf_exp.txt



