## plot3.R

library(dplyr)

## Read the data
inputdata = read.table("household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE)
inputdata$Date = as.Date(inputdata$Date, format = "%d/%m/%Y")

## Subsetting the data to 2007-02-01 and 2007-02-02
subset.data = subset(inputdata, Date == "2007-02-01" | Date == "2007-02-02")

## Combining date and time columns and reformat to POSIXct class
subset.data$Date.time = paste(subset.data$Date, subset.data$Time)
subset.data$Date.time = as.POSIXct(subset.data$Date.time, format = "%Y-%m-%d %H:%M:%S")

## Initialise plot3.png file and plot the graph with appropriate parameters
png("plot3.png")
with(subset.data, plot(Date.time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset.data, lines(Date.time, Sub_metering_2, col = "red"))
with(subset.data, lines(Date.time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()
