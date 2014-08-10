## Exploratory Data Analysis

##############plot4.R##############
## read data
data <- read.table("./Data/exdata-data-household_power_consumption/household_power_consumption.txt",
                   header = TRUE,sep = ";", na.strings = "?")
kk <- c(which(data$Date == "1/2/2007"),which(data$Date == "2/2/2007"))
data <- data[kk,]
row.names(data) <- c()
data$calendar <- paste(as.character(data$Date),as.character(data$Time))
data$calendar <- strptime(data$calendar, "%d/%m/%Y %H:%M:%S")

## plot figure
par(mfrow = c(2, 2))
plot(data$calendar,data$Global_active_power,type = "l", ylab = "Global Active Power", xlab = "")
plot(data$calendar,data$Voltage,type = "l", ylab = "Voltage", xlab = "datatime")
plot(data$calendar,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$calendar,data$Sub_metering_2, col = "red")
lines(data$calendar,data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.6)
plot(data$calendar,data$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab = "datatime")

## save plot
dev.copy(png,'plot4.png',width = 480,height = 480)
dev.off()
