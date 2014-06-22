install.packages("AppliedPredictiveModeling")
library(AppliedPredictiveModeling)
library(caret)

##### Question 1 ######

adData = data.frame(predictors)

trainIndex = createDataPartition(diagnosis, p=.5, list=F)
training = adData[trainIndex,]
testing = adData[-trainIndex,]


######### Question 2 ###########

# Make a plot of the outcome (CompressiveStrength) versus the index 
# of the samples. Color by each of the variables in the data set 

data(concrete)
library(caret)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain, ]
#plot(inTrain, training$CompressiveStrength)

#model = train(CompressiveStrength ~., data=training, method="glm")
#model

library(Hmisc)

cutCS = cut2(training$CompressiveStrength, g=4)
table(cutCS)

samples = rownames(training)
sampleNums = as.numeric(samples)


namevec = names(training)[names(training) != "Compressive Strength"]

# Turn continuous variables in continuous ones using the cut function, then we can color by
# them in our plot
cutFlyAsh = cut2(training$FlyAsh, g = 6)
cutSP = cut2(training$Superplasticizer, g = 6)
cutAge = cut2(training$Age, g = 6)
cutWater = cut2(training$Water, g = 6)

p1 = qplot(sampleNums, CompressiveStrength, data=training, color = cutFlyAsh)
p1

p2 = qplot(sampleNums, CompressiveStrength, data=training, color = cutSP)
p2

p3 = qplot(sampleNums, CompressiveStrength, data=training, color = cutAge)
p3

p4 = qplot(sampleNums, CompressiveStrength, data=training, color = cutWater)
p4




############## Question 3 ####################

# Make a histogram and confirm the SuperPlasticizer variable is skewed. 
# Normally you might use the log transform to try to make the data 
# more symmetric. Why would that be a poor choice for this variable?

qplot(Superplasticizer, data=training, method="hist")

# ANSWER: Log of 0 == undefined (-Inf)



################### Question 4 - Alzheimer Dataset ###################

set.seed(3433)
library(AppliedPredictiveModeling); library(kernlab); library(caret)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]


# Find all the predictor variables in the training set that begin with IL. 
# Perform principal components on these variables with the 
# preProcess() function from the caret package. 
# Calculate the number of principal components needed to 
# capture 90% of the variance. How many are there?

predIndex = grep("^IL.*", names(training))
names(training[predIndex])

preObj = preProcess(training[, predIndex], method=c("pca"), thresh=.9)
preObj 

### ANSWER: 9 components need to capture 90 percent of the variance

# But let's go even further!

predict(preObj)

########## Question 5 ###################

# Create a training data set consisting of only the predictors with variable 
# names beginning with IL and the diagnosis. Build two predictive models, 
# one using the predictors as they are and one using PCA with principal 
# components explaining 80% of the variance in the predictors. 
# Use method="glm" in the train function. 
# What is the accuracy of each method in the test set? Which is more accurate?


# Create a substeed training and test set using only diagnosis and the IL-prefixed
# columns as predictors

myPredictorsIndex = grep("^IL.*", names(adData))

###### Without PCA
subTrain = training[, c(1, myPredictorsIndex)]
subTest = testing[, c(1, myPredictorsIndex)]

modelFit = train(subTrain$diagnosis ~., data=subTrain, method="glm")
confusionMatrix(subTest[,1], predict(modelFit, subTest))


## With PCA

#preProcess
preProc = preProcess(subTrain[,-1], method="pca", thresh=.8)
trainingPreds = predict(preProc, subTrain[,-1])
modelFit = train(subTrain$diagnosis ~., method="glm", data=trainingPreds)

testPreds = predict(preProc, subTest[,-1]) 
confusionMatrix(subTest[,1], predict(modelFit, testPreds))




