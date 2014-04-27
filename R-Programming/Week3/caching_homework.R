# Let's cache time-consuming operations, so that if they're entered multiple
# times for the same input, we can just perform a lookup for that input's 
# correct value to better optimize our performance

# In this example we introduce the <<- operator which can be used to assign a
# value to an object in an environment that is different from the 
# current environment. Below are two functions that are used to create a special object 
#that stores a numeric vector and cache's its mean.


makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {                 #set x to y
                x <<- y
                m <<- NULL
        }
        get <- function() x                   # Get a value that we 'set'
        setmean <- function(mean) m <<- mean  # This will enable us to set the mean in the cache if it's not there
        getmean <- function() m               # This will enable us to get the mean from the cache if it is.
        
        # Return all of this beautiful logic
        list(set = set, get = get,            
             setmean = setmean,
             getmean = getmean)
}

# The following function calculates the mean of the special "vector" created 
# with the above function. However, it first checks to see if the mean has 
# already been calculated. If so, it gets the mean from the cache and 
# skips the computation. Otherwise, it calculates the mean of the data 
# and sets the value of the mean in the cache via the setmean function.

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        # if we can't get the mean from the cache, calculate one and then save it in the cache.
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

# And now for the challenge... cachcing matrix inversion!


# Make a special matrix that can cache its inverse
makeCacheMatrix <- function(mat = matrix()) {
        inv <- NULL  #placeholder for our matrix
        
        set <- function(y) {
                mat <<- y
                inv <<- NULL     
        }
        
        get <- function() mat  #return the invserse
        setInverse <- function(inverse) inv <<- inverse  #if we have computed an inverse, toss it to setInverse to apply it to inv
        getInverse <- function() inv
        
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}



cacheSolve <- function(mat, ...) {
        inv <- mat$getInverse()  #Attempt cache retrieval
        if (!is.null(inv)){
                message("Getting cached inverted matrix")
                return(inv)
        }
        
        # If we didnt find one, we need to make one
        data <- mat$get()     
        if (!is.matrix(data)){
                return("Data is not a matrix!")
        }
        inv <- solve(data,...)   #R's solve function will invert a matrix
        mat$setInverse(inv)  # We have our inverse! Now cache...
        inv   #... and return!
}

# Test Code

a = makeCacheMatrix(matrix(1:4, 2))
a$get()
a$getInverse()
a$set(matrix(5:8, 2))
a$get()
cacheSolve(a)
cacheSolve(a)
a$getInverse()


# Test Inverse Correctness

b = a$getInverse()
a$get() %*% b
