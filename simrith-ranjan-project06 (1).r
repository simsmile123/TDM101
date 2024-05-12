#Question 1

options(jupyter.rich_display = F)

options(repr.matrix.max.cols=25, repr.matrix.max.rows = 200)

myDF <- read.csv("/anvil/projects/tdm/data/olympics/athlete_events.csv", stringsAsFactors=TRUE)

head(myDF)

table(myDF$Games)

table(myDF$NOC[myDF$Year == "1980"])

length(unique(myDF$Name[duplicated(myDF$Name)]))

myDuplicatedAthletes <- unique(myDF$Name[duplicated(myDF$Name)])

dim(myDF)

mynewDF <- subset(myDF, Name %in% myDuplicatedAthletes)

dim(mynewDF)

str(myDF)

#Question 2

tapply(myDF$Age, myDF$NOC, mean, na.rm = TRUE)

myMaxHeightSport <- sort(tapply(myDF$Height, myDF$Event, max), decreasing = TRUE)

head(myMaxHeightSport, n = 5)

#Queston 3

options(repr.matrix.max.cols=50, repr.matrix.max.rows = 200)

options(jupyter.rich_display = F)

myDF <- read.csv("/anvil/projects/tdm/data/death_records/DeathRecords.csv", stringsAsFactors = TRUE)

dim(myDF)

str(myDF)

head(myDF)

table(myDF$MonthOfDeath)

class(myDF$MonthOfDeath)

month_order <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

myDF$MonthOfDeath <- factor(myDF$MonthOfDeath)

levels(myDF$MonthOfDeath) <- month_order #ACC replaced data

head(myDF$MonthOfDeath)

str(myDF)

table(myDF$MonthOfDeath) #3c

#Question 4

table(myDF$Sex)

table(myDF$Race)

tapply(myDF$Age, myDF$Race, mean)

tapply(myDF$Age[myDF$Sex == "F"], myDF$Race[myDF$Sex == "F"], mean)

tapply(myDF$Age[myDF$Sex == "M"], myDF$Race[myDF$Sex == "M"], mean)

#Question 5

myDF <- read.csv("/anvil/projects/tdm/data/olympics/athlete_events.csv", stringsAsFactors=TRUE)

str(myDF)

tapply(myDF$Age[myDF$Sex == "F"], myDF$NOC[myDF$Sex == "F"], mean, na.rm = TRUE)

plot(myDF$Medal[myDF$Sex == "F"], myDF$Age[myDF$Sex == "F"])

myDF <- read.csv("/anvil/projects/tdm/data/death_records/DeathRecords.csv", stringsAsFactors = TRUE)

str(myDF)

plot(myDF$MaritalStatus, myDF$Age)
