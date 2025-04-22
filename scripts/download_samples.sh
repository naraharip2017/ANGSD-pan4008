#!/bin/bash -l

samples=("SRR21798749_EXP1" "SRR21798750_EXP2" "SRR21798751_EXP3" "SRR21798755_WT1" "SRR21798756_WT2" "SRR21798757_WT3")

for sample in "${samples[@]}"
do
  srr_id=${sample%%_*}

  subdir="0${srr_id:9:3}"

  mkdir -p "${sample}"

  cd "${sample}"

  wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR217/${subdir}/${srr_id}/${srr_id}_1.fastq.gz
  wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR217/${subdir}/${srr_id}/${srr_id}_2.fastq.gz

  cd ..

done