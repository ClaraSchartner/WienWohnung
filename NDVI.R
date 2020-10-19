
#---------------------------------------
#load sentinal data with 10m resolution
red <- raster::raster(
  "satelliteData/S2A_MSIL2A_20190809T100031_N0213_R122_T33UWP_20190809T114711/GRANULE/L2A_T33UWP_A021569_20190809T100638/IMG_DATA/R10m/T33UWP_20190809T100031_B04_10m.jp2")
NIR <- raster::raster(
  "satelliteData/S2A_MSIL2A_20190809T100031_N0213_R122_T33UWP_20190809T114711/GRANULE/L2A_T33UWP_A021569_20190809T100638/IMG_DATA/R10m/T33UWP_20190809T100031_B08_10m.jp2")

#ndvi calculation
NDVI <- (NIR - red) / (NIR + red)

#cropping to Vieanna
#extent follows this pattern:  xmin,xmax,ymin,ymax
NDVI <- raster::crop(NDVI, extent(c(592839, 609779.73, 5330298.3, 5350612.8)))
#write
raster::writeRaster(NDVI, paste0(file_base, "satelliteData/NDVI.tif"), overwrite = TRUE)
