# Inspect the 'Australia' polygon
ogrinfo -al -ro -where "name='Australia'" ne_50m_admin_0_countries.shp

# Extract just the 'Australia' polygon
ogr2ogr -where "name='Australia'" aus.shp ne_50m_admin_0_countries.shp

# Extract rivers within Australia, using spatial extents
ogr2ogr -spat 112.9 -55 159 -10.1 ausriv.shp ne_50m_rivers_lake_centerlines.shp

