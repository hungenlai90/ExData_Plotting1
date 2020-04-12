## plot2.R

library(dplyr)

## Read the data
inputdata = read.table("household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE)
inputdata$Date = as.Date(inputdata$Date, format = "%d/%m/%Y")

## Subsetting the data to 2007-02-01 and 2007-02-02
subset.data = subset(inputdata, Date == "2007-02-01" | Date == "2007-02-02")

## Combining date and time columns and reformat to POSIXct class
subset.data$Date.time = paste(subset.data$Date, subset.data$Time)
subset.data$Date.time = as.POSIXct(subset.data$Date.time, format = "%Y-%m-%d %H:%M:%S")

## Initialise plot2.png file and plot the graph with appropriate parameters
png("plot2.png")
with(subset.data, plot(Date.time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
