data(mtcars)
mtcars
auto_mtcars <- mtcars[mtcars$am == 0,]
manu_mtcars <- mtcars[mtcars$am == 1,]
print("The mean of auto mtcars is:" )

#均值手动好但是波动大
mean(auto_mtcars$mpg);var(auto_mtcars$mpg)
#[1] 17.14737
mean(manu_mtcars$mpg);var(manu_mtcars$mpg)
#[1] 24.39231

## Standard
y <- mtcars$mpg-mean(mtcars$mpg)/sd(mtcars$mpg)
x <- mtcars$disp-mean(mtcars$disp)/sd(mtcars$disp)

## univariate analysis
plot (mtcars$cyl, mtcars$mpg, xlab = "cyl",ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$cyl , data = mtcars),lwd = 2)
sumresid1 <- sum(resid(summary(lm(mtcars$mpg ~ mtcars$cyl,data = mtcars)))^2)
rho1 <- cor(mtcars$mpg, mtcars$cyl)

plot (mtcars$disp,mtcars$mpg, ylab = "MPG",xlab = "disp",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$disp, data = mtcars),lwd = 2)
sumresid2 <- sum(summary(lm(mtcars$mpg ~ mtcars$disp,data = mtcars))$resid^2)
rho2 <- cor(mtcars$mpg, mtcars$disp)

plot (mtcars$hp, mtcars$mpg,  xlab = "hp",ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$hp, data = mtcars),lwd = 2, col = "blue")
sumresid3 <- sum(summary(lm(mtcars$mpg ~ mtcars$hp,data = mtcars))$resid^2)
rho3 <- cor(mtcars$mpg, mtcars$hp)

plot (mtcars$drat,mtcars$mpg, xlab = "drat",ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$drat , data = mtcars),lwd = 2)
sumresid4 <- sum(summary(lm(mtcars$mpg ~ mtcars$drat,data = mtcars))$resid^2)
rho4 <- cor(mtcars$mpg, mtcars$drat)

plot (mtcars$wt,  mtcars$mpg, xlab = "wt",  ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$wt , data = mtcars),lwd = 2)
sumresid5 <- sum(summary(lm(mtcars$mpg ~ mtcars$wt,data = mtcars))$resid^2)
rho5 <- cor(mtcars$mpg, mtcars$wt)
fit5 <- lm(mtcars$mpg ~ mtcars$wt , data = mtcars)
summary(fit5)$coef

plot (mtcars$qsec,mtcars$mpg, xlab = "qsec",ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$qsec , data = mtcars),lwd = 2)
sumresid6 <- sum(summary(lm(mtcars$mpg ~ mtcars$qsec,data = mtcars))$resid^2)
rho6 <- cor(mtcars$mpg, mtcars$qsec)

plot (mtcars$vs,  mtcars$mpg, xlab = "vs",  ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$vs , data = mtcars),lwd = 2)
sumresid7 <- sum(summary(lm(mtcars$mpg ~ mtcars$vs,data = mtcars))$resid^2)
rho7 <- cor(mtcars$mpg, mtcars$vs)

plot (mtcars$am,  mtcars$mpg, xlab = "am",  ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$am, , data = mtcars),lwd = 2)
sumresid8 <- sum(summary(lm(mtcars$mpg ~ mtcars$am,data = mtcars))$resid^2)
rho8 <- cor(mtcars$mpg, mtcars$am)

plot (mtcars$gear,mtcars$mpg, xlab = "gear",ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$gear, data = mtcars),lwd = 2)
sumresid9 <- sum(summary(lm(mtcars$mpg ~ mtcars$gear,data = mtcars))$resid^2)
rho9 <- cor(mtcars$mpg, mtcars$gear)

plot (mtcars$carb,mtcars$mpg, xlab = "carb",ylab = "MPG",bg = "lightblue", col = "red", cex = 1, pch = 21, frame = F)
abline(lm(mtcars$mpg ~ mtcars$carb , data = mtcars),lwd = 2)
sumresid10 <- sum(summary(lm(mtcars$mpg ~ mtcars$carb,data = mtcars))$resid^2)
rho10 <- cor(mtcars$mpg, mtcars$carb)

sumresid <- c(sumresid1,sumresid2,sumresid3,sumresid4,sumresid5,sumresid6,sumresid7,sumresid8,sumresid9,sumresid10)
names(sumresid) <- c("sumresid1","sumresid2","sumresid3","sumresid4","sumresid5","sumresid6","sumresid7","sumresid8","sumresid9","sumresid10")
rho <- c(rho1,rho2,rho3,rho4,rho5,rho6,rho7,rho8,rho9,rho10)
names(rho) <- c("rho1","rho2","rho3","rho4","rho5","rho6","rho7","rho8","rho9","rho10")

choose <- which(abs(rho) >= 0.68)
mtcars_chose <- mtcars[ ,c(1,9,choose+1)]
auto_mtcars_chose <- auto_mtcars[ ,c(1,choose+1)]
manu_mtcars_chose <- manu_mtcars[ ,c(1,choose+1)]






pairs(mtcars_chose, lower.panel = panel.lm, upper.panel = panel.smooth, labels = names(mtcars_chose),
      diag.panel = panel.hist,col = (mtcars_chose$am)+3, main = "p" )# blue = manual   green = automatic
#col = (mtcars_chose$am)+3,
# from the picture we can see that "cyl", "disp", "hp", and "wt" are negatively correlated with "mpg"
# "drat" is positively correlated with "mpg"  
# we can also notice that blue points which represent manual cars have generally higher mpg than green points
# which represent automatic cars
# and we can also see that the "drat" variance distribution is like Gaussion distribution which means that
# it might have little relationship with others
# disp and wt linear relation
# disp and hp 二维 relation
# hp and wt have linear relationship

# residuals analysis


#plot(x, resid(lm(y ~ x))
#fit <- lm(mpg ~ cyl + disp + hp + drat + wt , data = mtcars)
#fit2 <- lm(mpg ~ )
#fit_no_intercept <- lm(mpg ~ cyl + disp + hp + drat + wt - 1, data = mtcars)
#sum(summary(fit)$resid^2)
#sum(summary(fit_no_intercept)$resid^2)

index <- which(sumresid == min(sumresid))# index of resid min
plot(mtcars$wt , resid(lm(mtcars$mpg ~ mtcars$wt , data = mtcars_chose)), lwd = 2,main = "Residuals of wt")
abline(h = mean(resid(lm(mtcars$mpg ~ mtcars$wt , data = mtcars_chose))), lwd = 2)

sumresid[order(sumresid)]
chose_rho <- rho[choose]
chose_rho[order(chose_rho)]
#########
sd5 <- sd(summary(lm(mtcars$mpg ~ mtcars$wt,data = mtcars))$resid)

## 1&5
fit15 <- lm(mpg ~ wt + cyl, data = mtcars_chose)
sd.15 <- sd(summary(fit15)$resid)
#[1] 2.483312
## 2&5
fit25 <- lm(mpg ~ wt + disp, data = mtcars_chose)
sd.25 <- sd(summary(fit25)$resid)
#[1] 2.820904
## 3&5
fit35 <- lm(mpg ~ wt + hp, data = mtcars_chose)
sd.35 <- sd(summary(fit35)$resid)
#[1] 2.508359
## 4&5
fit45 <- lm(mpg ~ wt + drat, data = mtcars_chose)
sd.45 <- sd(summary(fit45)$resid)
# 4 can be removed
#[1] 2.947067
## 2&1&5
fit125 <- lm(mpg ~ wt + cyl + disp, data = mtcars_chose)
sd.125 <- sd(summary(fit125)$resid)
#[1] 2.465847
## 3&1&5
fit135 <- lm(mpg ~ wt + cyl + hp, data = mtcars_chose)
sd.135 <- sd(summary(fit135)$resid)
#[1] 2.38693
#######test
plot(summary(fit135)$coef[1,1]+summary(fit135)$coef[1,2]*mtcars_chose$wt+summary(fit135)$coef[1,3]*mtcars_chose$cyl+summary(fit135)$coef[1,4]*mtcars_chose$hp
, summary(fit135)$resid)
abline(h = mean(summary(fit135)$resid))
#######

## 2&3&1&5
fit1235 <- lm(mpg ~ wt + cyl + disp + hp, data = mtcars_chose)
sd.1235 <- sd(summary(fit1235)$resid)
#[1] 2.344825


## 4&2&3&1&5
fit12345 <- lm(mpg ~ wt + cyl + disp + hp +drat, data = mtcars_chose)
sd.12345 <- sd(summary(fit12345)$resid)
sum(summary(fit12345)$resid^2)
#[1] 2.323971

## choose 1&3&23&5
fit13235 <- lm(mpg ~ wt + cyl + hp*disp + hp, data = mtcars_chose)
sd.13235 <- sd(summary(fit13235)$resid)
coe <- summary(fit13235)$coef[,1]




## draw residuals
x <- coe[1] + coe[2] * mtcars_chose$wt + coe[3] * mtcars_chose$cyl + coe[4] * mtcars_chose$hp + 
  coe[5] * mtcars_chose$disp + coe[6] * mtcars_chose$hp*mtcars_chose$disp
plot(x, summary(fit13235)$resid)
abline(h = mean(summary(fit13235)$resid))


## y and predict
y <- mtcars_chose$mpg
plot(x,y)
abline(lm(y~x) , lw = 2)

## confidence intervals
sumcoef <- summary(fit13235)$coefficients

confi_intvals1 <- sumcoef[1,1] + c(-1, 1) * qt(0.975, df = fit13235$df) * sumcoef[1,2]
confi_intvals2 <- sumcoef[2,1] + c(-1, 1) * qt(0.975, df = fit13235$df) * sumcoef[2,2]
confi_intvals3 <- sumcoef[3,1] + c(-1, 1) * qt(0.975, df = fit13235$df) * sumcoef[3,2]
confi_intvals4 <- sumcoef[4,1] + c(-1, 1) * qt(0.975, df = fit13235$df) * sumcoef[4,2]
confi_intvals5 <- sumcoef[5,1] + c(-1, 1) * qt(0.975, df = fit13235$df) * sumcoef[5,2]
confi_intvals6 <- sumcoef[6,1] + c(-1, 1) * qt(0.975, df = fit13235$df) * sumcoef[6,2]
confi_intvals <- data.frame(confi_intvals1,confi_intvals2,confi_intvals3,confi_intvals4,confi_intvals5,confi_intvals6)


sum(summary(fit13235)$resid^2)
#[1] 2.060229

fit13235 <- lm(mpg ~ wt + cyl + hp*disp + hp, data = mtcars_chose)
sd.13235 <- sd(summary(fit13235)$resid)


y <- mtcars_chose$mpg
plot(x,y)
abline(lm(y~x) , lw = 2)

## show result

yy <- coe[1] + coe[2] * mtcars_chose$wt + coe[3] * mtcars_chose$cyl + coe[4] * mtcars_chose$hp + 
  coe[5] * mtcars_chose$disp + coe[6] * mtcars_chose$hp*mtcars_chose$disp
plot(x,y,type = "p",col = (mtcars_chose$am)+3)


mean(yy[which(mtcars_chose$am==1)]) - mean(yy[which(mtcars_chose$am==0)]) 
var(yy[which(mtcars_chose$am==1)]) - var(yy[which(mtcars_chose$am==0)])



yy <- coe[1] + coe[2] * mtcars_chose$wt + coe[3] * mtcars_chose$cyl + coe[4] * mtcars_chose$hp + 
  coe[5] * mtcars_chose$disp + coe[6] * mtcars_chose$hp*mtcars_chose$disp








## pairs function

panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, ...)
}
#= "cyan"
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r+0.8)
}

panel.cor.scale <- function(x, y, digits=2, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r = (cor(x, y,use="pairwise"))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex * abs(r))
}
panel.lm=function(x,y,...)
{
    tmp <- lm(y ~ x,na.action = na.omit)
    abline(tmp, lw = 1, col = "red")
    points(x,y,...)
}
