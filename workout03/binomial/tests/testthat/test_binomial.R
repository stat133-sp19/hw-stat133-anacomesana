#######################################################
#title: "Workout03 - tests"
#author: "Ana Comesana"
#output: html_document
#######################################################

source("../../R/private_functions.R")



#bin_choose()
context("Test for choose")
test_that("function choose works as expected",{
  k <- 4
  n <- 10
  expect_equal(bin_choose(n,k),210)
  expect_length(bin_choose(n,k),1)
  expect_type(bin_choose(n,k), 'logical')
})
test_that("function choose works as expected",{
  k <- 10
  n <- 4
  expect_error(bin_choose(n,k),'k cannot be greater than n')
})

#bin_probability()
context("Test for binomial probability")
test_that("function works as expected",{
  success <- 4
  prob <- 0.5
  trials <- 10
  expect_is(bin_probability(success,trials,prob),'numeric')
  expect_length(aux_variance(success,trials,prob),1)
})
test_that("function works as expected",{
  success <- 5
  prob <- 0.1
  trials <- 2
  expect_error(bin_probability(success,trials,prob),'invalid success value')
})
test_that("function works as expected", {
  success <- 1
  prob <- 1.1
  trials <- 10
  expect_error(bin_probability(success,trials,prob), 'probability not valid or out of bounds [0,1]')
})

#bin_distribution()
context("Test for binomial distribution")

test_that("distribution function works as expected for Your Turn",{
  trials <- 5
  prob <- 0.5
  expect_equal(bin_distribution(trials,prob),
               data.frame(list(success = 0:5,
                               probability = c(0.03125,0.15625,0.31250,0.31250,0.15625,0.03125))))
  expect_length(bin_distribution(trials,prob), 2)
  expect_is(bin_distribution(trials,prob),'data.frame')
})

#bin_cumulative()
context("Test for cumulative probability")
test_that("function cumulative works as expected",{
  trials <- 5
  prob <- 0.5
  expect_equal(bin_cumulative(trials,prob),
               data.frame(list(success = 0:5,
                               probability = c(0.03125,0.15625,0.31250,0.31250,0.15625,0.03125),
                               cumulative = c(0.03125,0.18760,0.50000,0.81250,0.96875,1.00000))))
  expect_length(bin_cumulative(trials,prob),3)
  expect_type(bin_cumulative(trials,prob), 'data.frame')
})

#bin_variable()
context("Test for binomimal variable")
test_that("function binomial variable works as expected",{
  prob <- 0.5
  trials <- 10
  expect_length(bin_variable(trials,prob),2)
  expect_is(aux_kurtosis(trials,prob), 'binvar')
})

