#install.packages('tidyverse')
library(readxl)

xl_path <- 'Documents/names-eyes.xlsx'

sheet_names <- excel_sheets(xl_path)
glimpse(sheet_names)

people_names <- read_excel(xl_path, sheet="People")
people_names

people_eyes <- read_excel(xl_path, sheet="Eyes")
people_eyes

people_eyes %>%
  count(eye_color)

