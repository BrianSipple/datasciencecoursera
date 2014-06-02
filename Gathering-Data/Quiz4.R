housing = read.csv("./data/idaho_housing.csv")
names(housing)

strsplit(names(housing), "wgtp")[123]



##### Question 2 ######

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="./data/GDP", method="curl")

GDP = read.csv("./data/GDP")
names(GDP)[2] = "rank"
GDP = GDP[5:194,]

values = GDP$X.3

values = as.character(values)
values = gsub(",", "", values)
values = as.numeric(values)
mean(values, na.rm=T)



##### Question 3 ######

# Use the correct file encoding when reading!

is_ok_enc = function() {
        fileEncodings = iconvlist()
        for (i in 1: length(fileEncodings)) {
                GDP = read.csv("./data/GDP", fileEncoding = fileEncodings[i])
                GDP = GDP[5:194,]
                if (sum(is.na(GDP$X.2)) == 0) {
                        countryNames = GDP$X.2
                        return (countryNames)
                }
        }
}

countryNames = is_ok_enc()
countryNames

length(grep("^United", countryNames))



#### Question 4 ######

GDP190 = read.csv("./data/gdp190.csv")
EDU = read.csv("./data/education190.csv")


merged = merge(GDP190, EDU, by = intersect(as.character(GDP190$CountryCode), as.character(EDU$CountryCode)))





#### Question 5 #####

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN", auto.assign=F)
sampleTimes = index(amzn)
sampleTimes
