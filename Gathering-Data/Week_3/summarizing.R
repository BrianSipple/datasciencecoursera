if (!file.exists("/.datasets")) {dir.create("./datasets")}
fileUrl = "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./datasets/restaurants.csv", method="curl")
restData = read.csv("./datasets/restaurants.csv")

head(restData, n=3)
tail(restData, n=6)

summary(restData)

str(restData)

quantile(restData$councilDistrict, na.rm=TRUE)

#Examine different probabilities of the distribution
quantile(restData$councilDistrict, probs=c(0.5, 0.75, 0.9))

table(restData$zipCode, useNA="ifany")

table(restData$councilDistrict, restData$zipCode)

is.na(restData)
colSums(is.na(restData))
all(colSums(is.na(restData)) == 0)

table(restData$zipCode %in% c("21212", "21213"))


restData[restData$zipCode %in% c("21212", "21213"),]


data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data=DF)     #Cross-tab: frequency in values, Gender along index and Admit along rows
xt

ftable(restData)

data(warpbreaks)

warpbreaks = as.data.frame(warpbreaks)
summary(warpbreaks)

warpbreaks$replicate = rep(1:9, len=54)

xt = xtabs(breaks ~., data=warpbreaks)   #breakdown by all variables
xt

ftable(xt)


fakeData = rnorm(1e5)


object.size(fakeData)


if(!require(installr)) {
        install.packages("installr"); require(installr) 
}

