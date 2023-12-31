% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/part 3 confusion matrix.R
\name{confusion_matrix}
\alias{confusion_matrix}
\title{“Confusion Matrix”  (using a cut-off value for prediction at 0.5)}
\usage{
confusion_matrix(Data, X, y, cut_off = 0.5)
}
\arguments{
\item{y}{: A  \code{integer} denoting the column of \code{Data} representing the response variable.}

\item{cut_off}{: A number of the value for prediction, default is 0.5. (i.e. assign value 1 for predictions above 0.5 and value 0 for prediction below or equal to 0.5)}

\item{Data:}{A  \code{matrix} containing the data we want to perform logistic regression on.}

\item{X:}{A  \code{vector} denoting the columns of \code{Data} representing the predictor variables.}
}
\value{
A list of the following attributes: `confusion_matrix`, `prevalence`, `accuracy`, `sensitivity`, `specificity`, `false_discovery_rate`, `diagnostic_odds_ratio`
}
\description{
based on this cut-off value, create the confusion matrix and also output the following metrics: prevalence, accuracy, sensitivity, specificity, false discovery rate, and diagnostic odds ratio
}
\examples{
#data obtained from https://stats.oarc.ucla.edu/r/dae/logit-regression/
test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
  test_resp <- 1
  test_pred <- 2:4
# Call your confusion_matrix function
result <- confusion_matrix(Data = test_data, X=test_pred, y=test_resp, cut_off = 0.5)
print(result)
}
\author{
Group 11
}
