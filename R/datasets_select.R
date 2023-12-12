

#' Include/exclude datasets for the benchmark
#'
#' Each parameter corresponds to a dataset characteristic
#'
#' @param max_miss_prop maximum allowed proportion of missing values. Setting
#'   to zero (the default) means datasets with missing values are excluded.
#' @param min_features minimum allowed number of features.
#' @param max_features maximum allowed number of features.
#' @param min_obs minimum allowed number of observations.
#' @param max_obs maximum allowed number of observations.
#'
#' @return
#'  - data: data.table; openML dataset info
#'  - record: tibble; number of datasets excluded at each step

datasets_select <- function(max_miss_prop = 0,
                            min_features = 10,
                            max_features = 250,
                            min_obs = 100,
                            max_obs = 5000,
                            write_data = FALSE) {

 dataset_record <- tibble(exclusion = character(), n = integer())

 datasets <- as.data.table(listOMLDataSets())

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = "Datasets available in open ML",
   n = nrow(datasets)
  )

 # include datasets that can be used in supervised regression tasks

 tasks <- as.data.table(listOMLTasks(task.type = "Supervised Regression"))

 datasets <- datasets %>%
  .[data.id %in% tasks$data.id] %>%
  .[number.of.classes == 0]

 # this is a classification task dressed as a regression one
 datasets <- datasets[data.id != 301]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = "Datasets with 'Supervised Regression' task",
   n = nrow(datasets)
  )

 # missing data
 datasets[, miss_prop :=
           number.of.instances.with.missing.values /
           number.of.instances]

 datasets <- datasets[miss_prop <= max_miss_prop]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = paste0(
    "datasets with <=", max_miss_prop * 100, "% missing observations"
   ),
   n = nrow(datasets)
  )

 # data dimension;
 datasets <- datasets[number.of.features >= min_features]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("datasets with number of features >= {min_features}")
   ),
   n = nrow(datasets)
  )

 datasets <- datasets[number.of.features <= max_features]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("datasets with number of features <= {max_features}")
   ),
   n = nrow(datasets)
  )

 datasets <- datasets[number.of.instances >= min_obs]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("datasets with number of observations >= {min_obs}")
   ),
   n = nrow(datasets)
  )

 datasets <- datasets[number.of.instances <= max_obs]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("datasets with number of observations <= {max_obs}")
   ),
   n = nrow(datasets)
  )

 # fri data take up a disproportionate amount of sets.
 # reduce to include just one of these fri data sets.

 datasets <- datasets[!(data.id %in% seq(581, 658))]

 # using version 2 of runner data
 datasets <- datasets[data.id != 1436]

 # using version 7 of diabetes
 datasets <- datasets[!(data.id %in% seq(41514, 41519))]

 # regression autoHorse
 datasets <- datasets[data.id != 42224]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("removing overly similar datasets")
   ),
   n = nrow(datasets)
  )

 if(write_data){

  for(did in datasets$data.id){

   oml_data <- try(getOMLDataSet(data.id = did, verbosity = 0),
                   silent = TRUE)

   if(!is_error(oml_data)){

    outcome <- tasks[data.id == did] %>%
     getElement('target.feature') %>%
     unique()

    if(!is_empty(outcome)){

     setDT(oml_data$data)

     for(o in outcome){

      # write one file per outcome
      # other outcome(s) can be used as a predictor for current one
      if( length(unique(oml_data$data[[o]])) > 3 ){

       setnames(oml_data$data, old = o, new = 'outcome')

       fname <- paste0("data/", oml_data$desc$name, '-outcome-', o, '.csv')

       if(!file.exists(fname)) fwrite(oml_data$data, fname)

       setnames(oml_data$data, old = 'outcome', new = o)

      }

     }

    }

   }

  }

 }

 list(data = datasets,
      record = dataset_record)

}
