library(shiny)
library(reshape2)
library(ggiraph)

options(scipen=999)

dat<-read.csv("./data.txt",sep="\t")
names(dat) <-c("retire","year1","year2","year3","year5","year7","year10","year15","year20")
write.table(dat,"./dat.txt",sep="\t",row.names = F)
dat1<-dat[seq(1,52,2),]
names(dat1) <-c("retire","year1","year2","year3","year5","year7","year10","year15","year20")

dat2<-dat[seq(2,52,2),]

tdat<-melt(data = dat1, id.vars = "retire")
names(tdat)[2]<-"year"
tdat[,2]<-gsub("year","",as.character(tdat[,2]))
tdat[,1]<-as.character(tdat[,1])
tdat[,1]<-as.numeric(gsub(",","",tdat[,1]))
tdat[,2]<-as.numeric(gsub(",","",tdat[,2]))
tdat[,3]<-as.numeric(gsub(",","",tdat[,3]))

tdat[is.na(tdat$value),"value"]<-0