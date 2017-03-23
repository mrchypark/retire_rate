library(shiny)
library(reshape2)
library(ggiraph)

options(scipen=999)

dat<-read.csv("./dat.txt",sep="\t")
dat1<-dat[seq(1,52,2),]

tdat<-melt(data = dat1, id.vars = "retire")
names(tdat)[2]<-"year"
tdat[,2]<-gsub("year","",as.character(tdat[,2]))
tdat[,1]<-as.character(tdat[,1])
tdat[,1]<-as.numeric(gsub(",","",tdat[,1]))
tdat[,2]<-as.numeric(gsub(",","",tdat[,2]))
tdat[,3]<-as.numeric(gsub(",","",tdat[,3]))
tdat$rate<-round(tdat$value/tdat$retire*100,2)

tdat[is.na(tdat$value),"value"]<-0

slideData<-data.frame(amount=unique(tdat[,1]))
