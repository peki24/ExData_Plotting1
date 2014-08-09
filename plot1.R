library(sqldf)
ln<-"household_power_consumption.txt"
DF <- read.csv.sql(ln, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
png("plot1.png", width=480, height=480)
hist(DF$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
