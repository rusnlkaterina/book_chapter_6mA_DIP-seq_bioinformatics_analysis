# Genomic features annotation

# Install libraries
BiocManager::install("ChIPseeker")
BiocManager::install("GenomicFeatures")

# Load libraries
library(ChIPseeker)
library(clusterProfiler)
library(AnnotationDbi)
library(GenomicFeatures)

# Broad peaks annotation

# Load data
samplefiles <- list.files("/Users/katerinaoleynikova/Downloads/seminar/genomic_features_files",
                          pattern= ".bed", full.names=T)
samplefiles <- as.list(samplefiles)
names(samplefiles) <- c("m6A/6mA DNA") 

# Load annotation file
# upload annotation file for e.coli k12 from:
# https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/005/845/GCF_000005845.2_ASM584v2/
txdb <- makeTxDbFromGFF(file="/Users/katerinaoleynikova/Downloads/ecoli_6mA/ecoli_k12.gff")
txdb

# Main analysis
peakAnnoList <- lapply(samplefiles, annotatePeak, TxDb=txdb, tssRegion=c(-500,500))
peakAnnoList
plotAnnoBar(peakAnnoList)