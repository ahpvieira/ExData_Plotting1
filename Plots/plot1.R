# Plot 1

setwd("./Course_Project")
object.size("household_power_consumption.txt")
data <- read.table("household_power_consumption.txt", sep = ";", 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                 "Voltage", "Global_intensity", "Sub_metering_1", 
                                 "Sub_metering_2", "Sub_metering_3"),
                   skip = grep("1/2/2007", readLines("household_power_consumption.txt")),
                   nrows=2878, na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), 
                          format="%d/%m/%Y %H:%M:%S", tz = "UCT")

hist(data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()