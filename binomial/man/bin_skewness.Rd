% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/measures_functions.R
\name{bin_skewness}
\alias{bin_skewness}
\title{Binomial Skewness function}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{number of trials (numeric)}

\item{prob}{probability of success (numeric)}
}
\value{
skewness of distribution
}
\description{
Returns the skewness of a binomial
distribution
}
\examples{
bin_skewness(10,0.3)
}
