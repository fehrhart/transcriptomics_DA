setwd("C:/Users/rik-l/OneDrive/Documenten/GSE21307")

#Load all gene expression data per sample
dat<-read.delim("GSE21307_series_matrix.txt",as.is = TRUE ,skip=82, row.names=1)

#Delete last row of GSE21307 since last row marks end of matrix table
dat<-dat[-dim(dat)[1],]

#Load description of sample groups from GSE21307 
desc<-read.delim("GSE21307_series_matrix.txt",as.is = TRUE ,skip=35, nrows = 10)
colnames(desc)<-desc[1,]
desc<-desc[9,,drop = FALSE]
desc<-desc[,-1]
desc[1,]<-sub("disease state: ","",desc[1,])
desc<-as.data.frame(t(desc))
colnames(desc)<-"group"
desc[,1]<-as.factor(desc[,1])
colnames(dat)==COlnames(desc)

#Change all NULL values into NA
dat[dat=="NULL"]<-NA
for(i in 1:(dim(dat)[2])) {dat[,i] <- as.numeric(dat[,i])}

#Load annotations containing gene names into R 
anno<-read.delim("GPL4134-20425.txt" ,as.is = TRUE ,skip=20,)

#Count rows in data
table(rowSums(is.na(dat)))
anno<-anno[rowSums(is.na(dat))== 0,]
dat<-dat[rowSums(is.na(dat))== 0,]

#example code to create figure
png("dat.png", width = 1000, height = 1000, pointsize = 24)
boxplot(dat)
dev.off()

#File containing already existing code for statistical analysis 
source("functions_ArrayAnalysis_v2.R")
ls()

#code to create various plots
createQCPlots(dat,"group", desc)

#Statistical improving power through matematical functions designed by limma
library(limma)
design<-model.matrix(~group,data=desc)
fit<-lmFit(dat,design)
fit<- eBayes(fit)

#Create excel files which compare groups vs control group including logFC, p value and gene names
files.c<-saveStatOutput(design,fit, annotation = anno)


#groupsnamen veranderen (clusterplot)
#contrasten toevoegen 


