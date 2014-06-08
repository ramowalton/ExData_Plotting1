cleanData <- function()
{
	data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
	m <- as.matrix(data)
	m[m == '?'] <- NA
	data <- as.data.frame(m)
	write.table(data, file = "cleaned_household_power_consumption.txt", sep=";", quote=FALSE)
}

loadData <- function()
{
	sample <- read.table("cleaned_household_power_consumption.txt", header=TRUE, sep=";", nrows = 10, stringsAsFactors = FALSE)
	classes <- sapply(sample, class)
	filtered <- read.table("cleaned_household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, colClasses = classes)
	filtered <- subset(filtered, Date == "1/2/2007" | Date == "2/2/2007")
}