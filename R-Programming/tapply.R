# tapply is used to apply a function over subsets of a vector
# Essentially, grouping and applying

str(tapply)

x = c(rnorm(10), runif(10), rnorm(10, 1))
f = gl(3, 10)  #factor variable... three levels, 10 times each

tapply(x, f, mean)

tapply(x, f, mean, simplify=FALSE)

tapply(x, f, range)
