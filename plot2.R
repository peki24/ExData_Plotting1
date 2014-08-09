library(sqldf)
ln<-"household_power_consumption.txt"
DF <- read.csv.sql(ln, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
DF$Date <- strptime(paste(DF$Date,DF$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(DF$Date,DF$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()