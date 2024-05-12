myDF <- read.csv("/anvil/projects/tdm/data/flights/subset/1995.csv")
head(myDF)
dim(myDF)
str(myDF)
class(myDF$NASDelay)
newVector <- myDF$ColumnName

# to generate our vector, this would look like
my_airports <- myDF$Origin
head(my_airports)
class(my_airports)
head(my_airports, 250)
str(myDF$Origin[myDF$Origin == "IND"])
str(myDF$Dest[myDF$Dest == "IND"])
myDF[894,]$Dest
str(myDF$Distance[myDF$Distance < 200])
sort(table(myDF$UniqueCarrier))
hist(myDF$Distance, main = "Flight Distances", xlab = "Distance(miles)", ylab = "Count", col = 'green')