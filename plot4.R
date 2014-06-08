alldata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE, na.string="?")
graphdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

graphdata$DateTime <- strptime( paste(graphdata$Date, graphdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
graphdata$Date <- as.Date(graphdata$Date, format="%d/%m/%Y")


png(filename="plot4.png",width=480, height=480)

par(mfrow = c(2, 2))

plot(graphdata$DateTime, graphdata$Global_active_power, type="l", lwd=1.5, col="black", main = NULL, xlab="", ylab='Global Active Power')

plot(graphdata$DateTime, graphdata$Voltage, type="l", lwd=1.5, col="black", main = NULL, xlab="datetime", ylab='Voltage')

plot(graphdata$DateTime, graphdata$Sub_metering_1, type="l", lwd=1.5, col="black", main = NULL, xlab="", ylab='Energy sub metering')
lines(graphdata$DateTime, graphdata$Sub_metering_2, type="l", lwd=1.5, col="red")
lines(graphdata$DateTime, graphdata$Sub_metering_3, type="l", lwd=1.5, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2),col=c("black","red", "blue"))

plot(graphdata$DateTime, graphdata$Global_reactive_power, type="l", lwd=1.5, col="black", main = NULL, xlab="datetime", ylab='Global_reactive_power')

dev.off()
