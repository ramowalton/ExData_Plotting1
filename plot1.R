source("dataprep.R")
#clean and load data
cleanData()
d <- loadData()
#create chart
hist(d$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
#output to PNG file
dev.copy(png, file = "plot1.png")
dev.off()