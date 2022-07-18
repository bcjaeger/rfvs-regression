


#' Get an OML dataset
#'
#' Some steps to standardize the data returned:
#'
#' - format as a data.table object
#'
#' - set the name of the outcome column to be "outcome"
#'
#' @param tasks_included a target created in _targets.R
#'
#' @param index an integer from 1 to nrow(tasks_included$task_data),
#'   indicating which task to fetch the data for.
#'
#' @param outcome_colname a character value indicating what we would
#'   like the outcome column to be named.
#'

get_oml_data <- function(tasks_included,
                         index,
                         outcome_colname = 'outcome'){

 dt <- tasks_included$data

 data_id <- dt$data.id[index]

 oml_data <- getOMLDataSet(data_id, verbosity = 0)

 as.data.table(oml_data$data) %>%
  setnames(old = dt$target.feature[index],
           new = outcome_colname)

}


