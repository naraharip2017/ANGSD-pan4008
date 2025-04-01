#!/bin/bash -l

samples=("SRR21798749" "SRR21798750" "SRR21798751" "SRR21798755" "SRR21798756" "SRR21798757")

for sample in "${samples[@]}"; do
    echo "Processing sample: $sample"

    mkdir -p "$sample"
    cd "$sample"

    base_dir="${sample:0:6}/0${sample:9:11}"
    url1="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${base_dir}/${sample}/${sample}_1.fastq.gz"
    url2="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${base_dir}/${sample}/${sample}_2.fastq.gz"
    wget "$url1"
    wget "$url2"

    conda activate trim-galore

    trim_galore --illumina --paired -o trimmed/ ${sample}_1.fastq.gz ${sample}_2.fastq.gz

    conda activate angsd

    fastqc trimmed/${sample}_1_val_1.fq.gz trimmed/${sample}_2_val_2.fq.gz --threads 2 --extract

    STAR --runMode alignReads --runThreadN 50 \
         --genomeDir ../Mus_musculus_STARindex \
         --readFilesIn trimmed/${sample}_1_val_1.fq.gz trimmed/${sample}_2_val_2.fq.gz \
         --readFilesCommand zcat \
         --outFileNamePrefix ${sample}. \
         --outSAMtype BAM SortedByCoordinate \
         --alignIntronMax 100000
    cd ..

done
