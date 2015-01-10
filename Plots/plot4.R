# Plot 4

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

Sys.setlocale("LC_TIME", "English")

par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power", cex=0.2)
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o", cex = .60)

plot(data$DateTime, data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()