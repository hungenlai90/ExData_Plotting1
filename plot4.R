## plot4.R

library(dplyr)

## Read the data
inputdata = read.table("household_power_consumption.txt", stringsAsFactors = FALSE, na.strings = "?", sep = ";", header = TRUE)
inputdata$Date = as.Date(inputdata$Date, format = "%d/%m/%Y")

## Subsetting the data to 2007-02-01 and 2007-02-02
subset.data = subset(inputdata, Date == "2007-02-01" | Date == "2007-02-02")

## Combining date and time columns and reformat to POSIXct class
subset.data$Date.time = paste(subset.data$Date, subset.data$Time)
subset.data$Date.time = as.POSIXct(subset.data$Date.time, format = "%Y-%m-%d %H:%M:%S")

## Initialise plot4.png file and plot the four graphs with appropriate parameters
png("plot4.png")

## setting mfcol as 2x2 grid, and graphs will be added column-wise
par(mfcol = c(2,2), mar = c(2,4,2,2))

## Plot first graph (from plot2)
with(subset.data, plot(Date.time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
## Plot second graph (from plot3)
with(subset.data, plot(Date.time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset.data, lines(Date.time, Sub_metering_2, col = "red"))
with(subset.data, lines(Date.time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")
## Plot third and fourth graphs
with(subset.data, plot(Date.time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(subset.data, plot(Date.time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()

