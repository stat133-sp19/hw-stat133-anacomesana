#' @title n choose k function
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
  if (k>n) {
    stop('k cannot be greater than n')
  }
  return(factorial(n)/((factorial(k))*factorial(n-k)))
}

#' @title Binomial probability function
#' @description Outputs probability of 'success'
#'  number of successes in 'trials' number of trials with
#'  probability 'prob'.
#' @param num number of successes (numeric)
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

#' @title Binomial Distribution function
#' @description Returns dataframe with probability distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return dataframe with number of successes and probability
#' with two classes, bindis and data.frame
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials,prob) {
  prob_df = matrix(ncol = 2,nrow = trials+1)
  for (i in seq(0,trials,1)) {
    prob_df[i+1,1] = i
    prob_df[i+1,2] = bin_probability(i,trials,prob)
  }
  prob_df <- data.frame(prob_df)
  colnames(prob_df) <- c('success','probability')
  class(prob_df) <- c('bindis','data.frame')
  return(prob_df)
}

#' @export
plot.bindis <- function(distr) {
  barplot(
    distr$probability,
    names.arg = distr$success,
    xlab='successes',
    ylab='probability'
  )
  }

#' @title Cumulative Binomial Distribution function
#' @description Returns dataframe with probability
#' distribution and cumulative probability
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return dataframe with number of successes, probability,
#' and cumulative probability with two classes, bindis and data.frame
#' @export
#' @examples
#' bin_cumulative(trials=5,prob=0.5)
bin_cumulative <- function(trials,prob) {
  prob_df = matrix(ncol = 3,nrow = trials+1)
  for (i in seq(0,trials,1)) {
    if (i==0){
      prob_df[i+1,1] = i
      prob_df[i+1,2] = bin_probability(i,trials,prob)
      prob_df[i+1,3] = prob_df[i+1,2]
    }
    else {
      prob_df[i+1,1] = i
      prob_df[i+1,2] = bin_probability(i,trials,prob)
      prob_df[i+1,3] = prob_df[i,3]+prob_df[i+1,2]
    }
  }
  prob_df <- data.frame(prob_df)
  colnames(prob_df) <- c('success','probability','cumulative')
  class(prob_df) <- c('bincum','data.frame')
  return(prob_df)
}

#' @export
plot.bincum <- function(distr) {
  plot(
    x= distr$success,
    y= distr$cumulative,
    type = 'o',
    xlab='successes',
    ylab='probability'
  )
  lines(distr$success,distr$cumulative)
}

#' @title Binomial Random Variable function
#' @description Returns object of class binvar
#' that is a list of number of trials,
#' and probability of success
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return list of number of trials
#' and probability of success with class binvar
#' @export
#' @examples
#' bin_variable(trials=5,prob=0.5)
bin_variable <- function(trials,prob) {
  our_ls = list('trials' = trials,
       'prob' = prob)
  class(our_ls) = 'binvar'
  return(our_ls)
}

#' @export
print.binvar <- function(distr) {
cat(paste0('"Binomial variable"\n \nParameters \n- number of trials: ',
             distr$trials,
        '\n- prob of success: ',distr$prob))
}

#' @export
summary.binvar <- function(distr) {
  sum_ls = list(
    'trials' = distr$trials,
    'prob' = distr$prob,
    'mean' = aux_mean(distr$trials,distr$prob),
    'variance' = aux_variance(distr$trials,distr$prob),
    'mode' = aux_mode(distr$trials,distr$prob),
    'skewness' = aux_skewness(distr$trials,distr$prob),
    'kurtosis' = aux_kurtosis(distr$trials,distr$prob)
  )
  class(sum_ls) = 'summary.binvar'
  return(sum_ls)
}

#' @export
print.summary.binvar <- function(sm) {
 format(paste0(print.binvar(sm),
   '\n\nMeasures\n- mean: ',
            sm$mean,
            '\n- variance:',
            sm$variance,
            '\n- mode: ',
            sm$mode,
            '\n- skewness: ',
            sm$skewness,
            '\n- kurtosis: ',
            sm$kurtosis)
   )
}
