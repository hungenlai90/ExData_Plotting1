## plot1.R

library(dplyr)

## Read the data
inputdata = read.table("household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE)

## Converting date format
inputdata$Date = as.Date(inputdata$Date, format = "%d/%m/%Y")

## Subsetting the data to 2007-02-01 and 2007-02-02
subset.data = subset(inputdata, Date == "2007-02-01" | Date == "2007-02-02")

## Initialise plot1.png file and plot the histogram graph with appropriate parameters
png("plot1.png")
with(subset.data, hist(Global_active_power, col = "red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
