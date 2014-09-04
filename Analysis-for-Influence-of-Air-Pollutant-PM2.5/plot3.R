## read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

MarylandData <- NEI[which(NEI$fips == "24510"),]
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