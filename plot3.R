source("dataprep.R")
#clean and load data
cleanData()
d <- loadData()
#create chart
with(d, plot(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n"))
with(d, lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_1))
with(d, lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_2, col="red"))
with(d, lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), lty=c(1,1,1), col=c("black", "red", "blue")) 
#output to PNG file
dev.copy(png, file = "plot3.png")
dev.off()