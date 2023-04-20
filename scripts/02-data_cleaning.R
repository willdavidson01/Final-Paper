#### Preamble ####
# Purpose: Cleans.... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Data: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Clean data ####
df$new_date = dmy(paste0("01-", df$date.mmm.yy.))
df$year = as.factor(year(df$new_date))
df$month = as.factor(month(df$new_date))
df$population_group = as.factor(df$population_group)
attach(df)

aux <- df %>% 
  filter(population_group != 'All Population') %>% 
  group_by(year, month, population_group) %>% 
  summarise(actively_homeless = sum(actively_homeless)) %>% 
  mutate(date = as.Date(paste0(year,'-',month,'-','01')))

aux = df[,c("actively_homeless", "gender_male", "gender_female",
            "gender_transgender.non.binary_or_two_spirit", "new_date", "year", "month")] %>% 
  group_by(year, month) %>% 
  summarise(Male = sum(gender_male),
            Female = sum(gender_female),
            lgbtq = sum(gender_transgender.non.binary_or_two_spirit)) %>% 
  mutate(date = as.Date(paste0(year,'-',month,'-','01')),
         Total = Male + Female + lgbtq)

data_long <- reshape2::melt(aux[,-c(1,2)], id.vars = "date", variable.name = "Category", value.name = "value")
data_long = data_long[order(data_long$date, data_long$Category),]
data_long$Category <- factor(data_long$Category, levels = c("Total", "Male", "Female","lgbtq"))

aux = df %>% 
  select(date.mmm.yy., ageunder16, age16.24, age25.44, age45.64, age65over) %>% 
  filter(population_group == 'All Population' & #or chronic ??
           date.mmm.yy. %in% c('Jan-19','Jan-23'))

data_long <- reshape2::melt(aux, id.vars = "date.mmm.yy.", variable.name = "Category", value.name = "value")

aux <- df %>% 
  filter(substr(date.mmm.yy., 1, 3)=='Jan' & year != 2018 &
           !population_group %in% c('All Population')) %>% 
  select(date.mmm.yy., population_group, population_group_percentage)
data_wide <- spread(aux, key = date.mmm.yy., value = population_group_percentage)
names(data_wide)[1] = 'Population Group'






#### Save data ####
# [...UPDATE THIS...]
# change cleaned_data to whatever name you end up with at the end of cleaning
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")

