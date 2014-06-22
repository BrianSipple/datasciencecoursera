library(manipulate)
myPlot <- function(s) {
        plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
        abline(0, s)
}

myPlot(.1)


manipulate(myPlot(s), s = slider(0, 2, step=0.1))


#require(devtools)
#install_github('rCharts', 'ramnathv')

library(rCharts)
AQ = data.frame(airquality)
dTable(AQ, sPaginationType = "full_numbers")
