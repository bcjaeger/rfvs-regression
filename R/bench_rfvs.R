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
                       rfvs_label,
                       rfvs_fun,
                       run,
                       train_prop = 1/2) {

 fname <- as.character(glue("data/{dataset}-outcome-{outcome}.csv"))

 data <- fread(fname) |>
  mutate(across(where(is.character), as.factor))

 # set seed for each run using the value of run, i.e., 1, ..., n_runs
 # -> same train/test split for each run within each task
 set.seed(run)

 split <- initial_split(data, prop = train_prop)

 formula <- outcome ~ .

 processor <- recipe(data, formula = formula) %>%
  # in case we allow missing values
  step_impute_mean(all_numeric_predictors()) %>%
  step_impute_mode(all_nominal_predictors()) %>%
  step_nzv(all_predictors()) %>%
  # sparse factor protection
  step_other(all_nominal_predictors(), other = "lump_other") %>%
  step_dummy(all_nominal_predictors()) %>%
  # cast weird integer 64 types to doubles
  step_mutate(across(everything(), as.numeric)) %>%
  prep(training = training(split))

 train <- juice(processor)
 test  <- bake(processor, new_data = testing(split))

 # select variables in training set

 start_time <- Sys.time()

 vars_selected <- try(rfvs_fun(train = train, formula = formula) %>%
                       c("outcome") %>%
                       unique())

 if (is_error(vars_selected)) {
  return(
   tibble(
    dataset = dataset,
    outcome = outcome,
    rfvs = rfvs_label,
    run = run,
    n_selected = NA_real_,
    rmse = NA_real_,
    rsq = NA_real_,
    time = NA_real_
   )
  )
 }

 end_time <- Sys.time()

 # fit a final model to the training data
 # using the .. prefix to select columns from a data.table

 # fit <- rfsrc(outcome ~ .,
 #              data = as.data.frame(train[, vars_selected]))

 fit <- try(ranger(outcome ~ ., data = train[, vars_selected]))

 if(is_error(fit)) browser()

 pred <- predict(fit, data = as.data.frame(test[, vars_selected]))

 tibble(
  dataset = dataset,
  outcome = outcome,
  rfvs = rfvs_label,
  run = run,
  n_selected = length(vars_selected) - 1,
  rmse = eval_rmse(pred$predictions, test$outcome),
  rsq = eval_rsq(pred$predictions, test$outcome),
  time = end_time - start_time
 )


}
