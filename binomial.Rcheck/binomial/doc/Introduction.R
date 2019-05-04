## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(devtools)
library(binomial)

## ------------------------------------------------------------------------
number_trials <- 5
probability_success <- 0.5

## ------------------------------------------------------------------------
bin_mean(number_trials,probability_success)

## ------------------------------------------------------------------------
bin_variance(number_trials,probability_success)

## ------------------------------------------------------------------------
bin_mode(number_trials,probability_success)

## ------------------------------------------------------------------------
bin_skewness(number_trials,probability_success)

## ------------------------------------------------------------------------
bin_kurtosis(number_trials, probability_success)

## ------------------------------------------------------------------------
#Arguments
trials <- 5 
prob <- 0.5

#Binomial Distribution Object
binom_dist <- bin_distribution(trials, prob)

# 'bindis' as data.frame
binom_dist

# plot() will plot our 'bindis' object
plot(binom_dist)

## ------------------------------------------------------------------------
# Arguments
trials <- 5
prob <- 0.5

# Cumulative Binomial Distribution object
cum_dist <- bin_cumulative(trials,prob)

# 'bincum' as data.frame
cum_dist

# plot() will plot our 'bincum' object, different from 'bindis'
plot(cum_dist)

## ------------------------------------------------------------------------
#Arguments
trials <- 5
prob <- 0.5

#Binomial Variable Object
bin_var <- bin_variable(trials,prob)

# Displaying object
bin_var

# summary() of 'binvar'
bin_var_sum <- summary(bin_var)
bin_var_sum

