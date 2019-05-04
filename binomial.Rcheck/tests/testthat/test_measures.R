#######################################################
#title: "Workout03 - tests"
#author: "Ana Comesana"
#output: html_document
#######################################################

context("Test for summary measures")


#aux_mean()
test_that("aux_mean() function works as expected",{
  trials <- 10
  prob <- 0.5
  expect_equal(aux_mean(trials,prob),5)
  expect_length(aux_mean(trials,prob),1)
  expect_type(aux_mean(trials,prob), 'double')
})

#aux_variance()
test_that("aux_variance() function works as expected",{
  prob <- 0.5
  trials <- 1
  expect_equal(aux_variance(trials,prob),0.25)
  expect_length(aux_variance(trials,prob),1)
})
test_that("aux_variance() function works as expected",{
  prob <- 0.1
  trials <- 5
  expect_equal(aux_variance(trials,prob),0.45)
})


#aux_mode()
test_that("aux_mode() function works as expected",{
  trials <- 10
  prob <- 0.5
  expect_equal(aux_mode(trials,prob), 5)
  expect_length(aux_mode(trials,prob), 1)
})

test_that("aux_mode() function works as expected",{
  trials <- 10
  prob <- 1
  expect_equal(aux_mode(trials,prob),10)
  expect_is(aux_mode(trials,prob),'numeric')
})

#aux_skewness()
test_that("aux_skewness() function works as expected",{
  trials <- 10
  prob <- 0.5
  expect_equal(aux_skewness(trials,prob),0)
  expect_length(aux_skewness(trials,prob),1)
  expect_type(aux_skewness(trials,prob), 'double')
})


#aux_kurtosis()
test_that("aux_kurtosis() function works as expected",{
  prob <- 0.5
  trials <- 10
  expect_equal(aux_kurtosis(trials,prob),-0.2)
  expect_length(aux_kurtosis(trials,prob),1)
  expect_type(aux_kurtosis(trials,prob), 'double')
})
