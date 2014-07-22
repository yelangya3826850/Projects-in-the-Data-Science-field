# Machine Learning

## Reading Data
TrainData <- read.table("C:/Users/mn/Documents/MachineLearning/pml-training.csv", sep = ",", header = T)
TestData  <- read.table("C:/Users/mn/Documents/MachineLearning/pml-testing.csv", sep = ",", header = T)

## Extract Data
tt <- TrainData$X[complete.cases(TrainData)]

yy <- read.csv("C:/Users/mn/Documents/MachineLearning/pml-training.csv", sep = ",", header = T, na.strings = "NA")































