run_analysis <- function()
{

##-------------- Part1 
## read data
Activities <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = "character",nrow = 7)
Features <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character", nrow = 561)

## read train data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", nrow = 7352)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = "numeric",nrow = 7352)
names(X_train) <- Features[,2]
Training_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", nrow = 7352)
names(Training_labels ) <- "TrainLabel"
names(subject_train) <- "TrainSubject"
train_data <- data.frame(subject_train, Training_labels, X_train)

## read test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", nrow = 2974)
X_test  <- read.table("./UCI HAR Dataset/test/X_test.txt", nrow = 2974)
names(X_test) <- Features[,2]
Test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", nrow = 2974)
names(Test_labels ) <- "TestLabel"
names(subject_test) <- "TestSubject"
test_data <- data.frame(subject_test, Test_labels,X_test)
merge_data <- merge(train_data, test_data,all = TRUE)
###-------------------------

###--------------------Part2
index <- c(grep(".mean.", names(merge_data)),grep(".std.", names(merge_data)))
mean_std_data <- merge_data[,index]
###----------------------

###---------------------Part3&Part4
Labels <-  merge_data$TrainLabel
Labels[is.na(Labels)] <- merge_data$TestLabel[is.na(Labels)]
Subject <- merge_data$TrainSubject
Subject[is.na(Subject)] <- merge_data$TestSubject[is.na(Subject)]
LabelName <- as.character(dim(Labels))
for (i in 1:dim(Activities)[1])
  LabelName[Labels == i] = Activities[i,2]


mean_std_data <- data.frame(Subject,Activities = LabelName,ActivitiesLabel = Labels,mean_std_data)
###--------------------------------


##---------------Part5


Average <- data.frame()

for (i in 1: max(Subject))
{
  temp <- mean_std_data[which(mean_std_data$Subject == i),]
  for (j in 1:max(Labels))
  {
      temp2 <- temp[which(temp$ActivitiesLabel == j),]
      temp2 <- apply(temp2[,4:82],2,mean)
      temp2 <- c("Subject" = i,"ActivitiesLabel" = j, temp2)
      if (i == 1 & j == 1)
      {
        Average <- as.data.frame(temp2)
      }else
        Average = data.frame(Average,temp2)
  }
}

Average = t(Average)
row.names(Average) <- c()

## Output result
write.table(Average, file = "Average.txt", sep = "\t", row.names = FALSE, col.names = TRUE)
write.table(Average, file = "Average.csv", sep = ",", row.names = FALSE, col.names = TRUE)
View(Average)
Average

}




