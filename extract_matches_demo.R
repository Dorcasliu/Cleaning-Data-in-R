library(tidyverse)

raw_user_agents <- tbl_df(read_csv('Documents/syslog-http.csv')) %>%
  select(user_agent)
head(raw_user_agents)

user_agents_tbl <- raw_user_agents %>%
  mutate(browser_info = str_extract(user_agent, "[^\\s]+$")) %>%
  separate(browser_info, c("browser","version"), sep="/")

user_agents_tbl$browser
user_agents_tbl$version
