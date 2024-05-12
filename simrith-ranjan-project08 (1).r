#Question 1
options(jupyter.rich_display = F)
options(repr.matrix.max.cols = 30, repr.matrix.max.rows = 200)
library(data.table)

products <- fread("/anvil/projects/tdm/data/icecream/combined/products.csv")
reviews <- fread("/anvil/projects/tdm/data/icecream/combined/reviews.csv")
head(products$ingredients)
unique(trimws(unlist(strsplit(products$ingredients[1], ", |\\(|\\)"))))
strsplit(products$ingredients[2], ", ")
strsplit(products$ingredients[3], ", ")
getingredients <- function(x) {
    unique(trimws(unlist(strsplit(x, ",|\\(|\\)"))))
}    
getingredients(products$ingredients[55])
dotchart(tail(sort(table(unlist(sapply(products$ingredients, getingredients), use.names = FALSE))), n = 11))
barplot(tail(sort(table(unlist(sapply(products$ingredients, getingredients), use.names = FALSE))), n = 11))
str(reviews)
plot(sort(tapply(reviews$stars, reviews$key, mean, na.rm = TRUE)), type = "l",
     main = "Reviews", xlab = "index", ylab = "stars")

#Question 2
products_reviews_by_rating <- function(products_df, reviews_df, myrating) {
    merge_results <- merge(products_df, reviews_df, by="key")
    products_reviews_results <- merge_results[merge_results$rating >= myrating, ]
    return(products_reviews_results)
} 


