# R_code_copernicus.r
# Visualizing Copernicus data

# install.packages("ncfd4")
library(raster)
library(ncdf4)

# setwd("C:/lab/")

fcover <- raster("c_gls_FCOVER_202006130000_GLOBE_PROBAV_V1.5.1.nc")

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
plot(fcover, col=cl)

# resampling

fcoveres <- aggregate(fcover, fact=100)
plot(fcover, col=cl)

