##Question 1
options(jupyter.rich_display = F)

options(repr.matrix.max.cols=30, repr.matrix.max.rows=200)

library(data.table)

products <- fread("/anvil/projects/tdm/data/icecream/combined/products.csv")
reviews <- fread("/anvil/projects/tdm/data/icecream/combined/reviews.csv")
titles <- fread("/anvil/projects/tdm/data/movies_and_tv/titles.csv")
episodes <- fread("/anvil/projects/tdm/data/movies_and_tv/episodes.csv")
ratings <- fread("/anvil/projects/tdm/data/movies_and_tv/ratings.csv")

str(products)

head(products$ingredients, n = 1)

productsWGuarGum <- subset(products, grepl("GUAR GUM", products$ingredients))

dim(productsWGuarGum)

str(productsWGuarGum)

newGuarGum <- sort(productsWGuarGum$rating, decreasing = TRUE)

##Question 2

names(products)

gDF <- merge(products, reviews, by=c("brand", "key"))

dim(reviews)
dim(products)
dim(gDF)

## Question 3

showDF <- subset(episodes, show_title_id == "tt4574334")

head(titles)

dim(showDF)

showMergeDF <- merge(merge(merge(merge(showDF, titles, by.x = "show_title_id", by.y = "title_id"),
                           titles, by.x = "episode_title_id", by.y = "title_id"), 
                           ratings, by.x = "show_title_id", by.y = "title_id"), 
                           ratings, by.x = "episode_title_id", by.y = "title_id")

## Question 4

showMergeDF[(showMergeDF$season_number == 3) & (showMergeDF$rating.y < 8.5), ]

subset(showMergeDF, (season_number==3) & (rating.y < 8.5))

##Question 5

myseason <- 3

subset(showMergeDF, (season_number = myseason) & (rating.y < 8.5))

season_number <- 3

subset(showMergeDF, (season_number = season_number) & (rating.y < 8.5))