#Question 1
library(data.table)
options(jupypter.rich_display = F)
options(repr.matrix.max.cols = 30, repr.matrix.max.rows = 200)
orders <- fread("/anvil/projects/tdm/data/restaurant/orders.csv")
vendors <- fread("/anvil/projects/tdm/data/restaurant/vendors.csv")
head(vendors)
table(vendors$vendor_category_en)
grep("Bake", vendors$vendor_category_en)
grepl("Bake", vendors$vendor_category_en)
newDF <- subset(vendors, grepl("Bake", vendor_category_en))
dim(newDF)
anotherDF <- vendors[ grep("Bake", vendor_category_en), ]
newDFFries <- subset(vendors, grepl("Fries", vendor_tag_name))
anotherDFFries <- vendors[ grep("Fries", vendor_tag_name), ]
dim(newDFFries)
dim(anotherDFFries)

#Question 2
dim(anotherDFFries)
length(vendors$is_open)
vendors$is_open
table(vendors$is_open)
prop.table(table(vendors$is_open))
table(vendors$is_open) / length(vendors$is_open)
prop.table(table(vendors$delivery_charge))

#Question 3
prop.table(table(vendors$delivery_charge))
vendors$is_open[vendors$vendor_category_en == "Restaurants"]
vendors$is_open[vendors$vendor_category_en == "Sweets & Bakes"]
prop.table(table(vendors$is_open[vendors$vendor_category_en == "Restaurants"]))
prop.table(table(vendors$is_open[vendors$vendor_category_en == "Sweets & Bakes"]))
vendors$delivery_charge[vendors$vendor_category_id == 2]
vendors$delivery_charge[vendors$vendor_category_id == 3]
prop.table(table(vendors$delivery_charge[vendors$vendor_category_id == 2]))
prop.table(table(vendors$delivery_charge[vendors$vendor_category_id == 3]))

#Question 4
table(vendors$delivery_charge[vendors$vendor_category_id == 2])
table(vendors$delivery_charge[vendors$vendor_category_id == 3])
tapply(vendors$delivery_charge, vendors$vendor_category_id, table) 
tapply(vendors$delivery_charge, vendors$vendor_category_id, function(x) {prop.table(table(x))})                                                                                                                                                                                                                   

#Question 5
tapply(vendors$delivery_charge, vendors$vendor_category_id, table) 
length(tapply(vendors$delivery_charge, vendors$vendor_category_id, table) )
sapply(tapply(vendors$delivery_charge, vendors$vendor_category_id, table), prop.table, simplify = FALSE)
