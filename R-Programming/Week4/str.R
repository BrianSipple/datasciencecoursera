# str() -- compact alternative to 'summary'

str(str)
str(lm)
str(ls)

x = rnorm(100, 2, 4)
summary(x)
str(x)

x = gl(40, 10)
str(x)
summary(x)

library(datasets)
head(airquality)
str(airquality)


m = matrix(rnorm(100), 10, 10)
str(m)
m[, 1]


s = split(airquality, airquality$Month)
str(s)
