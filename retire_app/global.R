library(shiny)
library(reshape2)
library(ggiraph)

options(scipen=999)

dat<-read.csv("./dat.txt",sep="\t")
dat1<-dat[seq(1,52,2),]

tdat<-melt(data = dat1, id.vars = "retire")
names(tdat)[2]<-"year"
tdat$disp <- tdat$value
tdat[,2]<-gsub("year","",as.character(tdat[,2]))
tdat[,1]<-as.character(tdat[,1])
tdat[,1]<-as.numeric(gsub(",","",tdat[,1]))
tdat[,2]<-as.numeric(gsub(",","",tdat[,2]))
tdat[,3]<-as.numeric(gsub(",","",tdat[,3]))
tdat$rate<-round(tdat$value/tdat$retire*100,2)
tdat$verb<-ifelse(nchar(tdat$retire/10000)<5,paste0(tdat$retire/10000,"만원"),paste0(tdat$retire/100000000,"억원"))

tdat[is.na(tdat$value),"value"]<-0
