#######################################################
#title: "Workout03 - tests"
#author: "Ana Comesana"
#output: html_document
#######################################################


context("Test checker functions")

#check_prob()
test_that("check_prob() function works as expected",{
  prob <- 0.8
  expect_equal(check_prob(prob),TRUE)
  expect_length(check_prob(prob),1)
  expect_type(check_prob(prob), 'logical')
})
test_that("check_prob() function works as expected",{
  y <- '0.9'
  expect_error(check_prob(y),"probability must be numberic and of length 1")
})
test_that("check_prob() function works as expected",{
  z <- c(0.5,0.3)
  expect_error(check_prob(z),"probability must be numberic and of length 1")
})



#check_trials()
test_that("check_trials() function works as expected",{
  trials <- 45
  expect_equal(check_trials(trials),TRUE)
  expect_length(check_trials(trials),1)
})
test_that("check_trials() function works as expected",{
  y <- 'this is no valid'
  expect_error(check_prob(y),"probability must be numberic and of length 1")
})
test_that('check_trials() function works as expected', {
  y <- c(1,4)
  expect_error(check_trials(y), 'number of trials must be of length 1')
})


#check_success()
test_that("check_success() function works as expected",{
  success <- 3
  trials <- 10
  expect_equal(check_success(success,trials),TRUE)
  expect_is(check_success(success,trials),'logical')
})

test_that("check_trials() function works as expected",{
  suc <- 15
  trials <- 10
  expect_error(check_success(suc,trials),'successes must be less that or equal to trials')
})
