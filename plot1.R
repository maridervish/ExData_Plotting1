skip<-grep("1/2/2007",readLines("./hpc.txt"))-1
nrow<-grep("3/2/2007",readLines("./hpc.txt"))-grep("1/2/2007",readLines("./hpc.txt"))
data<-read.table("./hpc.txt",skip=skip[1],nrow=nrow[1], header=F, sep=";",na.strings="?")
colnames(data)<-unlist(read.table("./hpc.txt",nrow=1,sep=";"))
png(file="plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()