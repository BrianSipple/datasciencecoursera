set.seed(12345)
par(mar = rep(0.2, 4))
dataMatrix = matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

heatmap(dataMatrix)

set.seed(678910)
for (i in 1:40) {
        #flip a coin
        coinFlip = rbinom(1, size = 1, prob = 0.5)
        if (coinFlip) {
                # Some rows on the right will have a mean of 3, others will have a mean of 0
                dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0, 3), each = 5)
        }
}

image(1:10, 1:40, t(dataMatrix) [, nrow(dataMatrix):1])

heatmap(dataMatrix)

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]


dataMatrix2 = dataMatrixOrdered

## Randomly insert some missing data
dataMatrix2[sample(1:100, size=40, replace=F)] <- NA
svd1 <- svd(scale(dataMatrix2)) ## Doesn't work!


# We can use the impute package from BioConductor
source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("impute")
library(impute) # bioconductor.org
dataMatrix2 = dataMatrixOrdered
dataMatrix2[sample(1:100, size=40, replace=F)] <- NA
dataMatrix2 <- impute.knn(dataMatrix2)$data
svd1 = svd(scale(dataMatrixOrdered))
svd2 = svd(scale(dataMatrix2))
par(mfrow = c(1, 2)); plot(svd1$v[,1], pch=19); plot(svd1$v[,1], pch=19)



#### Face example
load("data/face.rda")
image(t(faceData) [, nrow(faceData): 1])


