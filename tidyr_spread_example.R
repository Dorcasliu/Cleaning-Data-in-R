#install.packages('tidyverse')
library(tidyverse)

people_data <- read_csv('Documents/name-properties.csv')
people_data
people_data %>% count(ID)

people_data %>%
  spread(property, value)
