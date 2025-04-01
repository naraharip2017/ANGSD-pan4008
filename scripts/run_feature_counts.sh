#!/bin/bash -l

conda activate angsd

featureCounts -a refGene.gtf -o musmusculus_fc.txt -p -T 8 SRR21798749/SRR21798749.Aligned.sortedByCoord.out.bam SRR21798750/SRR21798750.Aligned.sortedByCoord.out.bam SRR21798751/SRR21798751.Aligned.sortedByCoord.out.bam SRR21798755/SRR21798755.Aligned.sortedByCoord.out.bam SRR21798756/SRR21798756.Aligned.sortedByCoord.out.bam SRR21798757/SRR21798757.Aligned.sortedByCoord.out.bam
