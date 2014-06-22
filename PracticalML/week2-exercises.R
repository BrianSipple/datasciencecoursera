library(caret); library(kernlab); data(spam)
inTrain <- createDataPartition(y = spam$type, p = .75, list=F)
training = spam[inTrain,]
testing = spam[-inTrain,]
dim(training)

#K-fold

set.seed(32323)
folds = createFolds(y = spam$type, k=10, list = T, returnTrain=T)
sapply(folds, length)
folds[[6]][[60]]

# Return test

folds = createFolds(y = spam$type, k=10, list=T, returnTrain=F)
sapply(folds, length)


# Resampling

folds = createResample(y = spam$type, times=10, list=T)
sapply(folds, length)

# Times slices

set.seed(32323)
tme = 1:1000
folds = createTimeSlices(y = tme, initialWindow=20, horizon=10)
names(folds)
sapply(folds, length)
folds$train[[1]]
folds$train[[2]]

folds$test[[1]]
folds$test[[2]]



###### So many ways to slice... and then we train!

library(caret); library(kernlab); data(spam)

inTrain = createDataPartition(y = spam$type, p = 0.75, list=F)
training = spam[inTrain,]
testing = spam[-inTrain,]
modelFit = train(type ~., data=training, method="glm")


# And then we can plot predictors
library(ISLR); library(ggplot2); library(caret); 
data(Wage)
summary(Wage)

inTrain = createDataPartition(y = Wage$wage, p = 0.7, list=F)

training = Wage[inTrain,]
testing = Wage[-inTrain,]
dim(testing); dim(training)

featurePlot(x = training[, c("age", "education", "jobclass")],
            y = training$wage,
            plot = "pairs")

qplot(age, wage, color = jobclass, data=training)

qq = qplot(age, wage, color=education, data=training)
qq + geom_smooth(method = 'lm', formula=y~x)


cutWage = cut2(training$wage, g=3)
table(cutWage)

p2 = qplot(cutWage, age, data=training, fill=cutWage, geom=c("boxplot", "jitter"))
p2

t1 = table(cutWage, training$jobclass)
t1


prop.table(t1, 1)

qplot(wage, color=education, data=training, geom="density")


### Processing and training
