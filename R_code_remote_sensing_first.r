# My first code in R for remote sensing
# Il mio primo codice in R per telerilevamento 

setwd("c:/lab/")

# install.packages("raster")
library(raster)

p224r63_2011 <- brick("p224r63_2011_masked.grd")

plot(p224r63_2011)
