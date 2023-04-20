#### Preamble ####
# Purpose: Simulates data
# Author: Will Davidson
# Data: 20 April 2023
# Contact: w.davidson@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Clean data ####
df$new_date = dmy(paste0("01-", df$date.mmm.yy.))
df$year = as.factor(year(df$new_date))
df$month = as.factor(month(df$new_date))
df$population_group = as.factor(df$population_group)
attach(df)






#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

