## Exploratory Data Analysis - Project Assignment 1

## plot1.R - It generates plot1.png

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

	dataFrame.power$Date = as.Date(dataFrame.power$Date, format="%d/%m/%Y")
	startDate = as.Date("01/02/2007", format="%d/%m/%Y")
	endDate = as.Date("02/02/2007", format="%d/%m/%Y")
	dataFrame.power = dataFrame.power[dataFrame.power$Date >= startDate & dataFrame.power$Date <= endDate, ]

## Graph creation

	png(filename="plot1.png", width=480, height=480)
	hist(dataFrame.power$Global_active_power, main="Global Active Power",
	xlab="Global Active Power (kilowatts)", col="red")
	dev.off()