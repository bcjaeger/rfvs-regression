#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param bm_comb
bench_clean <- function(bm_comb) {

 bm_comb %>%
  mutate(perc_reduced = 1 - n_selected / (n_col - 1),
         time = as.numeric(time, units = 'secs'),
         log_time = log(time))

}
