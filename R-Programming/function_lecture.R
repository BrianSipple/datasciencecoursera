add2 = function(x, y) {
        x + y   #funciton will always return the last expression
}

above10 = function(x) {
        use <- x > 10
        x[use]
}

above = function(x, n) {
        use = x > n
        x[use]
}

columnmean = function(y, removeNA = TRUE) {
        nc = ncol(y)
        means = numeric(nc)
        
        for (i in 1:nc){
                means[i] = mean(y[, i], na.rm = removeNA)
        }
        means
}

######## Scoping #########

# This function returns another function as its value
make.power = function(n) {
        pow = function(x) {
                x^n
        }
        pow
}

cube = make.power(3)
square = make.power(2)
cube(3)
square(2)

ls(environment(cube))
get('n', environment(cube))



#### Vectorized operations #####

x <- 1:4; y <- 6:9
x + y
x>2
x >= 2
x * y
x / y

x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x*y
x/y

# true matix mult:
x %*% y
