# R_code_land_cover.r

library(raster)
library(RStoolbox) # classification
# install.packages(ggplot2)
library(ggplot2)
# install.packages("gridExtra")
library(gridExtra)

setwd("C:/lab/")

# NIR 1, RED 2, GREEN 3

defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

# dev.off()

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# multiframe with ggplot2 and gridExtra

p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)

# unsupervised classification 

d1c <- unsuperClass(defor1, nClasses=2)
plot(d1c$map)
# class 1: agriculture
# class 2: forest

# set.seed() would allow you to attain the same results...

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
# class 1: agriculture
# class 2: forest

d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

# frequincies

freq(d1c$map)
# value count
# [1,]     1  34224
# [2,]     2 307068

s1 <- 34224 + 307068

prop1 <- freq(d1c$map) / s1
# prop agriculture: 0.1002778
# prop forest: 0.8997222

freq(d2c$map)
# value count
# [1,]     1 163673
# [2,]     2 179053

s2 <- 163673 + 179053

prop2 <- freq(d2c$map) / s2
#  prop agriculture: 0.4775623
#  prop forest: 0.5224377

# build a dataframe

cover <- c("Forest", "Agriculture")
percent_1992 <- c(89.97, 10.02)
percent_2006 <- c(52.24, 47.75)

percentages <- data.frame(cover, percent_1992, percent_2006)
percentages

# let's plot them!

ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")


p1 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrow=1)

