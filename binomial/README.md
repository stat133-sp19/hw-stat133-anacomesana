# Stat 133 Workout03

This directory contains all files for Workout03.
Workout03 involves creating an R package that implements functions and methods to calculate probabilities for a
Binomial random variable, as well as related calculations such as probability distribution, mean of distribution,
or spread.

## Files
The workout03 repository contains the folder binomial (per instructions), which contains the following functions
and files.

### R/

#### Summary Measures: [measures_functions.R]
- bin_mean: binomial distribution mean
- bin_variance: binomial distribution variance
- bin_mode: binomial distribution mode
- bin_skewness: binomial distribution skewness
- bin_kurtosis: binomial distribution kurtosis


#### Binomial Functions: [binomial_dist_functions.R]
- bin_choose: calculates number of ways of choosing k objects in n objects
- bin_probability: binomial probability of getting certain number of successes in certain binomial distribution

#### Binomial Objects: [binomial_dist_objects.R]
- bin_distribution: constructs Binomial Distribution object of class ['bindis',data.frame]
  - plot.bindis: generic method to plot bindis object
- bin_cumulative: constructs Cumulative Binomial Distribution objects of class ['bincum',data.frame]
  - plot_bincum: generic methos to plot bincum object

#### Binomial Variable: [bin_variable_functions.R]
- bin_variable: constructs Binomial Variable object of class 'binvar'
  - print.binvar: generic method to print the Binomial Variable
  - summary.binvar: generic method to create a summary of the Binomial variable
  - print.summary.binvar: generic method to print the summary of the Binomial Variable

### tests
Tests for the functions of the binomial package via the package 'testthat'

### vignette
Introductory vignette with instructions as to how to utilize the different functionalities of
the Binomial package. Please refer to this folder for further information on how to use this package.
