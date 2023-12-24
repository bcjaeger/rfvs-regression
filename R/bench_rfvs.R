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

 data <- fread(fname)

 # set seed for each run using the value of run, i.e., 1, ..., n_runs
 # -> same train/test split for each run within each task
 set.seed(run)

 split <- initial_split(data, prop = train_prop)


 formula <- outcome ~ .

 processor <- recipe(data, formula = formula) %>%
  # in case we allow missing values
  step_impute_mean(all_numeric_predictors()) %>%
  step_impute_mode(all_nominal_predictors()) %>%
  step_other(all_nominal_predictors(),
             threshold = 0.05,
             other = "other_recipe_cat") %>%
  # sparse factor protection
  step_novel(all_nominal_predictors()) %>%
  step_dummy(all_nominal_predictors()) %>%
  step_lincomb(all_numeric_predictors()) %>%
  # cast integer 64 types to doubles
  step_mutate(across(everything(), as.numeric)) %>%
  step_nzv(all_predictors()) %>%
  prep(training = training(split))

 train <- juice(processor)
 test  <- bake(processor, new_data = testing(split))

 # select variables in training set

 start_time <- Sys.time()

 vars_selected <- try(
  rfvs(train = train, formula = formula) %>%
   c("outcome") %>%
   unique()
 )

 if(is_error(vars_selected)) browser()

 end_time <- Sys.time()

 # fit a final model to the training data
 # using the .. prefix to select columns from a data.table

 # fit <- rfsrc(outcome ~ .,
 #              data = as.data.frame(train[, vars_selected]))


 fit_axis <- ranger(outcome ~ ., data = train[, vars_selected])

 fit_oblique <- orsf(train[, vars_selected], outcome ~ .)

 pred_axis <- fit_axis %>%
  predict(data = as.data.frame(test[, vars_selected])) %>%
  getElement('predictions')

 pred_oblique <- fit_oblique %>%
  predict(new_data = as.data.frame(test[, vars_selected])) %>%
  as.numeric()

 rsq_obi = eval_rsq(pred_oblique, test$outcome)
 rsq_axi = eval_rsq(pred_axis, test$outcome)

 print(
  table_glue(
   "{dataset} ({label}) -- {rsq_obi-rsq_axi}"
  )
 )

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
