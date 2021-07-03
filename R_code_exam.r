# R_code_exam.r

# Artic_sea_ice_decline

# Artic_lows
# The maps above show the sea ice extent in the Arctic Ocean for July 2020 (above, right) in context with sea ice from July 2000 and 2010. Extent is defined as the total area in which the ice concentration is at least 15 percent—the minimum amount at which space-based measurements give a reliable measurement. The yellow outline on each map shows the 30-year median extent for the month.

# set working directory
setwd("C:/lab/Sea_Ice")

# load packages
library(raster)
library(rasterVis)

# Download an image from:
# https://earthobservatory.nasa.gov/images/147070/arctic-lows
artic_lows <- brick("arctic_nsidc_20202013.png")
artic_lows
plot(artic_lows)

# dev.off will clean the current graph
dev.off()

# visualize plotRGB
plotRGB(artic_lows)

# dev.off will clean the current graph
dev.off()

# plot band 1 with a predefinined color ramp palette
cl <- colorRampPalette(c('blue','dark gray','white'))(100)
plot(artic_lows, col=cl)

# dev.off will clean the current graph
dev.off()

# visualize RGB levels
# 2 rows, 1 column
par(mfrow=c(2,1))
plotRGB(artic_lows, r=1, g=2, b=3, stretch="Lin")
plotRGB(artic_lows, r=1, g=2, b=3, stretch="hist")

# dev.off will clean the current graph
dev.off()

# par natural colours, false colours and false colours with histogram stretch
par(mfrow=c(3,1))
plotRGB(artic_lows, r=1, g=2, b=3, stretch="Lin")
plotRGB(artic_lows, r=2, g=3, b=4, stretch="Lin")
plotRGB(artic_lows, r=2, g=3, b=4,, stretch="hist")

# dev.off will clean the current graph
dev.off()

levelplot(artic_lows)
cl <- colorRampPalette(c('blue','dark gray','white'))(100)
levelplot(artic_lows, col.regions=cl)

levelplot(artic_lows, col.regions=cl, names.attr=c("July 2000_2010_2020", "July 2000_2010_2020", "July 2000_2010_2020"))
levelplot(artic_lows, col.regions=cl, main="Artic decline variation in time", names.attr=c("July 2000_2010_2020", "July 2000_2010_2020", "July 2000_2010_2020"))

# pdf
pdf("Artic_decline.pdf")
levelplot(artic_lows)
cl <- colorRampPalette(c('blue','dark gray','white'))(100)
levelplot(artic_lows, col.regions=cl)
levelplot(artic_lows, col.regions=cl, names.attr=c("July 2000_2010_2020", "July 2000_2010_2020", "July 2000_2010_2020"))
levelplot(artic_lows, col.regions=cl, main="Artic decline variation in time", names.attr=c("July 2000_2010_2020", "July 2000_2010_2020", "July 2000_2010_2020"))
dev.off()

# Sea_Ice_Highs_and_Lows
# The maps above show the average Arctic sea ice extent for September 2020 (left) and March 2021 (right), the months in which the region reaches its annual minimum and maximum ice extents. Sea ice extent is defined as the total area in which the ice concentration is at least 15 percent.

# Download an image from:
# https://earthobservatory.nasa.gov/images/148194/sea-ice-highs-and-lows
si_hl <- brick("arctic_nsidc_2021.png")
si_hl
plot(si_hl)

# dev.off will clean the current graph
dev.off()

# visualize plotRGB
plotRGB(si_hl)

# dev.off will clean the current graph
dev.off()

# plot band 1 with a predefinined color ramp palette
cl <- colorRampPalette(c('blue','dark gray','white'))(100)
plot(si_hl, col=cl)

# dev.off will clean the current graph
dev.off()

# visualize RGB levels
# 2 rows, 1 column
par(mfrow=c(2,1))
plotRGB(si_hl, r=1, g=2, b=3, stretch="Lin")
plotRGB(si_hl, r=1, g=2, b=3, stretch="hist")

# dev.off will clean the current graph
dev.off()

# par natural colours, false colours and false colours with histogram stretch
par(mfrow=c(3,1))
plotRGB(si_hl, r=1, g=2, b=3, stretch="Lin")
plotRGB(si_hl, r=2, g=3, b=4, stretch="Lin")
plotRGB(si_hl, r=2, g=3, b=4,, stretch="hist")

# dev.off will clean the current graph
dev.off()

levelplot(si_hl)
cl <- colorRampPalette(c('blue','dark gray','white'))(100)
levelplot(si_hl, col.regions=cl)

levelplot(si_hl, col.regions=cl, names.attr=c("September 2020 - March 2021", "September 2020 - March 2021", "September 2020 - March 2021"))
levelplot(si_hl, col.regions=cl, main="Artic decline variation in time", names.attr=c("September 2020 - March 2021", "September 2020 - March 2021", "September 2020 - March 2021"))

# pdf
pdf("Artic_decline_.pdf")
levelplot(si_hl)
cl <- colorRampPalette(c('blue','dark gray','white'))(100)
levelplot(si_hl, col.regions=cl)
levelplot(si_hl, col.regions=cl, names.attr=c("September 2020 - March 2021", "September 2020 - March 2021", "September 2020 - March 2021"))
levelplot(si_hl, col.regions=cl, main="Artic decline variation in time", names.attr=c("September 2020 - March 2021", "September 2020 - March 2021", "September 2020 - March 2021"))
dev.off()




