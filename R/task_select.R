

#' Include/exclude tasks for the benchmark
#'
#' Each parameter corresponds to a task characteristic
#'
#' @param max_miss_prop maximum allowed proportion of missing values. Setting
#'   to zero (the default) means tasks with missing values are excluded.
#' @param min_features minimum allowed number of features.
#' @param max_features maximum allowed number of features.
#' @param min_obs minimum allowed number of observations.
#' @param max_obs maximum allowed number of observations.
#'
#' @return
#'  - data: data.table; openML task info
#'  - record: tibble; number of tasks excluded at each step

task_select <- function(max_miss_prop = 0,
                        min_features = 5,
                        max_features = 1000,
                        min_obs = 200,
                        max_obs = 10000) {

 task_record <- tibble(exclusion = character(), n = integer())

 tasks <- as.data.table(listOMLTasks())

 tasks <- tasks[format != 'Sparse_ARFF']

 task_record <- task_record %>%
  add_row(
   exclusion = paste0(
    "tasks available from open ML"
   ),
   n = nrow(tasks)
  )

 # include regression tasks
 tasks <- tasks[task.type == 'Supervised Regression']

 task_record <- task_record %>%
  add_row(
   exclusion = paste0(
    "tasks with continuous outcome"
   ),
   n = nrow(tasks)
  )

 # missing data
 tasks[, miss_prop :=
            number.of.instances.with.missing.values /
            number.of.instances]

 tasks <- tasks[miss_prop <= max_miss_prop]

 task_record <- task_record %>%
  add_row(
   exclusion = paste0(
    "tasks with <=", max_miss_prop * 100, "% missing observations"
   ),
   n = nrow(tasks)
  )

 # data dimension; %between% includes the boundaries by default
 tasks <- tasks[number.of.features %between% c(min_features, max_features)]

 task_record <- task_record %>%
  add_row(
   exclusion = as.character(
    glue("tasks with {min_features} <= number of features <= {max_features}")
   ),
   n = nrow(tasks)
  )

 tasks <- tasks[number.of.instances %between% c(min_obs, max_obs)]

 task_record <- task_record %>%
  add_row(
   exclusion = as.character(
    glue("tasks with {min_obs} <= number of observations <= {max_obs}")
   ),
   n = nrow(tasks)
  )

 list(data = tasks,
      record = task_record)

}
