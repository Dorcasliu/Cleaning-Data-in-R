library(tidyverse)

cashew_producers <- read_csv('Documents/cashew-example.csv')
glimpse(cashew_producers)
cashew_producers

tbl_cashew <- cashew_producers %>%
  select(-1) %>%
  select(country = 1, production = 2, 
         percent_total = 3, percent_change = 4) %>%
  mutate(country = gsub("(^')|('$)", "", country),
         percent_total = as.numeric(gsub("%","", percent_total)),
         percent_change = as.numeric(gsub("[^0-9.-]","", percent_change)))
  
tbl_cashew
