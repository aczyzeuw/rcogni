title: "HW 05 - Legos"
author: "Insert your name here"
date: "Insert date here"
output: github_document
---
  
  ## Load packages and data
  
  ```{r load-packages, message = FALSE}
install.packages(tidyverse)

library(tidyverse)
library(dsbox) 
```

## Exercises

### Exercise 1
x <- sort(table(lego_sales$first_name))
tail(x,3)
#jacob joseph jackson
### Exercise 2
x <- sort(table(lego_sales$theme))
tail(x,3)
#Mixels, Nexo Knights, Star Wars

### Exercise 3
star <- subset(lego_sales, theme == 'Star Wars')
x <- sort(table(star$subtheme))
tail(x,1)

### Exercise 4
lego_sales$age_group=case_when(lego_sales$age<=18 ~ '18 and under', lego_sales$age>=19 & lego_sales$age<=25 ~ '19-25',lego_sales$age >= 26 & lego_sales$age<=35 ~ '26-35',lego_sales$age>=36 & lego_sales$age<=50 ~ '36-50',lego_sales$age>=51 ~'51 and over')

### Exercise 5
x <- sort(table(lego_sales$age_group))
tail(x,1)
#36-50 216

### Exercise 6
dfvalue=aggregate(lego_sales$us_price, by=list(Category=lego_sales$age_group), FUN=sum)
dfvalue[which.max(dfvalue$x),]
#36-50 6641.84

### Exercise 7
dfvalue=aggregate(lego_sales$us_price, by=list(Category=lego_sales$theme), FUN=sum)
dfvalue[which.max(dfvalue$x),]
#Star Wars 2842.25

### Exercise 8
lego_sales$area_code=substr(lego_sales$phone_number, start = 1, stop = 3)
dfvalue = aggregate(lego_sales$us_price, by=list(Category=lego_sales$area_code), FUN=sum)
dfvalue[which.max(dfvalue$x),]
#973 444.94

### Exercise 9
#Question: Are products with more pieces more expensive?
#Answer: It seems yes, looking at a scatterplot between price and pieces.

sample_lego=lego_sales[lego_sales$pieces != 0, ]
plot(sample_lego$us_price, sample_lego$pieces, main="Scatterplot Example",xlab="pieces", ylab="price")