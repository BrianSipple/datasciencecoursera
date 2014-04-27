library(reshape2)
head(mtcars)

#Melt the dataset
mtcars$carname = rownames(mtcars)


carMelt = melt(mtcars, id=c('carname', 'gear', 'cyl'), measure.vars=c('mpg', 'hp')) #which varables are id? which variables are measure variables?

# carMelt now has one row for every mpg, and one row for every 'hp'
head(carMelt, n=3)
tail(carMelt, n=3)


# Casting data frames
cylData = dcast(carMelt, cyl~variable, length)
cylData

cylData = dcast(carMelt, cyl~variable, mean)
cylData


# Averaging values
head(InsectSprays)
# Apply to count... along the index spray... a sum
tapply(InsectSprays$count, InsectSprays$spray, sum)



# Split, Apply, Combine
# Split
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns
#Apply
sprCount = lapply(spIns, sum)
sprCount
# Combine
unlist(sprCount)
sapply(spIns, sum)  #we could also split and apply with sapply


# Another way: the plyr package
ddply(InsectSprays, .(spray), summarize, sum=sum(count))        #variable to summarize is in .()


# ddply to create a new variable
# this calculates the sum for each variety of spray, and then lists that sum for all that variables values
spraySums = ddply(InsectSprays,.(spray), summarize, sum=ave(count, FUN=sum))
dim(spraySums)
head(spraySums)
spraySums



