source("dataprep.R")
#clean and load data
cleanData()
d <- loadData()
#create chart
plot(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Global_active_power, ylab = "Global Active Power (kilowatts)", type="n", xlab="")
lines(as.POSIXct(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S", tz="EST"), d$Global_active_power)
#output to PNG file
dev.copy(png, file = "plot2.png")
dev.off()