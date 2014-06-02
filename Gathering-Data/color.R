library(grDevices)

pal = colorRamp(c('red', 'blue'))

pal(0)
pal(1)
pal(0.5)
pal(10)  # returns three NA's!!!... the spectrum can only be weighted between 0 and 1
pal(.03)


pal(c(0, .1, .2, 1))
pal(seq(0, 1, len=10))


pal = colorRampPalette(c("red", "yellow"))
pal(2)
pal(10) # Interpolation normalized over the amount of colors specified


# RColorBrewer lets us create our own color palettes
library(RColorBrewer)

cols = brewer.pal(3, "BuGn")    #returns a vectors of colors from the template we spcified
cols

pal = colorRampPalette(cols)
image(volcano, col=pal(20))


x = rnorm(10000)
y = rnorm(10000)
smoothScatter(x, y)


rgb(0, .2, 1)
rgb(0, .2, 1, .4)
plot(x, y, pch=19)

#alpha-ize!
plot(x, y, pch=19, col=rgb(0, 0, 0, 0.1))
