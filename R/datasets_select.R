

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

datasets_select <- function(max_miss_prop,
                            min_features,
                            max_features,
                            min_obs,
                            max_obs,
                            min_outcome_uni,
                            write_data) {

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
   exclusion = "With 'Supervised Regression' task",
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
    "With <=", max_miss_prop * 100, "% missing observations"
   ),
   n = nrow(datasets)
  )

 # data dimension;
 datasets <- datasets[number.of.features >= min_features]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("With number of features >= {min_features}")
   ),
   n = nrow(datasets)
  )

 datasets <- datasets[number.of.features <= max_features]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("With number of features <= {max_features}")
   ),
   n = nrow(datasets)
  )

 datasets <- datasets[number.of.instances >= min_obs]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("With number of observations >= {min_obs}")
   ),
   n = nrow(datasets)
  )

 datasets <- datasets[number.of.instances <= max_obs]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("With number of observations <= {max_obs}")
   ),
   n = nrow(datasets)
  )

 # fri data are simulated.
 datasets <- datasets[!(str_detect(name, "^fri\\_"))]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("Remove simulated data")
   ),
   n = nrow(datasets)
  )

 # use most recent version

 setkey(datasets, name, version)

 datasets <- datasets[datasets[, .I[.N], by = .(name)]$V1]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("Remove redundant data versions (use most recent)")
   ),
   n = nrow(datasets)
  )

 datasets <- datasets[format != "Sparse_ARFF"]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("Remove sparse ARFF data")
   ),
   n = nrow(datasets)
  )

 # kdd have many entries. Just use 1 to prevent them from having
 # too much influence on the overall results.

 kdd_did <- datasets$data.id[str_detect(datasets$name, "^kdd")]

 kdd_did_drop <- kdd_did[-1]
 kdd_rows_drop <- which(datasets$data.id %in% kdd_did_drop)

 datasets <- datasets[-kdd_rows_drop]

 # remove geographic_origin_of_music, but keep GeographicOriginOfMusic
 datasets <- datasets[data.id != 44965]

 # cpu_act and cpu_activity
 datasets <- datasets[data.id != 44978]

 # boston and boston_corrected (keep)
 datasets <- datasets[data.id != 531]

 # remove auto_price but keep AutoPrice
 datasets <- datasets[data.id != 207]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    glue("Remove overly similar datasets")
   ),
   n = nrow(datasets)
  )

 for(did in datasets$data.id){

  print(did)

  oml_data <- getOMLDataSet(data.id = did, verbosity = 0)

  # use max of 1 outcome per dataset
  outcome <- tasks[data.id == did] %>%
   getElement('target.feature') %>%
   unique() %>%
   .[1]

  if(!is_empty(outcome)){

   setDT(oml_data$data)

   for(o in outcome){

    # for outcomes that start with a numeric, the variable name will
    # automatically be coerced to start with a letter, which is X
    if(str_detect(o, pattern = "^\\d")){
     o = paste0("X", o)
    }

    .n_uni <- length(unique(na.omit(oml_data$data[[o]])))

    datasets[data.id == did, n_uni := .n_uni]

    # write one file per outcome
    # other outcome(s) can be used as a predictor for current one
    if( .n_uni >= min_outcome_uni ){

     setnames(oml_data$data, old = o, new = 'outcome')

     fname <- paste0("data/", oml_data$desc$name, '-outcome-', o, '.csv')

     if(write_data){
      if(!file.exists(fname)) fwrite(oml_data$data, fname)
     }

     setnames(oml_data$data, old = 'outcome', new = o)

    }

   }

  }

 }

 datasets <- datasets[n_uni >= min_outcome_uni]

 dataset_record <- dataset_record %>%
  add_row(
   exclusion = as.character(
    table_glue("Remove data where outcome has < {min_outcome_uni} unique values")
   ),
   n = nrow(datasets)
  )

 list(data = datasets,
      record = dataset_record)

}
