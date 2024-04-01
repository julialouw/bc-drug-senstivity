#! /bin/bash -l
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --job-name=index_genome
#SBATCH --time=06:00:00
#SBATCH --mem=60G

mamba activate angsd

STAR --runMode genomeGenerate \
 --runThreadN 4 \
 --genomeDir /athena/angsd/scratch/jal4037/angsd/project/genome_generate/ \
 --genomeFastaFiles /athena/angsd/scratch/jal4037/angsd/project/genome_generate/GRCh38.primary_assembly.genome.fa \
 --sjdbGTFfile /athena/angsd/scratch/jal4037/angsd/project/genome_generate/gencode.v45.annotation.gtf \
 --sjdbOverhang 149
