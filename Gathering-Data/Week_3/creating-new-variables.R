setwd("/Users/BrianSipple/Development/R/datasciencecoursera/Gathering-Data/")

if(!file.exists("./datasets")) {dir.create("./datasets")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./datasets/restaurants.csv", method="curl")
restData <- read.csv("./datasets/restaurants.csv")

# Creating seuqences

s1 = seq(1, 10, by=2) ; s1
s2 = seq(1, 10, length=3) ; s2

x <- c(1, 3, 8, 25, 100) ; seq(along=x)

# Subsetting variables
restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)


# Creating binary variables
restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# Creating categorical variables
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups, restData$zipCode)

# Better way to cut... cut2
library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)

# Creating factor variables
restData$zcf = factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)

# Levels of factor variables
yesno = sample(c("yes", "no"), size=10, replace=TRUE)
yesno
yesnofactor = factor(yesno, levels=c('yes', 'no'))
yesnofactor
relevel(yesnofactor, ref='yes')

as.numeric(yesnofactor)


# Using the mutate function to create a new version of a variable and simultaneously
# add it to a dataset
library(Hmisc); library(plyr)
restData2 = mutate(restData, zipGroups=cut2(zipCode, g=4))
table(restData2$zipGroups)


