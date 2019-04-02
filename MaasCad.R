library(rgdal)
library(sp)
demo(meuse, ask = FALSE, echo = FALSE) # loads the meuse data sets
#class(meuse)

crs.longlat = CRS("+init=epsg:4326")
meuse.longlat = spTransform(meuse, crs.longlat)

maasDFcad<-data.frame(meuse.longlat@data$cadmium, meuse.longlat@coords)
names(maasDFcad)<-c("Cadmium level", "lng", "lat")

SteinDF<-data.frame(lat=50.966667, lng=5.766667)

my_map<-maasDFcad %>% leaflet() %>% addTiles() %>% addCircles(weight=1, radius=sqrt(maasDFcad$`Cadmium level`*2000))
addMarkers(my_map, lng=SteinDF$lng, lat=SteinDF$lat, popup="Stein")
