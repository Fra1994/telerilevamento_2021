# R_code_focus.r

# Great_Pacific_Garbage_Patch

# Mass_Concentration
# Modelled and measured mass concentration in the Great Pacific Garbage Patch (GPGP). Ocean plastic mass concentrations for August 2015, as predicted by our data-calibrated model. The bold black line represents our established limit for the GPGP.

# # set working directory
setwd("C:/lab/GPGP")

# load packages
library(raster)

# Download an image from:
# https://www.nature.com/articles/s41598-018-22939-w/figures/3
mass_concentration <- brick("mass_concentration.jpg")
mass_concentration

# visualize plotRGB
plotRGB(mass_concentration)

# dev.off will clean the current graph
dev.off()

# Evolution_Prediction
# Modelled source and forcing distributions. North Pacific distribution of the ocean plastics sources used in this study (blue and orange squares, circles and triangles), and predicted marine source (shipping, fishing and aquaculture) anomalies in relation to the initial distribution of both marine- and land-based sources (coastal urban centres and rivers).

# Download an image from:
# https://www.nature.com/articles/s41598-018-22939-w/figures/5
evolution_prediction <- brick("evolution_prediction.jpg")
evolution_prediction

# visualize plotRGB
plotRGB(evolution_prediction)

# dev.off will clean the current graph
dev.off()

# Trend_Boxplot
# The GPGP boundary (blue line) is estimated by comparing microplastic concentration measurements (circles) to model particle visit averages that accounted for seasonal and inter-annual variations. Model validation showing median measured mass concentration for microplastics of stations outside and inside our predicted 1 kg km−2 GPGP boundary.
# Download an image from:
# https://www.nature.com/articles/s41598-018-22939-w/figures/2
trend_boxplot <- brick("trend_boxplot.jpg")
trend_boxplot

# visualize plotRGB
plotRGB(trend_boxplot) 

# dev.off will clean the current graph
dev.off()

# pdf
pdf("Great_Pacific_Garbage_Patch.pdf")
plotRGB(mass_concentration)
plotRGB(evolution_prediction)
plotRGB(trend_boxplot) 
dev.off()
