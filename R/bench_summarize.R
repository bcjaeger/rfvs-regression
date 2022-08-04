#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param results
bench_summarize <- function(bm_comb) {

 bm_comb %>%
  filter(rfvs != 'hap') %>%
  group_by(rfvs) %>%
  summarise(
   across(
    .cols = c(n_selected, rmse, rsq, time),
    .fns = quantile, probs = c(1,2,3) / 4
   )
  ) %>%
  mutate(quantile = c(25, 50, 75)) %>%
  pivot_wider(names_from = quantile,
              values_from = c(n_selected, rmse, rsq, time))

}
