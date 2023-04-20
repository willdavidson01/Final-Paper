#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Data: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Test data ####
# Print the data
print(df)

# Test for outliers
boxplot(actively_homeless)

# Test for distribution
hist(gender_male)

# Test for correlation
cor(df[,c("returned_from_housing", "returned_to_shelter", "actively_homeless")])

# Test for normality
shapiro.test(age25.44)
