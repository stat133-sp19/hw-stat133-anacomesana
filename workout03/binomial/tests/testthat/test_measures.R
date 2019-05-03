#######################################################
#title: "Workout03 - tests"
#author: "Ana Comesana"
#output: html_document
#######################################################

source("../../R/private_functions.R")



#aux_mean()
context("Test for mean")
test_that("function mean works as expected",{
  trials <- 10
  prob <- 0.5
  expect_equal(aux_mean(trials,prob),5)
  expect_length(aux_mean(trials,prob),1)
  expect_type(aux_mean(trials,prob), 'logical')
})


#aux_variance()
context("Test for variance")

test_that("function works as expected",{
  prob <- 0.5
  trials <- 1
  expect_equal(aux_variance(trials,prob),0.25)
  expect_length(aux_variance(trials,prob),1)
})
test_that("function works as expected",{
  prob <- 0.1
  trials <- 5
  expect_equal(aux_variance(trials,prob),0.45)
})


#aux_mode()
context("Test for mode value")

test_that("mode function works as expected for Your Turn",{
  trials <- 10
  prob <- 0.5
  expect_equal(aux_mode(trials,prob), 5)
  expect_length(aux_mode(trials,prob), 1)
})

test_that("mode function works as expected for Your Turn",{
  trials <- 10
  prob <- 1
  expect_equal(aux_mode(trials,prob),10)
  expect_is(aux_mode(trials,prob),'numeric')
})

#aux_skewness()
context("Test for skewness")
test_that("function skewness works as expected",{
  trials <- 10
  prob <- 0.5
  expect_equal(aux_skewness(trials,prob),0)
  expect_length(aux_skewness(trials,prob),1)
  expect_type(aux_skewness(trials,prob), 'logical')
})


#aux_kurtosis()
context("Test for kurtosis")

test_that("function kurtosis works as expected",{
  prob <- 0.5
  trials <- 10
  expect_equal(aux_kurtosis(trials,prob),-0.2)
  expect_length(aux_kurtosis(trials,prob),1)
  expect_type(aux_kurtosis(trials,prob), 'logical')
})

#aux_mode()
context("Test for mode value")


