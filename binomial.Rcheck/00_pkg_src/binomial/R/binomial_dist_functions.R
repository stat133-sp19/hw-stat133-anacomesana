#' @title Binomial choose function
#' @description Outputs number of combinations in which k succeses
#' can occur in n trials
#' @param n number of trials (numeric)
#' @param k number of successes (numeric)
#' @return number of combinations "n choose k"
#' @export
#' @examples
#' bin_choose(n=5,k=2)
#' bin_choose(5,0)
#' bin_choose(5,1:3)
bin_choose <- function(n,k) {
  if (any(k>n)) {
    stop('k cannot be greater than n')
  }
  return(factorial(n)/((factorial(k))*factorial(n-k)))
}

#' @title Binomial probability function
#' @description Outputs probability of 'success'
#'  number of successes in 'trials' number of trials with
#'  probability 'prob'.
#' @param success number of successes (numeric)
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return probability of number of successes
#'  in binomial distribution
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55,trials = 100,prob = 0.45)
bin_probability <- function(success,trials,prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success,trials)
  bin_choose(trials,success) * (prob)**(success) * (1-prob)**(trials-success)
}
