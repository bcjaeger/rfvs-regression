#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param task
#' @param run
#' @param rfvs
#' @param tasks_included
bench_rfvs <- function(dataset,
                       outcome,
                       label,
                       rfvs,
                       run,
                       train_prop = 1/2) {

 fname <- as.character(glue("data/{dataset}-outcome-{outcome}.csv"))

 # Custom step function to scale and ensure values are greater than 0
 scale_gt_zero <- function(x) {
  min_val <- min(x, na.rm = TRUE)
  if (min_val <= 0) {
   return(x + abs(min_val) + 0.001) # Add a small value to ensure > 0)
  }
  x
 }

 data <- fread(fname) %>%
  mutate(across(where(is.numeric), scale_gt_zero))



 # set seed for each run using the value of run, i.e., 1, ..., n_runs
 # -> same train/test split for each run within each task
 set.seed(run)

 split <- initial_split(data, prop = train_prop)

 formula <- outcome ~ .

 processor <- recipe(data, formula = formula) %>%
  step_BoxCox(outcome, all_numeric_predictors()) %>%
  # in case we allow missing values
  step_impute_mean(all_numeric_predictors()) %>%
  step_impute_mode(all_nominal_predictors()) %>%
  # sparse factor protection
  step_novel(all_nominal_predictors()) %>%
  step_dummy(all_nominal_predictors()) %>%
  # cast weird integer 64 types to doubles
  step_mutate(across(everything(), as.numeric)) %>%
  step_nzv(all_predictors()) %>%
  prep(training = training(split))

 train <- juice(processor)
 test  <- bake(processor, new_data = testing(split))

 # select variables in training set

 start_time <- Sys.time()

 vars_selected <- rfvs(train = train, formula = formula) %>%
  c("outcome") %>%
  unique()

 end_time <- Sys.time()

 # fit a final model to the training data
 # using the .. prefix to select columns from a data.table

 # fit <- rfsrc(outcome ~ .,
 #              data = as.data.frame(train[, vars_selected]))

 fit_axis <- try(ranger(outcome ~ ., data = train[, vars_selected]))
 fit_oblique <- try(orsf(train[, vars_selected], outcome ~ .))

 if(is_error(fit_axis) || is_error(fit_oblique)) browser()

 pred_axis <- fit_axis %>%
  predict(data = as.data.frame(test[, vars_selected])) %>%
  getElement('predictions')

 pred_oblique <- fit_oblique %>%
  predict(new_data = as.data.frame(test[, vars_selected])) %>%
  as.numeric()

 tibble(
  dataset = dataset,
  outcome = outcome,
  rfvs = label,
  run = run,
  n_selected = length(vars_selected) - 1,
  rmse_axis = eval_rmse(pred_axis, test$outcome),
  rsq_axis = eval_rsq(pred_axis, test$outcome),
  rmse_oblique = eval_rmse(pred_oblique, test$outcome),
  rsq_oblique = eval_rsq(pred_oblique, test$outcome),
  time = end_time - start_time
 )


}
