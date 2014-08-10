## Exploratory Data Analysis

##############plot2.R##############
## read data
data <- read.table("./Data/exdata-data-household_power_consumption/household_power_consumption.txt",
                   header = TRUE,sep = ";", na.strings = "?")
kk <- c(which(data$Date == "1/2/2007"),which(data$Date == "2/2/2007"))
data <- data[kk,]
row.names(data) <- c()
data$calendar <- paste(as.character(data$Date),as.character(data$Time))
data$calendar <- strptime(data$calendar, "%d/%m/%Y %H:%M:%S")

## plot figure2
plot(data$calendar,data$Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## save plot
dev.copy(png,'plot2.png',width = 480,height = 480)
dev.off()