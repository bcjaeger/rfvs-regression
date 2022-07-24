#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title

datasets_make <- function(max_miss_prop = 0,
                          min_features = 20,
                          max_features = 250,
                          min_obs = 200,
                          max_obs = 1000,
                          write_data = FALSE) {

 # which datasets meet inclusion criteria
 datasets_included = datasets_select(max_miss_prop = max_miss_prop,
                                     min_features = min_features,
                                     max_features = max_features,
                                     min_obs = min_obs,
                                     max_obs = max_obs,
                                     write_data = write_data)

 fwrite(datasets_included$data, 'data/datasets_included.csv')
 fwrite(datasets_included$record, 'data/datasets_inclusion_chart.csv')

 NULL

}
