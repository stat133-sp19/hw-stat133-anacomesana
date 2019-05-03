# Stat 133 Workout03

This directory contains all files for Workout03.
Workout03 involves creating an R package that implements functions and methods to calculate probabilities for a
Binomial random variable, as well as related calculations such as probability distribution, mean of distribution,
or spread.

## Files
The workout03 repository contains the folder binomial (per instructions), which contains the following functions
and files.

### R/
This folder contains 3 R script files:
- private_functions.R: a script with private checker functions 'check_trials', 'check_prob'
and 'check_success' and private auxiliary functions responsible for calculating the mean,
variance, mode, skewness, and kurtosis of a Binomial distribution.

- main_functions.R: s cript with the main functions except those to calculate measure.
In particular, this script contains 'bin_choose', 'bin_probability','bin_distribution',
'bin_cumulative', and 'bin_variable', as well as methods for the last two.

- measures_functions.R: a script containing main functions for each of the summary measures
as described above.

### tests
Tests for the functions of the binomial package via the package 'testthat'

### vignette
Introductory vignette with instructions as to how to utilize the different functionalities of
the Binomial package

### man

### NAMESPACE
The namespace file for this package.

### binomial.Rproj

### devtools-flow.R
a Devtools workflow to generate and check documentation, run tests, build vignettes, build bundle,
and install the package
