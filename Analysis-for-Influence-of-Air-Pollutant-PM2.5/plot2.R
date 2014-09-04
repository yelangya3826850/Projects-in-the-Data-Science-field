## read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")


MarylandData <- NEI[which(NEI$fips == "24510"),]
total2 <- c(sum(MarylandData$Emissions[which(MarylandData$year == 1999)]),sum(MarylandData$Emissions[which(MarylandData$year == 2002)]),sum(MarylandData$Emissions[which(MarylandData$year == 2005)]),sum(MarylandData$Emissions[which(MarylandData$year == 2008)]))
year2 <- unique(MarylandData$year)
info2 <- data.frame(TotalEmissions = total2, Year = as.factor(year2))
q <- ggplot(data=info2, aes(x=Year, y=TotalEmissions)) + geom_bar(stat="identity")
q + ggtitle("Total Emissions Of Baltimore City") + ylab("Total Emission")