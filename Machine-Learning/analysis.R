# Machine Learning
#install.packages("caret")
library(caret)
## Reading Data
TrainData <- read.table("C:/Users/mn/Documents/MachineLearning/pml-training.csv", sep = ",", header = T)
TestData  <- read.table("C:/Users/mn/Documents/MachineLearning/pml-testing.csv", sep = ",", header = T)

## Extract Data
FindBlank <- function(x)
{
    index1 <- any(is.na(x))
    index2 <- any(which(x ==""))
    any(index1, index2)
}

TrainData <- TrainData[,!apply(TrainData, 2, FindBlank)]
TestData  <- TestData [,!apply(TestData,  2, FindBlank)]


## Data preprocessing
preObj_traindata <- preProcess(TrainData[,7:59],method = c("center","scale"))
preObj_TestData <- preProcess(TestData[,7:59],method = c("center","scale"))
std_TrainData <- predict(preObj_traindata,(TrainData[,7:59]))
std_TestData <- predict(preObj_TestData,(TestData[,7:59]))


## PCA

Pca_trans <- function(Data, percent)
{
    prComp <- prcomp(Data ,center = FALSE, scale. = FALSE,)
    index <- 1: (sum(!summary(prComp)$importance[3,] > percent) + 1)
    PCAData <- prComp$x[,index]
    PCAData 
}

temp <- data.frame(t(std_TrainData),t(std_TestData))
temp <- t(temp)

PCAtrainData  <- Pca_trans(temp, 0.99)[1:dim(TrainData)[1],]
PCAtestData   <- Pca_trans(temp, 0.99)[-(1:dim(TrainData)[1]),]

## classify

PCAtrainData <- data.frame(PCAtrainData, Class = TrainData$classe)

## data slicing
Pick <- createDataPartition(y = PCAtrainData$Class, p = 0.2, list = FALSE)
PPCAtrainData <- PCAtrainData[Pick,]

inTrain <- createDataPartition(y = PPCAtrainData$Class, p = 0.75, list = FALSE)
training <- PPCAtrainData[inTrain,]
testing <- PPCAtrainData[-inTrain,]



trControl <- trainControl(method = "LOOCV",p = 0.75, horizon = 1)

set.seed(1235)
modelFit <- train(Class ~ ., data = training, method = "rf", prox = TRUE, trControl = trControl)
modelFit

## Gettign a single tree
getTree(modelFit$finalModel, k =2)

## sample error
set.seed(4235)
modelFit1 <- train(Class ~ ., data = training[c(1:20,850:870,1600:1620,2380:2400,2420:2440),], method = "rf", prox = TRUE, trControl = trControl)
pred1 <- predict(modelFit1,testing[c(1:5,300:305,500:505,690:695,900:905),])
predRight1 <- pred1 == testing[c(1:5,300:305,500:505,690:695,900:905),]$Class
Accuracy1 <- sum(predRight1)/length(predRight1)
Accuracy1
data.frame(pred1,test1 = testing[c(1:5,300:305,500:505,690:695,900:905),]$Class,predRight1 )

set.seed(5235)
modelFit2 <- train(Class ~ ., data = training[c(1:20,850:870,1600:1620,2380:2400,2420:2440),], method = "rf", prox = TRUE, trControl = trControl)
pred2 <- predict(modelFit2,testing[c(1:5,300:305,500:505,690:695,900:905),])
predRight2 <- pred2 == testing[c(1:5,300:305,500:505,690:695,900:905),]$Class
Accuracy2 <- sum(predRight2)/length(predRight2)
Accuracy2
data.frame(pred2,test2 = testing[c(1:5,300:305,500:505,690:695,900:905),]$Class,predRight2 )

error_internal <- Accuracy1 - Accuracy2
error_internal


set.seed(6235)
modelFit3 <- train(Class ~ ., data = training[c(20:40,870:890,1620:1640,2360:2380,2440:2460),], method = "rf", prox = TRUE, trControl = trControl)
pred3 <- predict(modelFit3,testing[c(5:10,305:310,505:510,695:700,905:910),])
predRight3 <- pred3 == testing[c(5:10,305:310,505:510,695:700,905:910),]$Class
Accuracy3 <- sum(predRight3)/length(predRight3)
Accuracy3
data.frame(pred3,test3 = testing[c(5:10,305:310,505:510,695:700,905:910),]$Class,predRight3 )

error_external <- Accuracy1 - Accuracy3
error_external


## Feature sample error
set.seed(7235)
modelFit4 <- train(Class ~ ., data = training[c(1:20,850:870,1600:1620,2380:2400,2420:2440),c(1:8,38)], method = "rf", prox = TRUE, trControl = trControl)
pred4 <- predict(modelFit4,testing[c(1:5,300:305,500:505,690:695,900:905),c(1:8,38)])
predRight4 <- pred4 == testing[c(1:5,300:305,500:505,690:695,900:905),c(1:8,38)]$Class
Accuracy4 <- sum(predRight4)/length(predRight4)
Accuracy4
data.frame(pred4,test4 = testing[c(1:5,300:305,500:505,690:695,900:905),c(1:8,38)]$Class,predRight4 )

set.seed(8235)
modelFit5 <- train(Class ~ ., data = training[c(1:20,850:870,1600:1620,2380:2400,2420:2440),c(1:8,38)], method = "rf", prox = TRUE, trControl = trControl)
pred5 <- predict(modelFit5,testing[c(1:5,300:305,500:505,690:695,900:905),c(1:8,38)])
predRight5 <- pred5 == testing[c(1:5,300:305,500:505,690:695,900:905),c(1:8,38)]$Class
Accuracy5 <- sum(predRight5)/length(predRight5)
Accuracy5
data.frame(pred5,test5 = testing[c(1:5,300:305,500:505,690:695,900:905),c(1:8,38)]$Class,predRight5 )

Ferror_internal <- Accuracy4 - Accuracy5
Ferror_internal


set.seed(9235)
modelFit6 <- train(Class ~ ., data = training[c(1:20,850:870,1600:1620,2380:2400,2420:2440),c(9:16,38)], method = "rf", prox = TRUE, trControl = trControl)
pred6 <- predict(modelFit6,testing[c(1:5,300:305,500:505,690:695,900:905),c(9:16,38)])
predRight6 <- pred3 == testing[c(1:5,300:305,500:505,690:695,900:905),c(9:16,38)]$Class
Accuracy6 <- sum(predRight6)/length(predRight6)
Accuracy6
data.frame(pred6,test6 = testing[c(1:5,300:305,500:505,690:695,900:905),c(9:16,38)]$Class,predRight6)

Ferror_external <- Accuracy4 - Accuracy6
Ferror_external

















## Class "centers"

trainP <- classCenter(training[,1:37],training$Class, modelFit$finalModel$prox)
trainP <- as.data.frame(trainP);
trainP$Class <- rownames(trainP)
p <- qplot(PC1,PC2,col = Class, data= training)
p + geom_point(aes(x = PC3, y = PC4,col = Class),size = 5, shape = 4, data = trainP)


pred <- predict(modelFit,testing); testing$predRight <- pred==testing$Class
table(pred, testing$Class)

Accuracy <- sum(testing$predRight)/length(testing$predRight)



answers <- predict(modelFit,PCAtestData);







