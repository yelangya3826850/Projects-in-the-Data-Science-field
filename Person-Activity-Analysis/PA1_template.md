 Reproducible Research
=======================

# Loading and preprocessing the data
```{r}
data <- read.csv("./RepData_PeerAssessment1/activity/activity.csv", header = TRUE, sep = ",")
index <- complete.cases(data)
data1 <- data[index,]
```

# What is mean total number of steps taken per day?

```{r}
data2 <- data1[-which(data1$steps==0),]
date <- unique(data$date)
stepsum <- as.numeric()
Mean <- as.numeric()
Median <- as.numeric()
for (i in 1:length(date))
{
    stepsum[i] <- sum(data1$steps[which(data1$date == date[i])])
    Mean[i] <- mean(data1$steps[which(data1$date == date[i])])
}


month <- as.POSIXlt(date)$mon + 1
day <- as.POSIXlt(date)$mday
stepsum <- data.frame(stepsum,date,month,day)


library(ggplot2)
library(plyr)
mm <- ddply(stepsum, "date",summarise, stepsum = sum(stepsum))
ggplot(data=mm,aes(x = factor(day),fill = factor(month), y = stepsum)) + geom_bar(stat = "identity",alpha=0.5)
```

![result](https://raw.githubusercontent.com/yelangya3826850/RepData_PeerAssessment1/master/figure/1.png)
# Loading and preprocessing the data
```{r}
for (i in 1:length(date))
{
    Median[i] <- median(data2$steps[which(data2$date == date[i])])
}
result <- data.frame(mean = Mean, median = Median, Date = date)
with(data2, plot(interval, steps/480, col = date))

for (i in 1:61)
{
    data4 <- data2[which(data2$date==date[i]),]
    with(data4, lines(interval,steps/480 , col = i))
}
```
![result](https://raw.githubusercontent.com/yelangya3826850/RepData_PeerAssessment1/master/figure/2.png)

```{r}
data2[which(data2$step == max(data2$step)),]
```
* result
      steps       date interval
16492   806 2012-11-27      615

# Imputing missing values
```{r}
number <- dim(data)[1] - sum(complete.cases(data))
Mean[which(Mean == "NaN")] <- 0
Mean[which(Mean == 0)] <- (Mean[which(Mean == 0)] + Mean[(which(Mean == 0) + 31)%%62])/2

for (i in c(1,8,32,35,40,41,45,61))
{
    data$steps[which(data$date == date[i])] <- Mean[i]
}

stepsum2 <- as.numeric()

for (i in 1:length(date))
{
  stepsum2[i] <- sum(data$steps[which(data$date == date[i])])
}

month <- as.POSIXlt(date)$mon + 1
day <- as.POSIXlt(date)$mday
stepsum2 <- data.frame(stepsum2,date,month,day)
mm <- ddply(stepsum2, "date", summarise, mmpg = sum(stepsum2))
ggplot(data=mm, aes(x = factor(day),fill = factor(month), y = mmpg)) + geom_bar(stat = "identity",alpha=0.5)
```
![result](https://raw.githubusercontent.com/yelangya3826850/RepData_PeerAssessment1/master/figure/3.png)
```{r}
workday <- as.character()
day <- weekdays(as.Date(data$date))
workday[which(day == "Sunday" | day == "Saturday")]  <- "weekend"
workday[which(day == "Monday" | day == "Tuesday" | day == "Wednesday"| day == "Thursday" | day == "Friday")]  <- "weekday"
Data <- data.frame(data,workday)


mmm <- ddply(Data, c("interval","workday"),summarise, steps = mean(steps))
nnn <- mmm[which(mmm$workday == "weekday"),]
nn <- mmm[which(mmm$workday == "weekend"),]
Data2 <- t(data.frame(t(nnn),t(nn)))
Data2 <- as.data.frame(Data2)
Data2$steps <- as.numeric(as.character(Data2$steps))
Data2$interval <- as.numeric(as.character(Data2$interval))
row.names(Data2) <- c()
library(lattice)
xyplot(Data2$steps ~ Data2$interval |Data2$workday, layout = c(1,1), type = "l")
xyplot(Data2$steps ~ Data2$interval |Data2$workday, layout = c(1,2), type = "l")
```
![result](https://raw.githubusercontent.com/yelangya3826850/RepData_PeerAssessment1/master/figure/4.png)


