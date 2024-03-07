## Load your packages, e.g. library(targets).
source("./packages.R")

library(future)
library(future.callr)
plan(callr)

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

bind_coerce <- function(...){
 list(...) %>%
  map(mutate, time = as.numeric(time, units='secs')) %>%
  bind_rows()
}

# needs to be run outside of tar_plan to avoid dynamic branching
# datasets_make(write_data = TRUE)

# if you don't need to update the tasks, just load them
datasets_included <- list.files('data', pattern = "-outcome-") %>%
 str_remove("\\.csv$")

analyses <- expand_grid(
 dataset = datasets_included,
 rfvs_label = c(
  'rfvs_none',
  'rfvs_permute',
  'rfvs_mindepth_medium',
  # 'rfvs_mindepth_high',
  # 'rfvs_mindepth_low',
  # 'rfvs_cif',
  'rfvs_jiang',
  'rfvs_vsurf',
  'rfvs_caret',
  'rfvs_rrf',
  'rfvs_hap',
  'rfvs_svetnik',
  'rfvs_boruta',
  "rfvs_alt",
  "rfvs_aorsf"
 ),
 run = 1:3
) %>%
 # filter(dataset %in% c("GeographicalOriginalofMusic-outcome-V100")) %>%
 separate(col = 'dataset',
          into = c('dataset', 'outcome'),
          sep = '-outcome-') %>%
 mutate(rfvs_fun = syms(rfvs_label),
        rfvs_label = str_remove(rfvs_label, '^rfvs_'))

branch_resources <-
 tar_resources(
  future = tar_resources_future(resources = list(n_cores=1))
 )


tar_plan(

 bm <- tar_map(
  values = analyses,
  names = c(dataset, outcome, rfvs_label, run),
  tar_target(
   bm,
   bench_rfvs(dataset = dataset,
              outcome = outcome,
              label = rfvs_label,
              rfvs = rfvs_fun,
              run = run),
   resources = branch_resources,
   memory = "transient",
   garbage_collection = TRUE
  )
 ),

 tar_combine(bm_comb, bm[[1]], command = bind_coerce(!!!.x)),

 results_smry = bench_summarize(bm_comb),

 tar_render(readme, "README.Rmd")

)
