fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

download.file(fileUrl, destfile="./datasets/acs.csv", method="curl")

acs <- read.table(file="./datasets/acs.csv", header=T, sep=",")

install.packages("sqldf")
library(sqldf)

sqldf("select PWGTP from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")


con = url("http://biostat.jhsph.edu/~jleek/contact.html")

htmlCode = readLines(con)
close(con)
htmlCode
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])




fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

download.file(fileUrl, destfile="./datasets/noaa.csv", method="curl")

noaa = read.fwf(
        file="./datasets/noaa.csv",
        skip = 4,
        widths = c(12, 7,4, 9,4, 9,4, 9,4))

head(noaa)
sum(noaa[4])

