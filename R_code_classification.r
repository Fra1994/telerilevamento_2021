# R_code_classification.r

library(raster)
library(RStoolbox)

setwd("C:/lab/")

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so

# visualize RGB levels

plotRGB(so, 1,2,3, stretch="lin")

# Unsupervised Classification 

soc <- unsuperClass(so, nClasses=3)
plot(soc$map)

# Unsupervised Classification with 20 classes

soe <- unsuperClass(so, nClasses=20)
cl <- colorRampPalette(c('yellow','red','black'))(100)
plot(soe$map,col=cl)

# Download an image from:
# https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images

sun <- brick("sun.png")

# Unsupervised Classification

sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)

# Unsupervised Classification with 20 classes

sunc <- unsuperClass(sun, nClasses=20)
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(sunc$map,col=cl)

# Download Solar Orbiter data and proceed further!

# Grand Canyon

# https://landsat.visibleearth.nasa.gov/view.php?id=80948

# When John Wesley Powell led an expedition down the Colorado River and through the Grand Canyon in 1869, he was confronted with a daunting landscape. At its highest point, the serpentine gorge plunged 1,829 meters (6,000 feet) from rim to river bottom, making it one of the deepest canyons in the United States. In just 6 million years, water had carved through rock layers that collectively represented more than 2 billion years of geological history, nearly half of the time Earth has existed.

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")

plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

gcc2 <- unsuperClass(gc, nClasses=2)
gcc2
plot(gcc2$map)

gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)


