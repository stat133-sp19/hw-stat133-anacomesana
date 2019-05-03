#######################################################
#title: "Workout03 - tests"
#author: "Ana Comesana"
#output: html_document
#######################################################

source("../../R/private_functions.R")



#check_prob()
context("Test for probability")

test_that("function works as expected",{
  prob <- 0.8
  expect_equal(check_prob(prob),TRUE)
  expect_length(check_prob(prob),1)
  expect_type(check_prob(prob), 'logical')
})
test_that("function works as expected",{
  y <- '0.9'
  expect_error(check_prob(y),"probability not valid or out of bounds [0,1]")
})
test_that("function works as expected",{
  z <- 2
  expect_error(check_prob(y),"probability not valid or out of bounds [0,1]")
})



#check_trials()
context("Test for number of trials")

test_that("function works as expected",{
  trials <- 45
  expect_equal(check_trials(trials),TRUE)
  expect_length(check_trials(trials),1)
})
test_that("function works as expected",{
  y <- 'this is no valid'
  expect_error(check_prob(y),"invalid trials value")
})


#check_success()
context("Test for success value")

test_that("success function works as expected for Your Turn",{
  success <- 3
  trials <- 10
  expect_equal(check_success(success,trials),TRUE)
  expect_length(check_success,trials, 1)
})

test_that("success function works as expected for Your Turn",{
  suc <- 15
  trials <- 10
  expect_error(check_success(suc,trials),'invalid success value')
})
