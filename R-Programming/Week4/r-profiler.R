######### Using the R Profiler

# system.time()

# Elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))

# Elapsed time < user time... or close
hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
}

x = hilbert(1000)
system.time(svd(x))

system.time( {
        n = 1000
        r = numeric(n)
        for (i in 1:n) {
                x = rnorm(n)
                r[i] = mean(x)
        }
})


# Rprof() can do more than system.time() -- just don't use them together!!

# The summaryRprof() function tabulates the R profiler output and calculates how
# much time is spend in each function

# by.total vs by.self... top-level vs what it goes into





