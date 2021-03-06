library(sqldf)
ln<-"household_power_consumption.txt"
DF <- read.csv.sql(ln, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
DF$Date <- strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(DF$Date,DF$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(DF$Date,DF$Sub_metering_2,col="red")
lines(DF$Date,DF$Sub_metering_3,col="blue")
legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()