## Exploratory Data Analysis Assignment2

setwd("C:/Users/Nan/Documents/R/Exploratory Data Analysis/2")

## read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

total <- c(sum(NEI$Emissions[which(NEI$year == 1999)]),sum(NEI$Emissions[which(NEI$year == 2002)]),sum(NEI$Emissions[which(NEI$year == 2005)]),sum(NEI$Emissions[which(NEI$year == 2008)]))
year <- unique(NEI$year)
Year <- as.factor(year)
info1 <- data.frame(TotalEmissions = total, Year)
ggplot(data=info1, aes(x=Year, y=TotalEmissions)) + geom_bar(stat="identity") + ggtitle("Total PM2.5 emission")
## http://www.cookbook-r.com/Graphs/Bar_and_line_graphs_(ggplot2)/


MarylandData <- NEI[which(NEI$fips == "24510"),]
total2 <- c(sum(MarylandData$Emissions[which(MarylandData$year == 1999)]),sum(MarylandData$Emissions[which(MarylandData$year == 2002)]),sum(MarylandData$Emissions[which(MarylandData$year == 2005)]),sum(MarylandData$Emissions[which(MarylandData$year == 2008)]))
year2 <- unique(MarylandData$year)
info2 <- data.frame(TotalEmissions = total2, Year = year2)
q <- ggplot(data=info2, aes(x=Year, y=TotalEmissions)) + geom_bar(stat="identity")
q + ggtitle("Total Emissions Of Maryland") + ylab("Total Emission")


Type <- unique(MarylandData$type)
total21 <- c(sum(MarylandData$Emissions[which(MarylandData$year == 1999 & MarylandData$type == Type[1])]),sum(MarylandData$Emissions[which(MarylandData$year == 2002 & MarylandData$type == Type[1])]),sum(MarylandData$Emissions[which(MarylandData$year == 2005 & MarylandData$type == Type[1])]),sum(MarylandData$Emissions[which(MarylandData$year == 2008 & MarylandData$type == Type[1])]))
year21 <- unique(MarylandData$year)
info21 <- data.frame(Total = total21,Year = year21,Type = rep(Type[1],times = 4))


Type <- unique(MarylandData$type)
total22 <- c(sum(MarylandData$Emissions[which(MarylandData$year == 1999 & MarylandData$type == Type[2])]),sum(MarylandData$Emissions[which(MarylandData$year == 2002 & MarylandData$type == Type[2])]),sum(MarylandData$Emissions[which(MarylandData$year == 2005 & MarylandData$type == Type[2])]),sum(MarylandData$Emissions[which(MarylandData$year == 2008 & MarylandData$type == Type[2])]))
year22 <- unique(MarylandData$year)
info22 <- data.frame(Total = total22,Year = year22,Type = rep(Type[2],times = 4))


Type <- unique(MarylandData$type)
total23 <- c(sum(MarylandData$Emissions[which(MarylandData$year == 1999 & MarylandData$type == Type[3])]),sum(MarylandData$Emissions[which(MarylandData$year == 2002 & MarylandData$type == Type[3])]),sum(MarylandData$Emissions[which(MarylandData$year == 2005 & MarylandData$type == Type[3])]),sum(MarylandData$Emissions[which(MarylandData$year == 2008 & MarylandData$type == Type[3])]))
year23 <- unique(MarylandData$year)
info23 <- data.frame(Total = total23,Year = year23,Type = rep(Type[3],times = 4))


Type <- unique(MarylandData$type)
total24 <- c(sum(MarylandData$Emissions[which(MarylandData$year == 1999 & MarylandData$type == Type[4])]),sum(MarylandData$Emissions[which(MarylandData$year == 2002 & MarylandData$type == Type[4])]),sum(MarylandData$Emissions[which(MarylandData$year == 2005 & MarylandData$type == Type[4])]),sum(MarylandData$Emissions[which(MarylandData$year == 2008 & MarylandData$type == Type[4])]))
year24 <- unique(MarylandData$year)
info24 <- data.frame(Total = total24,Year = year24,Type = rep(Type[4],times = 4))

Info <- as.data.frame(t(data.frame(t(info21),t(info22),t(info23),t(info24))))
Info$Total <- as.numeric(as.character(Info$Total))
#Info$Year <- as.numeric(as.character(Info$Year))
row.names(Info) <- c()
qq <- ggplot(data=Info, aes(x=Year, y=Total, fill=Type)) + geom_bar(stat="identity", position=position_dodge())
qq + ggtitle("The total emission of Baltimore City from 1999-2008 ")




temp <- SCC[grep("Combustion",SCC$SCC.Level.One),]
Coaldata <- temp[grep("Coal",temp$SCC.Level.Three),]
total3 <- NEI[NEI$SCC %in% Coaldata$SCC,]
year3 <- unique(total3$year)
total3 <- c(sum(total3$Emissions[which(total3$year == 1999)]),sum(total3$Emissions[which(total3$year == 2002)]),sum(total3$Emissions[which(total3$year == 2005)]),sum(total3$Emissions[which(total3$year == 2008)]))

info3 <- data.frame(Total = total3,Year = as.factor(year3))

ggplot(data=info3, aes(x=Year, y=Total)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("The emissions from coal combustion-related sources")




temp <- SCC[grep("Mobile Sources",SCC$SCC.Level.One),]
MaryMobile <- MarylandData[MarylandData$SCC %in% temp$SCC,]
total4 <- c(sum(MaryMobile$Emissions[which(MaryMobile$year == 1999)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2002)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2005)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2008)]))

info4 <- data.frame(Total = total4,Year = as.factor(year3))
ggplot(data=info4, aes(x=Year, y=Total)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("MotorVehicle emissions from 1999-2008 in Baltimore")




LosAngelesData <- NEI[which(NEI$fips == "06037"),]

temp <- SCC[grep("Mobile Sources",SCC$SCC.Level.One),]
LosAngelesMobile <- LosAngelesData[LosAngelesData$SCC %in% temp$SCC,]
total5 <- c(sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 1999)]),sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 2002)]),sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 2005)]),sum(LosAngelesMobile$Emissions[which(LosAngelesMobile$year == 2008)]))

info5 <- data.frame(Total = total5,Year = as.factor(year3), Country = rep("LosAngeles",times = 4))
info4 <- data.frame(info4, Country = rep("Maryland", times = 4))
info5 <- as.data.frame(t(data.frame(t(info4), t(info5))))
row.names(info5) <- c() 
ggplot(data=info5, aes(x=Year, y=Total,fill = Country)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("MotorVehicle Emissions between Baltimore and Los Angeles")






