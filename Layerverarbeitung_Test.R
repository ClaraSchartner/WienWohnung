file_base <- "C:/Users/Clara/Documents/freizeit/WienKartierung/Kartierung/"

library(sf)
library(stringr)
#-----------------------------------------------------------

#load data

p07_04 <- st_read(paste0(file_base, "Kartierung_Stand_07_04_20.shp"))
p08_04 <- st_read(paste0(file_base, "Kartierung_Stand_08_04_20.shp"))
p09_04 <- st_read(paste0(file_base, "Kartierung_Stand_09_04_20.shp"))
p13_04 <- st_read(paste0(file_base, "Kartierung_Stand_13_04_20.shp"))
p19_04 <- st_read(paste0(file_base, "Kartierung_Stand_19_04_20.shp"))
#newest version
newVers <- p19_04
#--------------------------------

#assign a date
newVers$date <- NA
newVers$date <- as.character(newVers$date)

nrow(p07_04)
nrow(p08_04)
nrow(p09_04)
nrow(p13_04)
nrow(p19_04)


#assign the recording date
newVers$date[newVers$ID <= nrow(p07_04)] <- "2020-04-07"
newVers$date[newVers$ID > nrow(p07_04) & newVers$ID <= nrow(p08_04)] <- "2020-04-08"
newVers$date[newVers$ID > nrow(p08_04) & newVers$ID <= nrow(p09_04)] <- "2020-04-09"
newVers$date[newVers$ID > nrow(p09_04) & newVers$ID <= nrow(p13_04)] <- "2020-04-13"
newVers$date[newVers$ID > nrow(p13_04)] <- "2020-04-19"

#write
st_write(obj = newVers, dsn = paste0(file_base, "Kartierung_Stand_19_04_20_korrigiert.shp"), driver = "ESRI Shapefile", delete_dsn = TRUE)
