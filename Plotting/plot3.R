## Exploratory Data Analysis

##############plot3.R##############
## read data
data <- read.table("./Data/exdata-data-household_power_consumption/household_power_consumption.txt",
header = TRUE,sep = ";", na.strings = "?")
kk <- c(which(data$Date == "1/2/2007"),which(data$Date == "2/2/2007"))
data <- data[kk,]
row.names(data) <- c()
data$calendar <- paste(as.character(data$Date),as.character(data$Time))
data$calendar <- strptime(data$calendar, "%d/%m/%Y %H:%M:%S")

## plot figure
plot(data$calendar,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$calendar,data$Sub_metering_2, col = "red")
lines(data$calendar,data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)

## save plot
dev.copy(png,'plot3.png',width = 480,height = 480)
dev.off()
