#! /bin/bash -l
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=8
#SBATCH --job-name=fc_loop
#SBATCH --time=04:00:00
#SBATCH --mem=250G

mamba activate angsd

featureCounts -a /athena/angsd/scratch/jal4037/angsd/project/genome_generate/gencode.v45.annotation.gtf -o fc_counts.txt -p /athena/angsd/scratch/jal4037/angsd/project/alns/*/*.bam


