#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param results
bench_summarize <- function(bm_comb) {

 smry_cols <- c("n_selected",
                "rmse_axis",
                "rsq_axis",
                "rmse_oblique",
                "rsq_oblique",
                "time")

 # summary for each dataset ----

 mean_se <- bm_comb %>%
  group_by(rfvs, dataset) %>%
  summarize(across(.cols = all_of(smry_cols),
                   .fns = list(mean = ~ mean(.x, na.rm = TRUE),
                               se = ~ sd(.x) / (length(.x) - 1))))

 quants <- bm_comb %>%
  reframe(
   across(
    .cols = c(n_selected,
              rmse_axis, rsq_axis,
              rmse_oblique, rsq_oblique,
              time),
    .fns = ~ quantile(.x, probs = c(1,2,3) / 4, na.rm = TRUE)
   ),
   quantile = c(25, 50, 75),
   .by = c(rfvs, dataset)
  ) %>%
  pivot_wider(names_from = quantile,
              values_from = all_of(smry_cols))

 smry_by_data <- left_join(mean_se, quants)

 # summary overall -----

 mean_se <- bm_comb %>%
  group_by(rfvs) %>%
  summarize(across(.cols = all_of(smry_cols),
                   .fns = list(mean = ~ mean(.x, na.rm = TRUE),
                               se = ~ sd(.x) / sqrt((length(.x) - 1)))))

 quants <- bm_comb %>%
  reframe(
   across(
    .cols = c(n_selected,
              rmse_axis, rsq_axis,
              rmse_oblique, rsq_oblique,
              time),
    .fns = ~ quantile(.x, probs = c(1,2,3) / 4, na.rm = TRUE)
   ),
   quantile = c(25, 50, 75),
   .by = c(rfvs)
  ) %>%
  pivot_wider(names_from = quantile,
              values_from = all_of(smry_cols))

 smry_overall <- left_join(mean_se, quants) %>%
  mutate(dataset = 'overall', .after = rfvs)

 list(by_data = smry_by_data,
      overall = smry_overall)

}
