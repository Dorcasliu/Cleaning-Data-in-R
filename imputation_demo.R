#install.packages('tidyverse')
library(tidyverse)

iris_missing <- tbl_df(fromJSON('Documents/iris_missing.json'))
iris_missing
iris_missing <- iris_missing %>%
  mutate(petal_width = as.numeric(petal_width),
         species = as.factor(species))

iris_missing %>%
  filter(is.na(petal_width))

iris_tbl <- iris_missing %>%
  group_by(species) %>%
  mutate(petal_width = 
           ifelse(is.na(petal_width),
                  mean(petal_width, na.rm = TRUE),
                  petal_width)
         )
iris_tbl
anyNA(iris_tbl)
