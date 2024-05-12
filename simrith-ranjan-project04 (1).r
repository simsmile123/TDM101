#Question 1


x <- 7
if (x > 0) {
    print("Positive Number")
}

options(jupter.rich_display = F)

options(repr.matrix.max.cols = 26, repr.matrix.max.rows = 200)

myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv")

head(myDF, n = 50)

dim(myDF)

myDF$texasflag <- rep("not Texas", times = 426880)

myDF$texasflag[myDF$state == "tx"] <- "yes Texas"

dim(subset(myDF, state == "tx"))

dim(subset(myDF, texasflag == "yes Texas"))

myDF$pricecategory <- rep("cheap car", times = 426880)

myDF$pricecategory[myDF$price > 10000] <- "expensive car"

myDF$newyorkers[myDF$state == "ny"] <- TRUE

myDF$pricecategory[myDF$price > 15000] <- "expensive car"

head(myDF$state)

class(myDF$state)

length(table(myDF$state))

head(table(myDF$state))

myDF$price2000 <- rep(FALSE, times = 426880)

myDF$price2000[myDF$price >= 2000] <- TRUE

dim(subset(myDF, price2000 == TRUE))

mean(myDF$price)

#Question 2

myDF$pricecategory <- cut(myDF$price, breaks = c(-Inf, 10000, 15000, Inf), labels = c("cheap", "expensive", "very very expensive"))

mileage_category <- cut(myDF$odometer, breaks = c(-Inf, 50000, 100000, 150000, Inf), labels = c("low", "moderate", "high", "very high"))

has_VIN <- rep("has vin", times = 426880)

myDF$has_VIN[myDF$id != "NA"] <- "no vin"

mynchar <- nchar(as.character(myDF$description))

head(mynchar, n = 50)

description_length <- cut(mynchar, breaks = c(0, 50, 100, 200, 500, Inf), labels = c("very short", "short", "medium", "long", "very long"))

head(myDF$description_length)

#Question 3

table(mileage_category)

table(has_VIN)

table(description_length)

#Question 4

myTexasDF <- subset(myDF, state == "tx")

myAkDF <- subset(myDF, state == "ak")

myVaDF <- subset(myDF, state == "va")

#Question 5

myTexasDF <- subset(myDF, state == "tx" & !is.na(lat) & !is.na(long))

library(leaflet)

library(sf)

points <- st_as_sf(myTexasDF, coords=c("long", "lat"), crs=4326)

addCircleMarkers(addTiles(leaflet(myTexasDF)), radius = 1)

addCircleMarkers(addTiles(leaflet(myAkDF)), radius = 1)

addCircleMarkers(addTiles(leaflet(myVaDF)), radius = 1)