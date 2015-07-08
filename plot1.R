## This script reads only data related to dates from 01-02-2007 to 02-02-2007
## Setting up number of rows to skip:
skip<-grep("1/2/2007",readLines("./hpc.txt"))-1
## Setting up number of rows to read:
nrow<-grep("3/2/2007",readLines("./hpc.txt"))-grep("1/2/2007",readLines("./hpc.txt"))
## Reading data:
data<-read.table("./hpc.txt",skip=skip[1],nrow=nrow[1], header=F, sep=";",na.strings="?")
## Naming columns:
colnames(data)<-unlist(read.table("./hpc.txt",nrow=1,sep=";"))
## Opening png device:
png(file="plot1.png",width = 480, height = 480, units = "px")
## Creating plot with necessary settings
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
## Closing device:
dev.off()