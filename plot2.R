skip<-grep("1/2/2007",readLines("./hpc.txt"))-1
nrow<-grep("3/2/2007",readLines("./hpc.txt"))-grep("1/2/2007",readLines("./hpc.txt"))
data<-read.table("./hpc.txt",skip=skip[1],nrow=nrow[1], header=F, sep=";",na.strings="?")
colnames(data)<-unlist(read.table("./hpc.txt",nrow=1,sep=";"))
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot2.png",width=480,height=480,units = "px")
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()