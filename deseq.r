library("ggplot2")
library(ggrepel)
library("DESeq2")

sampleFiles <- grep("sam",list.files(directory),value='TRUE')

	sampleCondition <- sub("_SRR.*","",sampleFiles)

sampleTable <- data.frame(sampleName = sampleFiles,fileName = sampleFiles,condition = sub("_SRR.*","",sampleFiles))
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,directory = directory,design= ~ condition)

ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = c("PRJNA254489","PRJNA41497"))
dds <- DESeq(ddsHTSeq)

name <- gsub("P.*_|\\.sam","",sampleFiles)
dds$name <- name

vsd <- vst(dds, blind=FALSE)

pcaData <- plotPCA(vsd, intgroup=c("condition","name"), returnData=TRUE)

ggplot(pcaData, aes(PC1, PC2, color=condition)) +ggtitle("Seedling and seed") + geom_point(size=3) + geom_label_repel(aes(label = name), box.padding   = 0.35, point.padding = 0.5, segment.color = 'grey50') + xlab(paste0("PC1: ",percentVar[1],"% variance")) + ylab(paste0("PC2: ",percentVar[2],"% variance")) + coord_fixed()

a=c("Other","Other","Other","Other","Other","Other","Resistant", "Resistant", "R
esistant", "Resistant", "Resistant", "Resistant", "Susceptible", "Susceptible", 
"Susceptible", "Susceptible", "Susceptible", "Susceptible", "Resistant", "Resist
ant", "Resistant", "Resistant", "Resistant", "Resistant", "Susceptible", "Suscep
tible", "Susceptible", "Susceptible", "Susceptible", "Susceptible", "Resistant",
 "Resistant", "Resistant", "Resistant", "Resistant", "Resistant","Susceptible", 
"Susceptible", "Susceptible", "Susceptible", "Susceptible", "Susceptible",  "Oth
er",  "Other",  "Other",  "Other",  "Other",  "Other",  "Other","Other")


library("ggplot2");library(ggrepel);library("DESeq2");
sampleFiles <- grep("sam",list.files(directory),value='TRUE');sampleTable <- data.frame(sampleName = sampleFiles,fileName = sampleFiles,condition = sub("_.RR.*","",sampleFiles));ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,directory = directory,design= ~ condition)

ddsHTSeq$condition <- factor(ddsHTSeq$condition, levels = ddsHTSeq$condition[!duplicated(ddsHTSeq$condition)]);dds <- DESeq(ddsHTSeq);name <- gsub("P.*_|\\.sam","",sampleFiles);dds$name <- name;vsd <- vst(dds, blind=FALSE);pcaData <- plotPCA(vsd, intgroup=c("condition","name"), returnData=TRUE);ggplot(pcaData, aes(PC1, PC2, color=condition)) +ggtitle("Seedling and seed") + geom_point(size=3) + geom_label_repel(aes(label = name), box.padding   = 0.35, point.padding = 0.5, segment.color = 'grey50') + xlab(paste0("PC1: ",percentVar[1],"% variance")) + ylab(paste0("PC2: ",percentVar[2],"% variance")) + coord_fixed()

sampleDists <- dist(t(assay(vsd))); sampleDistMatrix <- as.matrix(sampleDists); rownames(sampleDistMatrix) <- paste(vsd$condition); colnames(sampleDistMatrix) <- NULL; colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255); pheatmap(sampleDistMatrix, clustering_distance_rows=sampleDists, clustering_distance_cols=sampleDists, col=colors)

ggplot(pcaData, aes(PC1, PC2, color=condition)) +ggtitle("Leaf and young leaf") + geom_point(size=3) + geom_text(aes(label=name),hjust=0.5, vjust=2) + xlab(paste0("PC1: ",percentVar[1],"% variance")) + ylab(paste0("PC2: ",percentVar[2],"% variance")) + coord_fixed()

ggplot(pcaData, aes(PC1, PC2, color=condition)) +ggtitle("Leaf and young leaf") + geom_point(size=3) + geom_label_repel(aes(label = name), box.padding   = 0.35, point.padding = 0.5, segment.color = 'grey50') + theme_classic()+ xlab(paste0("PC1: ",percentVar[1],"% variance")) + ylab(paste0("PC2: ",percentVar[2],"% variance")) + coord_fixed()

