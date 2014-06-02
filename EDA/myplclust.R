dataFrame = data.frame(x=1:12, y=1:12)
set.seed(143)
dataMatrix = as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)
