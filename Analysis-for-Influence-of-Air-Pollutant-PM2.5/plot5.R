## read data
NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")


temp <- SCC[grep("Mobile Sources",SCC$SCC.Level.One),]
MaryMobile <- MarylandData[MarylandData$SCC %in% temp$SCC,]
total4 <- c(sum(MaryMobile$Emissions[which(MaryMobile$year == 1999)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2002)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2005)]),sum(MaryMobile$Emissions[which(MaryMobile$year == 2008)]))
info4 <- data.frame(Total = total4,Year = as.factor(year3))

ggplot(data=info4, aes(x=Year, y=Total)) + geom_bar(stat="identity", position=position_dodge()) + ggtitle("MotorVehicle emissions from 1999a2008 in Baltimore")