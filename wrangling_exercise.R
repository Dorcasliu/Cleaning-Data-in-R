library(tidyverse)

xl_path <- 'Documents/coldest_places.xlsx'

sheet_names <- excel_sheets(xl_path)
glimpse(sheet_names)

coldest_places <- read_excel(xl_path)
coldest_places

coldest_places <- coldest_places %>%
  select(-1) %>%
  select(place=1, temp_c=2) %>%
  mutate(temp_c=as.numeric(gsub("[^0-9.-]","", temp_c))) %>%
  mutate(temp_f=temp_c * 9 / 5 + 32)
coldest_places
coldest_places %>%
  summarize(coldest = min(temp_c),
            least_cold = max(temp_c))  
