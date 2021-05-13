sampleCondition1 <- sub("SRR.*","",sampleFiles1)
sampleCondition1
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
sampleTable1 <- data.frame(sampleName = sampleFiles1,fileName = sampleFiles1,condition = sampleCondition1)
library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable1,directory = directory,design= ~ condition)
ddsHTSeq
ddsHTSeq$condition
ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = c("fungi","max","mong"))
ddsHTSeq$condition
dds <- DESeq(ddsHTSeq)
res <- results(dds)
res
pheatmap
library(pheatmap)
library("RColorBrewer")
vsd <- vst(dds, blind=FALSE)
head(assay(vsd), 3)
sampleDists <- dist(t(assay(vsd)))
sampleDists
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(vsd$condition, vsd$type, sep="-")
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
install.packages(pheatmap)
install.packages("pheatmap")
install.packages("pheatmap")pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
pheatmap(sampleDistMatrix, clustering_distance_rows=sampleDists, clustering_distance_cols=sampleDists, col=colors)
library(pheatmap)
pheatmap(sampleDistMatrix, clustering_distance_rows=sampleDists, clustering_distance_cols=sampleDists, col=colors)
