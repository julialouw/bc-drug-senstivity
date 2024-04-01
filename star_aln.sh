#! /bin/bash -l
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=8
#SBATCH --job-name=alignment_loop
#SBATCH --time=08:00:00
#SBATCH --mem=350G

mamba activate angsd

genomeDir="/athena/angsd/scratch/jal4037/angsd/project/genome_generate"
fastqDir="/athena/angsd/scratch/jal4037/angsd/project/fastq_data"
alnDir="/athena/angsd/scratch/jal4037/angsd/project/alns"

samples=("HER2_res2" "HER2_res3" "HER2_res4" "HER2_res5" "HER2_sens1" "HER2_sens2" "HER2_sens3" "LumB_res1" "LumB_res2" "LumB_sens2" "LumB_sens3" "LumB_sens4")

for sample in "${samples[@]}"; do

    mkdir -p "$alnDir/${sample}_alignment"

 STAR \
        --runMode alignReads \
        --runThreadN 8 \
        --genomeDir "$genomeDir" \
        --readFilesIn "$fastqDir/${sample}_1.fastq" "$fastqDir/${sample}_2.fastq" \
        --outFileNamePrefix "$alnDir/${sample}_alignment/" \
        --outSAMtype BAM SortedByCoordinate \
        --alignIntronMin 20 \
        --alignIntronMax 100000 \
        --outSAMattributes NH HI AS nM MD
done
