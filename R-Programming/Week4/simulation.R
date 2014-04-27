# Simulation

qnorm(3, 4, lower.tail=TRUE, log.p=FALSE)
qnorm(100, 3, lower.tail=TRUE, log.p=F)


# random numbers
x = rnorm(10)
x

x = rnorm(10, 20, 2)  # 10 variables, mean=20, sd=2

set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

# Always set the random number seed when conducting a simulation!!!!!



rpois(10, 1)
rpois(10, 2)
rpois(10, 20)


ppois(4, 2)  # Cumulative distribution --- probablity that a poisson random variable is less than or equal to 4 with a rate of 2
ppois(7, 2)
ppois(20, 25)


##### Generating random numbers from a linear model #######
set.seed(20)
x = rnorm(100)  # predictor 
e = rnorm(100, 0, 2)  # epsilon
y = 0.5 + 2 * x + e   

summary(y)
plot(x, y)


# What if x is binary?

set.seed(10)
x = rbinom(100, 1, 0.5)
e = rnorm(100, 0, 2)
y = 0.5 + 2 * x + e

summary(y)
plot(x, y)


# Suppose we want to simulate from a Poisson model where ...

# Y ~ Poisson(u)   log u = b0 + b1x   b0 = 0.5, b1 = 0.3

# We need to use the rpois function for this

set.seed(1)
x = rnorm(100)
log.mu = 0.5 + 0.3 * x
y = rpois(100, exp(log.mu))

summary(y)
plot(x, y)


# sample function -- drawing randomly from a specific set of (scalar) objects 
set.seed(1)

sample(1:10, 4)  #sample 4 numbers without replacement from the vecotr 1:10
sample(1:10, 4)

sample(letters, 5)

sample(1:10)  #permutation
sample(1:10)

sample(1:10, replace=T)

