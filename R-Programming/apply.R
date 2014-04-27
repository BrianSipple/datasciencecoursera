str(apply)
x = matrix(rnorm(200), 20, 10)
apply(x, 2, mean)  # column means: keep 2nd dimension (columns), and collapse over the rows
apply(x, 1, mean)  # row means: keep 1st dimension (rows), and collapse over the columns


apply(x, 1, quantile, probs=c(0.25, 0.75))

a = array(rnorm(2*2*10), c(2, 2, 10))  #array of 10 2x2 matrices
a

apply(a, c(1,2), mean)  #average over the 3rd dimension
#same as...
rowMeans(a, dims=2)
