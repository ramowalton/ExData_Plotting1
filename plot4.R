source("dataprep.R")
#clean and load data
cleanData()
d <- loadData()
#create charts
par(mfrow = c(2, 2))
with(d, {
	#chart 1
	plot(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Global_active_power, ylab = "Global Active Power", type="n", xlab="")
	lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Global_active_power)

	#chart 2
	plot(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Voltage, ylab = "Voltage", type="n", xlab="datetime")
	lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Voltage)
	
	#chart 3
	plot(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n")
	lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_1)
	lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_2, col="red")
	lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_3, col="blue")
	legend("topright", legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lty=c(1,1,1), col=c("black", "red", "blue"))	
	
	#chart 4
	plot(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Global_reactive_power, type="n", xlab="datetime")
	lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Global_reactive_power)
}
)
#output to PNG file
dev.copy(png, file = "plot4.png")
dev.off()