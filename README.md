Logistic Regression Package: log.reg.11
================
Group 11: Charles Benfer, Ernest Asante, Rongjing Xia
11-30-2023

### Introduction

This is an R package for performing logistic regression, implemented
through numerical optimization. This package contains the basic
functions needed to perform logistic regression, including estimating a
vector of coefficients `β` containing independent/predictor variables
and intercepts, confidence intervals for `β`, a fitted logistic curve
plot of the response, and the resulting “confusion matrix” and plotting
each cut_off Plot of different indicator values corresponding to the
values. Also includes help documentation for all functions.

### Install the package

First, users can download the latest package through github through the
following code
‘devtools::install_github(“R-4-Data-Science/Final-Project-Group-11”)’.(If
the user does not have the ‘devtools’ package installed, this package
needs to be installed first)

``` r
devtools::install_github("R-4-Data-Science/Final-Project-Group-11")
```

    ## Skipping install of 'log.reg.11' from a github remote, the SHA1 (8abb82b1) has not changed since last install.
    ##   Use `force = TRUE` to force installation

``` r
library(log.reg.11)
```

Next, we will borrow a set of data to show how the main functions in our
package have been output and displayed.

``` r
 #data obtained from https://stats.oarc.ucla.edu/r/dae/logit-regression/
test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
```

### 1. Finding the Betas: `log_betas`

This function will spit out the desired beta values for the log loss
function. The function `log_loss` is first defined in the package, given
as a premise a number representing a given loss. The user will be shown
a list in the output, where the first part `par` is the betas. Y
representing the column of the data that you want to be the response
variable and X representing the column(s) of the data that you want to
be the predictor variable(s).

``` r
test_resp <- 1
test_pred <- 2:4
log_betas(Data = test_data, Y = test_resp, X = test_pred)
```

    ## $par
    ##              [,1]
    ## [1,] -3.440677328
    ## [2,]  0.002289743
    ## [3,]  0.774910748
    ## [4,] -0.559607591
    ## 
    ## $value
    ## [1] 229.7209
    ## 
    ## $counts
    ## function gradient 
    ##      473       NA 
    ## 
    ## $convergence
    ## [1] 0
    ## 
    ## $message
    ## NULL

### 2. Bootstrap Logistic Regression Confidence Intervals: `bootstrap_logistic_confidence`

This function will help the user calculate bootstrap confidence
intervals for the coefficients estimated by a logistic regression model.
Next we will continue to use the data just now to show the confidence
interval calculated by our function.

``` r
results <- suppressWarnings(bootstrap_logistic_confidence(test_data, test_resp, test_pred))
print(results)
```

    ##            Actual         Lower        Upper
    ## [1,] -3.440677328 -7.1930665424  0.311711886
    ## [2,]  0.002289743 -0.0009014579  0.005480944
    ## [3,]  0.774910748 -0.1427097565  1.692531252
    ## [4,] -0.559607591 -0.8808601969 -0.238354984

### 3. Plot of the fitted logistic curve to the responses: `logistic_plot`

This function will help the user Plot of the fitted logistic curve to
the responses estimated by the logistic regression model. The example:

``` r
logistic_plot(test_data, Resp = 1, Pred= 3)
```

![](README_files/figure-gfm/the%20example%20for%20the%20function%20logistic_plot-1.png)<!-- -->

### 4. Confusion matrix and related indicators: `confusion_matrix`

This function help user create the confusion matrix and also output the
following metrics: prevalence, accuracy, sensitivity, specificity, false
discovery rate, and diagnostic odds ratio based on this cut-off value
0.5. This function will output a list including the values of the above
indicators, in the part of the corresponding name. The example:

``` r
result <- confusion_matrix(Data = test_data, X=test_pred, y=test_resp, cut_off = 0.5)
print(result)
```

    ## $confuse_matrix
    ##                 Predicted Positive Predicted Negative
    ## Actual Positive                263                118
    ## Actual Negative                 10                  9
    ## 
    ## $prevalence
    ## [1] 0.3175
    ## 
    ## $accuracy
    ## [1] 0.68
    ## 
    ## $sensitivity
    ## [1] 0.07086614
    ## 
    ## $specificity
    ## [1] 0.96337
    ## 
    ## $false_discovery_rate
    ## [1] 0.5263158
    ## 
    ## $diagnostic_odds_ratio
    ## [1] 2.005932

### 5. Plot different cut_off value versus indicators: `plot_confusion_matrix`

The possibility for the user to plot of any of the above metrics
evaluated over a grid of cut-off values for prediction going from 0.1 to
0.9 with steps of 0.1. Parameter `value_name` requires the user to
specify among 6 indicators(`prevalence`, `accuracy`, `sensitivity`,
`specificity`, `false_discovery_rate`, `diagnostic_odds_ratio`). If the
input is incorrect, the user will be prompted in the output that “the
indicator does not exist”. If the user does not select an indicator, a
plot of prevalence versus different cut_off values is output.

``` r
plot_confusion_matrix(Data = test_data, y = test_resp,X = test_pred , value_name = 'false_discovery_rate')
```

![](README_files/figure-gfm/the%20example%20for%20the%20function%20plot_confusion_matrix-1.png)<!-- -->

``` r
# The example for not exist.
plot_confusion_matrix(Data = test_data, y = test_resp,X = test_pred , value_name = 'false_discovery')
```

    ## false_discovery do not exist.

### 6. For the bonus part

Our package created a shiny app that allows the used to view each of the
plots by making a selection from a dropdown menu.

Framework reference link for this
introduction:<https://chat.openai.com/share/d590f325-5ab6-4642-98d4-127034991dbb>
