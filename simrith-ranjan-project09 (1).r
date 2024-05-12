#Question 1
myDF <- read.csv("/anvil/projects/tdm/data/restaurant/orders.csv")
benfords_law <- function(d) log10(1+1/d)
digits <-1:9
bf_val<-benfords_law(digits)
plot(digits, bf_val, xlab = "digits", ylab="probabilities", main="Benfords Law Plot Line")
benfords_law(3)

#Question 2
first_digit <- function(number){
    number <- abs(number)
    if(number!=0) {
        while(number>=10){
            number<- number / 10
        }
        while(number < 1) {
            number <- number * 10
        }
        number <- floor(number)
    }
    return(number)
}
first_digit(-6834.52)
first_digit(7223.0026)
first_digit(0.000037291)
#Question 3
library(data.table)
myDF <- fread("/anvil/projects/tdm/data/restaurant/orders.csv")
head(myDF)
head(myDF$grand_total)
sapply(head(myDF$grand_total), first_digit)
myDF$fd_grand_total <- sapply(myDF$grand_total, first_digit)
first_digit(0)
head(myDF$fd_grand_total, n=30)
#Question 4
table(myDF$fd_grand_total)
plot(table(myDF$fd_grand_total))
plot(table(myDF$fd_grand_total)) / length(myDF$fd_grand_total)
#Question 5
(head(myDF$delivery_date, n =10)) 
as.Date(head(myDF$delivery_date, n =10)) <= as.Date("2019-09-15")
as.Date(head(myDF$delivery_date, n =10)) <= as.Date("2019-02-15")
tail(myDF$delivery_date)
find_orders <- function(start_date, end_date) {
    ordim(myDF)ders_by_dates <- subset(myDF, ((myDF$delivery_date >= start_date) & (myDF$delivery_date <= end_date)))
    return(orders_by_dates)
}
dim(myDF)
myresultDF <- find_orders("2019-07-31", "2019-08-01")
dim(myresultDF)
myresultDF <- find_orders("2019-07-05", "2019-08-01")
dim(myresultDF)
head(myresultDF)


