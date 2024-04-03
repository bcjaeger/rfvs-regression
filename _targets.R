## Load your packages, e.g. library(targets).
source("./packages.R")
#Nate is co-first author of this work
#nate second commit for practice

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
#datasets_make(write_data = TRUE)

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
  "rfvs_aorsf",
  "rfvs_negate",
  "rfvs_anova"
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

 tar_combine(bm_comb, bm[[1]]),

 ##### Create Summary Data set #####
 results_smry = bench_summarize(bm_comb),

 #### Create Summary Data Set Z-scores ####
 results_z = bench_standardize(bm_comb, ignore=c("hap")),

 ###### Datasets summary ##########
 # requires folder 'data/' created above using datasets_make()
 datasets_cv = datasets_cv(), #calculates coeficcient of variation of each data set
 datasets_full = datasets_full(datasets_cv), #appends datasets_cv to datasets_selected

 #dataset summary figure. Requires "grid.arrange(fig_datasets_smry)
 fig_datasets_smry = vis_datasets_smry(datasets_full),

 ###### Results Summary ##########

 # Distribution plots

 # Mean and Median R-square by Forest Type
 fig_rsq_median = vis_rsq_median(results_smry, exclude.hap=T, exclude.none = F),
 fig_rsq_means = vis_rsq_means(results_smry, exclude.hap=T, exclude.none = F),

 tar_render(readme, "README.Rmd")

)


