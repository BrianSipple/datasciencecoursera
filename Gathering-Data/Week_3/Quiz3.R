fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="./data/idaho_housing.csv", method="curl")
dat = read.csv('./data/idaho_housing.csv')


agricultureLogical = (dat$ACR == "3" & dat$AGS == "6")
which(agricultureLogical)

install.packages('jpeg')
library(jpeg)
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg" 
download.file(fileUrl, destfile='./data/jeff.jpg', method='curl')
pic = readJPEG("./data/jeff.jpg", native=T)
pic
quantile(pic, probs = seq(.3, 1, .1))


fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="./data/gdp190.csv", method="curl")
gdp = read.csv("./data/gdp190.csv")

fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" 
download.file(fileUrl, destfile="./data/education190.csv", method="curl")
education = read.csv("./data/education190.csv")

# Filter out the entries without a numeric rank value
names(gdp)[2] = "rank"
gdp$rank = as.character(gdp$rank)
# Build ze logical vector!
actualRanks = gdp$rank != ""
actualRanks = as.numeric(gdp$rank) == "NA"
actualRanks = !is.na(actualRanks)

gdp = gdp[actualRanks,]

merged = merge(gdp, education, by.x = "X", by.y = "CountryCode", 
               all=F, sort=F)

sort(merged$gdp, decreasing=TRUE, na.last=T)



mergedEdu = merge(merged, education, by.x="X", by.y = "CountryCode")

#subset
highIncOECD = subset(mergedEdu, Income.Group.x == "High income: OECD")
highIncNonOECD = subset(mergedEdu, Income.Group.x == "High income: nonOECD")

str(highIncOECD)
highOranks = as.numeric(highIncOECD$rank)
mean(highOranks)

highNonORanks = as.numeric(highIncNonOECD$rank)
mean(highNonORanks)


# 5
# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?

merged$rank = as.numeric(merged$rank)
library(Hmisc)
merged$rankGroups = cut2(merged$rank, g=5)
table(merged$rankGroups)
table(merged$rankGroups, merged$Income.Group)
