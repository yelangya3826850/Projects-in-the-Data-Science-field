## Exploratory Data Analysis

##############plot1.R##############
## read data
data <- read.table("./Data/exdata-data-household_power_consumption/household_power_consumption.txt",
                   header = TRUE,sep = ";", na.strings = "?")
kk <- c(which(data$Date == "1/2/2007"),which(data$Date == "2/2/2007"))
data <- data[kk,]
row.names(data) <- c()
data$calendar <- paste(as.character(data$Date),as.character(data$Time))

## plot figure1
hist(data$Global_active_power, col = "red" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## save plot
dev.copy(png,'plot1.png',width = 480,height = 480)
dev.off()
