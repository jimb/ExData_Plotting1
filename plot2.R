
alldata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE, na.string="?")
graphdata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

graphdata$DateTime <- strptime( paste(graphdata$Date, graphdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
graphdata$Date <- as.Date(graphdata$Date, format="%d/%m/%Y")

png("plot2.png", width = 480, height = 480)
plot(graphdata$DateTime, graphdata$Global_active_power, type="l", lwd=1.5, col="black", main = NULL, xlab="", ylab='Global Active Power (kilowatts)')
dev.off()

