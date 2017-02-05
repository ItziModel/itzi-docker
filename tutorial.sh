# Preparing the entry data for the itzi tutorial

g.region -p raster=elev_lid792_1m@PERMANENT res=5 save=lidar_5m
r.resamp.interp input=elev_lid792_1m@PERMANENT output=elev_lid792_5m
r.watershed elevation=elev_lid792_5m drainage=elev_lid792_5m_drainage
r.water.outlet input=elev_lid792_5m_drainage output=watershed coordinates=638888,220011
r.mask rast=watershed
echo '638888|220011' > watershed_out.txt
v.in.ascii input=watershed_out.txt output=watershed_out
v.to.rast input=watershed_out type=point output=bctype use=val value=4
v.to.rast input=watershed_out type=point output=bcvalue use=val value=0
r.mapcalc exp='rain=100'
r.mapcalc exp='n=0.05'
