install.packages('tidyverse')
library(tidyverse)

weather_url <- 'https://api.weather.gov/stations/KBHB/observations/latest'

res <- tryCatch({
  fromJSON(weather_url)
}, error = function(e) {
  stop('failed to fetch json from url')
})

glimpse(res)

#check for important response fields
if(!(any(c('id','geometry', 'properties') %in% names(res)))) {
  stop('missing fields from results')
} else {
  'ok!'
}

#extract value
temp_c <- res$properties$temperature$value
temp_c

#convert values
temp_f <- temp_c * 9 / 5 + 32
temp_f

#observation time
observation_time <- res$properties$timestamp
observation_time

temperatures <- tibble(
  temp_c = temp_c,
  temp_f = temp_f,
  obs_dt = observation_time
)
temperatures
glimpse(temperatures)
