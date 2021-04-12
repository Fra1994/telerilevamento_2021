# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
# install.packages("rasterVis")
library(raster)
library(rasterVis)

# library(rgdal)
setwd("c:/lab/Greenland")

lst_2000 <- raster("2000.tif")
lst_2005 <- raster("2005.tif")
lst_2010 <- raster("2010.tif")
lst_2015 <- raster("2015.tif")

# par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# list of files:
list.files()

rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist,raster)
import

TGr <- stack(import)
TGr
plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="lin")
plotRGB(TGr, 2, 3, 4, stretch="lin")
plotRGB(TGr, 4, 3, 2, stretch="lin")

levelplot(TGr)
