## read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")


temp <- SCC[grep("Combustion",SCC$SCC.Level.One),]
Coaldata <- temp[grep("Coal",temp$SCC.Level.Three),]
total3 <- NEI[NEI$SCC %in% Coaldata$SCC,]
year3 <- unique(total3$year)
total3 <- c(sum(total3$Emissions[which(total3$year == 1999)]),sum(total3$Emissions[which(total3$year == 2002)]),sum(total3$Emissions[which(total3$year == 2005)]),sum(total3$Emissions[which(total3$year == 2008)]))

info3 <- data.frame(Total = total3,Year = as.factor(year3))

ggplot(data=info3, aes(x=Year, y=Total)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("The emissions from coal combustion-related sources")