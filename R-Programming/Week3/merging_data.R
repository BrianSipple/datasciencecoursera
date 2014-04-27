if (!file.exists("./datasets")) {dir.create("./datasets")}
fileUrl1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1, destfile="./datasets/reviews.csv", method="curl")
download.file(fileUrl2, destfile="./datasets/solutions.csv", method="curl")
reviews = read.csv("./datasets/reviews.csv")
solutions = read.csv("./datasets/solutions.csv")
head(reviews, 2)
head(solutions, 2)


#Merge!

names(reviews)
names(solutions)

mergedData <- merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)
head(mergedData)

intersect(names(solutions), names(reviews))

mergedData2 = merge(reviews, solutions, all=TRUE)
head(mergedData2)


# join in the plyr package

df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
df1
df2
arrange(join(df1,df2), id)


df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), y=rnorm(10))
df3 = data.frame(id=sample(1:10), z=rnorm(10))
dfList = list(df1, df2, df3)
join_all(dfList) # Merges all the dataframes on the common variables... in this case, id


