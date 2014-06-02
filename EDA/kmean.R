# A partitioning approach
        # Fix a number of clusters
        # Get "centroids" of each clusters
        # Assign things to the closest centroid
        # Recalculate centroids

# Requires:
        # A defined distance metric
        # A number of clusters
        # An initial guess as to cluster centroids 

# Produces:
        # Final estimate of cluster centroids
        # An assignment of each point to clusters. 


# Initialize points
set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each=4), sd=0.2)
y = rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd=0.2)
plot(x, y, col = 'blue', pch = 19, cex =2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))



df = data.frame(x = x, y = y)
kmeansObj = kmeans(df, centers=3)
names(kmeansObj)

# plot

par(mar = rep(0.2, 4))
plot(x, y, col=kmeansObj$cluster, pch=19, cex=2)
points(kmeansObj$cetners, col = 1:3, pch=3, cex=3, lwd=3)

# Heatmap using k-means

dataMatrix = as.matrix(df)[sample(1:12),]
kmeansObj2 = kmeans(dataMatrix, centers = 3)
par(mfrow = c(1, 2), mar = c(2, 4, 0.1, 0.1))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n")
