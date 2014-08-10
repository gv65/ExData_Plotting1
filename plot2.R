## Exploratory Data Analysis - Project Assignment 1

## plot2.R - It generates plot2.png

## Downloading of the data from the course website and storing in a local directory

	fileName = "D:\\Courses\\ExploratoryDataAnalysis\\exdata_plotting1.zip"
	if (!file.exists(fileName)) {
		downloadedFile = download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
		destfile = fileName)
	}

## Reading the data from the contents of the zipped file

	dataFrame.power = read.csv(unz(fileName, "household_power_consumption.txt"), header=TRUE,
	sep=";", stringsAsFactors=F, na.strings="?",colClasses=c("character", "character", "numeric",
	"numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

## Date Formatting and subseting the data only on 2007-02-01 and 2007-02-02

	dataFrame.power$timestamp = strptime(paste(dataFrame.power$Date, dataFrame.power$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC")
	startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
	endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
	dataFrame.power = dataFrame.power[dataFrame.power$timestamp >= startDate & dataFrame.power$timestamp <= endDate, ]

## Graph Creation

	png(filename="plot2.png", width=480, height=480, units="px")
	plot(dataFrame.power$timestamp, dataFrame.power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.off()