x  = list(a=1:5, b=rnorm(10))
x
lapply(x, mean)


x = list(a=1:4, b = rnorm(10), c=rnorm(20,1), d=rnorm(100,5))

lapply(x, mean)


x = 1:4
lapply(x, runif)[[1]]    #runif generates a specific number of random-uniform variables
lapply(x, runif)[[2]]
lapply(x, runif)[[3]]

x = 1:4
lapply(x, runif, min=0, max=10)

x = list(a=matrix(1:4, 2, 2), b=matrix(1:6, 3,2))
lapply(x, function(elt) elt[,1])  #anonymous funcion in the middle of an lapply call (here, taking the first column of x's a and b matrices)

x = list(a=1:4, b=rnorm(10), c=rnorm(20, 1), d=rnorm(100, 5))
lapply(x, mean)
sapply(x, mean)
                