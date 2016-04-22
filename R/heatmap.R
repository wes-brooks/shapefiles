library(ncdf4)

cruts <- ncvar_get(nc_open("data/cru_ts3.23.2011.2014.tmp.dat.nc"))
meta <- ncvar_get(nc_open("data/cru_ts3.23.2011.2014.tmp.st0.nc"))

precip <- read.table("data/grid_10min_pre.dat")[,1:14]
colnames(precip) <- c('lat', 'lon', 'january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december')

precip <- precip[precip$lon > 112.9 & precip$lon < 159 & precip$lat > -55 & precip$lat < -10.1,]
precip$annual <- rowSums(precip[,-c(1,2)])
