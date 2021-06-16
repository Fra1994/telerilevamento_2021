# R_code_spectral_signatures_temp.r

library(raster)
library(rgdal)
library(ggplot2)

setwd("C:/lab/")

defor2 <- brick("defor2.jpg")

# defor 2.1, defor 2.2, defor 2.3
# NIR, red, green

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="hist")

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

# results:
#   x     y   cell defor2.1 defor2.2 defor2.3
# 1 150.5 246.5 165778      199       11       26
#   x     y   cell defor2.1 defor2.2 defor2.3
# 1 622.5 209.5 192779       74       89      122

# define the columns of the dataset:
band <- c(1,2,3)
forest <- c(199,11,26)
water <- c(74,89,122)

# create the dataframe    
spectrals <- data.frame(band, forest, water)

# plot the sepctral signatures
ggplot(spectrals, aes(x=band)) +
 geom_line(aes(y=forest), color="green") +
 geom_line(aes(y=water), color="blue") +
 labs(x="band",y="reflectance")

############# Multitemporal

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

# spectral signatures defor1
click(defor1, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

#  x     y   cell defor1.1 defor1.2 defor1.3
# 1 50.5 335.5 101439      213        7       28
#  x     y   cell defor1.1 defor1.2 defor1.3
# 1 65.5 331.5 104310      212       11       29
#  x     y   cell defor1.1 defor1.2 defor1.3
# 1 43.5 333.5 102860      194       10       22
#  x     y   cell defor1.1 defor1.2 defor1.3
# 1 92.5 331.5 104337      209       13       27
#  x     y  cell defor1.1 defor1.2 defor1.3
# 1 90.5 369.5 77203       235       19       42

# time t2
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#  x     y   cell defor2.1 defor2.2 defor2.3
# 1 87.5 331.5 104770      171      152      148
#  x     y   cell defor2.1 defor2.2 defor2.3
# 1 100.5 330.5 105500     161      164      143
#  x     y  cell defor2.1 defor2.2 defor2.3
# 1 107.5 341.5 97620      207      199      176
#  x     y   cell defor2.1 defor2.2 defor2.3
# 1 98.5 314.5 116970      162      159      142
#  x     y   cell defor2.1 defor2.2 defor2.3
# 1 97.5 300.5 127007      191       92      113

# define the columns of the dataset:
band <- c(1,2,3)
time1 <- c(213,7,28)
time1p2 <- c(212,11,29)
time2 <- c(171,152,148)
time2p2 <- c(161,164,143)

spectralst <- data.frame(band, time1, time2, time1p2, time2p2)

ggplot(spectrals, aes(x=band)) +
 geom_line(aes(y=time1), color="red", linetype="dotted") +
 geom_line(aes(y=time1p2), color="red", linetype="dotted") +
 geom_line(aes(y=time2), color="gray", linetype="dotted") +
 geom_line(aes(y=time2p2), color="gray", linetype="dotted") +
 labs(x="band",y="reflectance")
 
# image from Earth observatory 
eo <- brick("june_puzzler.jpg")
plotRGB(eo, 1,2,3, stretch="hist")
click(eo, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

# x     y  cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 83.5 398.5 58404            220            209              6
# x     y   cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 108.5 140.5 244189           28            141              7
# x     y  cell june_puzzler.1 june_puzzler.2 june_puzzler.3
# 1 182.5 378.5 72903            45             36             27

# define the columns of the dataset:
band <- c(1,2,3)
stratum1 <- c(220,209,6)
stratum2 <- c(28,141,7)
stratum3 <- c(45,36,27)
 
spectralsg <- data.frame(band, stratum1, stratum2, stratum3)

ggplot(spectralsg, aes(x=band)) +
 geom_line(aes(y=stratum1), color="yellow") +
 geom_line(aes(y=stratum2), color="green") +
 geom_line(aes(y=stratum3), color="blue") +
 labs(x="band",y="reflectance")

#------------------------------------------------ 
 
 
 
 
