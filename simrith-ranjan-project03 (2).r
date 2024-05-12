#Question 1

file.info("/anvil/projects/tdm/data/craigslist/vehicles.csv")$size

myDF <- read.csv("/anvil/projects/tdm/data/craigslist/vehicles.csv")

options(jupyter.rich_display =F)

head(myDF)

dim(myDF)

str(myDF)

#Question 2

head(myDF$year, n = 100)

table(myDF$year, useNA = "always") #table will not show the NAs

head(myDF$year, n=50)

head(is.na(myDF$year), n=50)

sum(is.na(myDF$year))

dim(myDF)[1] #rows [2] col

sum(is.na(myDF$year)) / dim(myDF)[1]

goodLatitudeDF <- subset(myDF, !is.na(myDF$lat)) #before the comma, I put any conditions on rows of the data, 
                                                 #after comma the conditions are on the columns of the data
#goodlatitudeDF <- subset(myDF, !is.na(lat))
#goodlatitudeDF <- myDF[!is.na(myDF$lat), ]

dim(goodLatitudeDF)

dim(myDF) #about 6k rows are missing, meaning 6k rows had NA values

goodyearsDF <- subset(myDF, !is.na(myDF$year)) #before the comma, I put any conditions on rows of the data, 

dim(goodyearsDF)

head(goodyearsDF)

missingyearsDF <- subset(myDF, is.na(myDF$year)) 

head(missingyearsDF)

#Question 3

aggregate(price ~ type, data = myDF, FUN = mean)

subset(aggregate(year ~ type, data = myDF, FUN = mean), year > 2002)

table(myDF$year)

which.max(table(myDF$year)) #109th entry, 2017

length(table(myDF$year))

table(myDF$year)[which.max(table(myDF$year))]

#Question 4

str(myDF)

tail(sort(table(myDF$region_url)), n = 5)

tail(sort(table(myDF$state)), n = 3)

#Question 5

myyears <- subset(aggregate(price ~ year, data = myDF, FUN = mean), year >2002)$year

myprices <- subset(aggregate(price ~ year, data = myDF, FUN = mean), year >2002)$price

plot(myyears, myprices)

plot(myyears[myprices<50000], myprices[myprices<50000])
#we threw out the 4 years of data (06, 07, 20,21) with avg car values more than 50000

head(myDF$price , n =100)

boxplot(myyears[myprices<50000], myprices[myprices<50000])