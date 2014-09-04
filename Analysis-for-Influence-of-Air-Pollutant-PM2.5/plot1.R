## read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

total <- c(sum(NEI$Emissions[which(NEI$year == 1999)]),sum(NEI$Emissions[which(NEI$year == 2002)]),sum(NEI$Emissions[which(NEI$year == 2005)]),sum(NEI$Emissions[which(NEI$year == 2008)]))
year <- unique(NEI$year)
Year <- as.factor(year)
info1 <- data.frame(TotalEmissions = total, Year)
ggplot(data=info1, aes(x=Year, y=TotalEmissions)) + geom_bar(stat="identity") + ggtitle("Total PM2.5 emission")