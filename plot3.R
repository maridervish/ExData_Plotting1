## This script reads only data related to dates from 01-02-2007 to 02-02-2007
## Setting up number of rows to skip:
skip<-grep("1/2/2007",readLines("./hpc.txt"))-1
## Setting up number of rows to read:
nrow<-grep("3/2/2007",readLines("./hpc.txt"))-grep("1/2/2007",readLines("./hpc.txt"))
## Reading data:
data<-read.table("./hpc.txt",skip=skip[1],nrow=nrow[1], header=F, sep=";",na.strings="?")
## Naming columns:
colnames(data)<-unlist(read.table("./hpc.txt",nrow=1,sep=";"))
## Creating new column with class "Date" by combining columns Date and Time:
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
## Opening png device:
png(file="plot3.png",width=480,height=480,units = "px")
## Creating plot with necessary settings:
with(data,plot(DateTime,Sub_metering_1, col="black", type="l",ylab="Energy sub metering",xlab=""))
## Adding data to the same plot:
with(data,lines(DateTime,Sub_metering_2, col="red"))
with(data,lines(DateTime,Sub_metering_3, col="blue"))
## Adding legend:
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"))
## Closing device:
dev.off()