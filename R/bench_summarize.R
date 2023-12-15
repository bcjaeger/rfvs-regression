#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param results
bench_summarize <- function(bm_comb) {

 bm_comb %>%
  dplyr::filter(rfvs != 'hap') %>%
  reframe(
   across(
    .cols = c(n_selected,
              rmse_axis, rsq_axis,
              rmse_oblique, rsq_oblique,
              time),
    .fns = ~ quantile(.x, probs = c(1,2,3) / 4, na.rm = TRUE)
   ),
   quantile = c(25, 50, 75),
   .by = rfvs
  ) %>%
  pivot_wider(names_from = quantile,
              values_from = c(n_selected,
                              rmse_axis, rsq_axis,
                              rmse_oblique, rsq_oblique,
                              time))

}
