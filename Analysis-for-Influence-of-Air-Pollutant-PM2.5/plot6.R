## read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

LosAngelesData <- NEI[which(NEI$fips == "06037"),]

temp <- SCC[grep("Mobile Sources",SCC$SCC.Level.One),]
LosAngelesMobile <- LosAngelesData[LosAngelesData$SCC %in% temp$SCC,]
total5 <- c(sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 1999)]),sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 2002)]),sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 2005)]),sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 2008)]))

info5 <- data.frame(Total = total5,Year = as.factor(year3), Country = rep("LosAngeles",times = 4))
info4 <- data.frame(info4, Country = rep("Baltimore", times = 4))
info5 <- as.data.frame(t(data.frame(t(info4), t(info5))))
row.names(info5) <- c()

ggplot(data=info5, aes(x=Year, y=Total,fill = Country)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("MotorVehicle Emissions between Baltimore and Los Angeles")