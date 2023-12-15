
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rfvs-regression

<!-- badges: start -->
<!-- badges: end -->

The goal of rfvs-regression is to compare random forest variable
selection techniques for continuous outcomes

# Datasets included

<img src="README_files/figure-gfm/unnamed-chunk-2-1.png" width="794" />

# Central illustration

The experiment we ran involves three steps:

1.  Select variables with a given method.
2.  Fit a random forest to the data, including only selected variables.
3.  Evaluate prediction accuracy of the forest in held-out data.

*Note*: We use both axis-based and oblique random forests for regression
in step 2.

We assume that better variable selection leads to better prediction
accuracy. Results from the experiment are below.

<img src="README_files/figure-gfm/unnamed-chunk-3-1.png" width="1564" />

*Takeaways*:

1.  Using oblique forests to select variables (the `aorsf` method for
    variable selection) leads to a parsimonious set of predictors with
    high prediction accuracy. Moreover, prediction accuracy is high
    whether the final model is oblique or axis-based.

2.  If the final model is axis-based rather than oblique, the axis-based
    variable selection methods do much better in terms of prediction
    accuracy.
