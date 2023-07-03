BAM=coverage.bam
GENOME=/ws/bins/SRR10053317_bin00.fa
READS=/ws/reads/SRR10053317.fastq.gz

# https://github.com/lh3/minimap2
# http://www.htslib.org/doc/samtools-sort.html
minimap2 -a $GENOME $READS | samtools sort -o $BAM --write-index -

# https://bedtools.readthedocs.io/en/latest/content/tools/genomecov.html
bedtools genomecov -ibam $BAM -bg >coverage.tsv
