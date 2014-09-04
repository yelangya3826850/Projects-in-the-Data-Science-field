library(UsingR)
data(diamond)
diamond
plot(diamond$carat, diamond$price,xlab = "Mass(carats)",ylab = "Price(SIN $)",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(price ~ carat, data = diamond), lwd = 2)


fit <- lm(price ~ carat , data = diamond)
coef(fit)
fit3 <- lm(price ~ I(carat * 10), data = diamond)
coef(fit3)

newx <- c(0.16,0.27,0.34)
coef(fit)[1] + coef(fit)[2] * newx
predict(fit,newdata = data.frame(carat = newx))

library(datasets) ;data(swiss); require(stats); require(graphics)
pairs(swiss,panel  =  panel.smooth, main ="Swissdata", col=3+(swiss$Catholic >50))
summary(lm(Fertility ~ . , data = swiss))






data(iris)
library(ggplot2)
library(caret)
inTrain <- createDataPartition(y <- iris$Species,
                               p = 0.7,list = F)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
modFit <- train(Species~.,data=training, method = 'rf',prox = T)
modFit
getTree(modFit$finalModel, k =2)

irisP <- classCenter(training[,c(3,4)],training$Species, modFit$finalModel$prox)
irisP <- as.data.frame(irisP); irisP$Species <- rownames(irisP)
p <- qplot(Petal.Width, Petal.Length, col = Species, data  =training)
p + geom_point(aes(x=Petal.Width,y=Petal.Length,col=Species),size=5,shape=4,data=irisP)
pred <- predict(modFit,testing); testing$predRight <- pred==testing$Species
table(pred,testing$Species)
qplot(Petal.Width,Petal.Length,colour = predRight,data = testing,main="newdata Predictions")



test = iris[ c(1:10, 51:60, 101:110), ]
train = iris[ c(11:50, 61:100, 111:150), ]
r = randomForest(Species ~., data=data, importance=TRUE, do.trace=100)
















