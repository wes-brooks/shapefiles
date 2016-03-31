library("sp")
library("rgdal")
library("dplyr")

# read shapefile data
aus <- readOGR("data/ne_50m_admin_0_countries/aus.shp", "aus")
ausriv <- readOGR("data/ne_50m_rivers_lake_centerlines/ausriv.shp", "ausriv")

# make the basic plot via leaflet
library("leaflet")

ausleaf <- leaflet(aus) %>% addPolygons(
  stroke = FALSE,
  fillOpacity = 0.5,
  smoothFactor = 0.5,
  color = 'red'
)
ausleaf

ausleaf %>% addPolylines(data=ausriv, weight=2)


# make the basic plot via ggplot2
library(ggplot2)

# convert shapes to data frames
aus.df <- fortify(aus)
ausriv.df <- fortify(ausriv)

ausplot <- ggplot(aus.df) +
  aes(long, lat, group=group) +
  geom_polygon(fill='red') +
  coord_equal()
ausplot

# show a new plot with rivers
ausplot + geom_line(data=ausriv.df, aes(long, lat, group=group))
