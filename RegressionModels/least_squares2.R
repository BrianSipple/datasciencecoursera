install.packages("UsingR")
library(UsingR)
y = galton$child
x = galton$parent

beta1 = cor(y, x) * sd(y) / sd(x)
beta0 = mean(y) - beta1*mean(x)
rbind(c(beta0, beta1), coef(lm(y~x)))


# Regression thorugh the origin yields an equivalent slope if you center the data first

yc = y - mean(y)
xc = x - mean(x)
beta1 = sum(yc * xc) / sum(xc ^ 2)
c(beta1, coef(lm(y~x))[2])


# Regression to the mean

data(father.son)
y = (father.son$sheight - mean(father.son$sheight)) / sd(father.son$sheight)
x = (father.son$fheight - mean(father.son$fheight)) / sd(father.son$fheight)
rho = cor(x, y)

myPlot = function(x, y) {
        plot(x, y, 
             xlab = "Father's height, normalized",
             ylab = "Son's height, normalized",
             xlim = c(-3, 3), ylim = c(-3, 3),
             bg = "lightblue", col = "black", cex = 1.1, pch = 21,
             frame = F)
}

myPlot(x, y)
abline(0, 1)
abline(0, rho, lwd = 2)
abline(0, 1 / rho, lwd=2)
abline(h = 0)
abline(v = 0)
