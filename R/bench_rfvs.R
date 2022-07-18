#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param task
#' @param run
#' @param rfvs
#' @param tasks_included
bench_rfvs <- function(task,
                       run,
                       rfvs,
                       tasks_included,
                       train_prop = 1/2,
                       outcome_colname = 'outcome') {

 data <- try(
  tasks_included %>%
   get_oml_data(index = task, outcome_colname = outcome_colname),
  silent = TRUE
 )

 if(is_error(data)) browser()

 # set seed for each run using the value of run, i.e., 1, ..., n_runs
 # -> same train/test split for each run within each task
 set.seed(run)

 split <- initial_split(data, prop = train_prop)

 formula <- as.formula(glue("{outcome_colname} ~ ."))

 processor <- recipe(data, formula = formula) %>%
  step_dummy(all_nominal_predictors()) %>%
  prep(training = training(split))

 train <- juice(processor)
 test  <- bake(processor, new_data = testing(split))

 # select variables in training set

 start_time <- Sys.time()
 vars_selected <- do.call(rfvs, args = list(train, outcome_colname))
 end_time <- Sys.time()

 # fit a final model to the training data
 # using the .. prefix to select columns from a data.table
 fit <- try(ranger(outcome ~ ., data = train[, vars_selected]))

 if(is_error(fit)) browser()

 pred <- predict(fit, data = test[, vars_selected])
 truth <- test[[outcome_colname]]

 tibble(task = task,
        run = run,
        rfvs = rfvs,
        n_selected = length(vars_selected) - 1,
        rmse = eval_rmse(pred$predictions, truth),
        rsq = eval_rsq(pred$predictions, truth),
        time = end_time - start_time)


}
