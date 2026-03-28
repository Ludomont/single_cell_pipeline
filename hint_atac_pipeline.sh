#!/bin/bash
# Pipeline for transcription factor activity analysis from scATAC-seq data using HINT-ATAC and RGT

# Step 1: Merge BAM files
samtools merge merged.bam sample1.bam sample2.bam sample3.bam sample4.bam sample5.bam sample6.bam sample7.bam sample8.bam

# Step 2: Sort merged BAM by coordinates
samtools sort -o merged_sorted.bam merged.bam

# Step 3: Index the sorted BAM
samtools index merged_sorted.bam

# Step 4: Filter BAM by barcodes (cell types: effector, non-effector, SLEC, MPEC)
samtools view -h merged_sorted.bam | \
grep -F -f barcode_list.txt | \
samtools view -b -o filtered_barcodes.bam

# Step 5: Peak calling with MACS3
macs3 callpeak \
    -t filtered_barcodes.bam \
    --format BEDPE \
    --keep-dup all \
    --nomodel \
    --shift 37 \
    --extsize 73

# Step 6: Footprinting with RGT-HINT
rgt-hint footprinting \
    --atac-seq \
    --paired-end \
    --organism=hg38 \
    --output-location=/path/to/footprinting_results \
    filtered_barcodes.bam \
    /path/to/filtered_peaks.bed

# Step 7: Motif analysis on footprints
rgt-motifanalysis matching \
    --organism=hg38 \
    --output-location=/path/to/motif_analysis_results \
    --input-files /path/to/footprinting_results/footprints.bed

# Step 8: Differential footprinting analysis
rgt-hint differential \
    --organism=hg38 \
    --bc \
    --nc 64 \
    --mpbs-files=/path/to/footprints_mpbs_1.bed,/path/to/footprints_mpbs_2.bed \
    --reads-files=/path/to/file1.bam,/path/to/file2.bam \
    --conditions=slec,mpec \
    --output-location=/path/to/differential_footprinting_results \
    --output-prefix=All

