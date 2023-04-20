#### Preamble ####
# Purpose: Simulates data
# Author: Will Davidson
# Data: 20 April 2023
# Contact: w.davidson@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
# First, let's load the required packages
library(tidyverse)

# Set seed for reproducibility
set.seed(123)

# Create a vector of age groups
age_groups <- c("18-24", "25-34", "35-44", "45-54", "55-64", "65+")

# Create a vector of genders
genders <- c("Male", "Female", "Non-Binary")

# Create a vector of population groups
populations <- c("Indigenous", "Black", "Asian", "White", "Other")

# Create a data frame to hold our simulated data
homeless_data <- data.frame(
  age = sample(age_groups, 1000, replace = TRUE),
  gender = sample(genders, 1000, replace = TRUE),
  population = sample(populations, 1000, replace = TRUE),
  count = rpois(1000, 5)
)

# View the first few rows of the dataset
head(homeless_data)



