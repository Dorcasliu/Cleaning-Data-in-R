library(readxl)

xl_path = 'Documents/names-eyes.xlsx'

people_names = read_excel(xl_path, sheet="People")
people_eyes = read_excel(xl_path, sheet="Eyes")

people_names
people_eyes

left_join(people_names, people_eyes, by = "ID")
right_join(people_names, people_eyes, by = "ID")
