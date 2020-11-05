#install.packages('tidyverse')
library(tidyverse)

glimpse(iris)
iris %>% count(Species)
iris %>% sample_n(12)

iris %>%
  group_by(Species) %>%
  summarize(average = mean(Petal.Length), 
            min = min(Petal.Length),
            max = max(Petal.Length))
