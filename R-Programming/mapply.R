# mapply is a multivariate apply of sorts which applies a function 
# in parallel over a set of arguments
str(mapply)

# instea of...
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))

# we can use mapply...
mapply(rep, 1:4, 4:1)

noise = function(n, mean, sd) {
   rnorm(n, mean, sd)     
}

noise(5, 1, 2) #we'd have to make a list of these calls to perform on different variables

# but mapply can condense that to one line
mapply(noise, 1:5, 1:5, 2)

