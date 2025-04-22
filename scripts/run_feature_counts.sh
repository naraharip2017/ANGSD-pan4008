#!/bin/bash -l

conda activate angsd

featureCounts -a refGene.gtf -o musmusculus_fc.txt -Q 10 -p --countReadPairs -T 8 SRR21798749_EXP1/SRR21798749.Aligned.sortedByCoord.out.bam SRR21798750_EXP2/SRR21798750.Aligned.sortedByCoord.out.bam SRR21798751_EXP3/SRR21798751.Aligned.sortedByCoord.out.bam SRR21798755_WT1/SRR21798755.Aligned.sortedByCoord.out.bam SRR21798756_WT2/SRR21798756.Aligned.sortedByCoord.out.bam SRR21798757_WT3/SRR21798757.Aligned.sortedByCoord.out.bam
