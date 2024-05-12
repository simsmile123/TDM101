#QUESTION 1

options(jupyter.rich_display = F)

options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)

myDF <- read.csv("/anvil/projects/tdm/data/election/escaped2020sample.txt", sep="|")

head(myDF)

library(lubridate, warn.conflicts = FALSE)

class(myDF$TRANSACTION_DT)

myDF$newdates <-mdy(myDF$TRANSACTION_DT)

class(myDF$newdates)

head(myDF$newdates)

myDF$TRANSACTION_YR <- year(myDF$newdates)

head(myDF$TRANSACTION_YR)

transPerYear <- tapply(myDF$TRANSACTION_AMT, myDF$TRANSACTION_YR, sum)

table(myDF$TRANSACTION_YR)

transPerYear

plot(row.names(transPerYear), transPerYear, xlab="Year", ylab="total amount of transactions", main = "Graph of C")

#QUESTION 2

my2020DF <-subset(myDF, TRANSACTION_YR == "2020")

dim(myDF)

dim(my2020DF)

my2020DF$TRANSACTION_MONTH <- month(my2020DF$newdates)

head(my2020DF)

transPerMonth <- tapply(my2020DF$TRANSACTION_AMT, my2020DF$TRANSACTION_MONTH, sum)

plot(row.names(transPerMonth), transPerMonth, xlab = "Month", ylab = "Total Amount of Transactions", main = "Transactions per Month")

#Question 3

tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$NAME, sum)))

head(myDF)

transPerState <- tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$STATE, sum)))

transPerZip <- tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$ZIP_CODE, sum)), n=10)

#Question 4

boxplot(transPerState, xlab = "State", ylab = "Total Amount of Transactions", main = "Transactions per State")


boxplot(transPerZip, xlab = "Zip Code", ylab = "Total Amount of Transactions", main = "Transactions per Zip Code")


#Question 5

tail(sort(tapply(myDF$TRANSACTION_AMT, myDF$OCCUPATION , sum)))

boxplot(transPerOCCUPATION, xlab = "Total Amount of Transactions", ylab = "Occupation", main = "Transactions by Occupations")



