#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Data: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
list <- list_package_resources("https://open.toronto.ca/dataset/toronto-shelter-system-flow/")
#a <- search_packages("toronto shelter system flow")

df <- list[list$name=='toronto-shelter-system-flow.csv',] %>%
  get_resource()



#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(df, "inputs/data/raw_data.csv") 

         