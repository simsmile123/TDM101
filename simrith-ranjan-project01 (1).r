#Question 2

%%R

system("hostname", intern=TRUE)
#Question 4

%%R
B. 1000*256*1000000000 ,  256 TB


#Question 5

%%R

dat <- read.csv("/anvil/projects/tdm/data/disney/flight_of_passage.csv")

%%R

head(dat)

%%R

flight_of_passage <- dat

%%R

head(flight_of_passage)