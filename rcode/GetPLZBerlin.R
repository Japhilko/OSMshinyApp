# Jan-Philipp Kolb
# Thu Feb 16 10:58:43 2017
# Get PLZ for Berlin

# Libraries

library(rgdal)

# Download zip file

# http://arnulf.us/PLZ

# setwd("D:/Daten/Daten/GeoDaten")
PLZ <- readOGR ("post_pl.shp","post_pl")
# setwd("D:/Daten/GitHub/OSMshinyApp/")

PLZber <- PLZ[PLZ$PLZORT99%in%c("Berlin-West","Berlin (östl. Stadtbezirke)"),]

PLZber1 <- PLZ[PLZ$PLZORT99%in%c("Berlin-West"),]

plot(PLZber)
plot(PLZber1,col="red",add=T)

# Add some OSM data

setwd("J:/Work/Statistik/Kolb/Paper/OSM_SmallArea/data")

(load("osmsa_PLZ_14.RData"))


ind <- match(PLZber$PLZ99,PLZ$PLZ99)

PLZber$street_lamp <- PLZ$street_lamp[ind]
PLZber$traffic_signals <- PLZ$traffic_signals[ind]

# Save dataset
save(PLZber,file="data/PLZber.rds")
