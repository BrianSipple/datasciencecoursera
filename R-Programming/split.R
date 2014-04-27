# split takes a vector or other object and splits it into groups
# determined by a factor or list of factors

str(split)

x = c(rnorm(10), runif(10), rnorm(10,1))
f = gl(3, 10)

split(x, f)

lapply(split(x, f), mean) #since split returns a list, we can use lappy or sapply with it

library(datasets)
head(airquality)

#split into monthly pieces and calculate colmeans
s = split(airquality, airquality$Month)
s
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm=TRUE))


# Splitting on more than one level
x = rnorm(10)
f1 = gl(2, 5)
f2 = gl(5, 2)
f1
f2
interaction(f1, f2)

str(split(x, list(f1, f2)))

str(split(x, list(f1, f2), drop = TRUE))
