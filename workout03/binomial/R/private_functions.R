# 1.1) Private Checker Functions

# Description: tests if input is valid prob value
# Inputs
#   prob: a probability (numeric)
# Output
#   TRUE if prob between 0 and 1
#   stops otherwise
check_prob <-function(prob) {
  if ((prob>=0)& (prob<=1)) {
    return(TRUE)
  }
  else {
    stop('probability not valid or out of bounds [0,1]')
  }
}


# Description: tests if input is valid number of
# trials value
# Inputs
#   trials: number of trials (numeric)
# Output
#   TRUE if trials non-negative
#   stops otherwise
check_trials <- function(trials) {
  if (trials>=0) {
    return(TRUE)
  }
  else{
    stop('invalid trials value')
  }
}

# Description: tests if input is valid number of
# successes value
# Inputs
#   success: a number of successes (numeric)
#   trials: a number of trials (numeric)
# Output
#   TRUE if successes non-negative and not greater
#   than number of trials
#   stops otherwise
check_success <- function(success,trials) {
  for(i in success) {
    if (i<0 | i>trials) {
      stop('invalid success value')
    }
  else {
    return(TRUE)
    }
  }
}

# 1.2) Private Auxiliary Functions

# Description: returns mean of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   mean of the binomial distribution
aux_mean <- function(trials,prob) {
  return(trials * prob)
}

# Description: returns variance of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   variance of the binomial distribution
aux_variance <- function(trials,prob) {
  return(trials*prob*( 1 - prob))
}

# Description: returns mode of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   mode of the binomial distribution
aux_mode <- function(trials,prob) {
  if (prob==1) {
    return(trials)
  }
  else {
  return(as.integer(floor(trials * prob + prob)))
    }
}
# Description: returns skewness of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   skewness of the binomial distribution
aux_skewness <- function(trials,prob) {
  return((1 - 2 * prob)/sqrt(trials*prob*( 1 - prob)))
}

# Description: returns kurtosis of binomial distribution
# Inputs
#   trials: the number of trials (numeric)
#   prob: the probability for the binomial distribution
# Output
#   kurtosis of the binomial distribution
aux_kurtosis <- function(trials,prob) {
  return((1-6*prob*(1-prob))/(trials * prob * (1-prob)))
}
