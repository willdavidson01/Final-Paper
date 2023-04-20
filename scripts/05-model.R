#### Preamble ####
# Purpose: Simulates data
# Author: Will Davidson
# Data: 20 April 2023
# Contact: w.davidson@mail.utoronto.ca
# License: MIT


# Load the dataset containing the variables of interest
data <- read.csv("homeless_data.csv")

# Fit the linear regression model with Y as the response variable and X1, X2, and X3 as predictors
model <- lm(Y ~ X1 + X2 + X3, data = data)

# Print the model summary to view the regression coefficients and statistical significance of the predictors
summary(model)
