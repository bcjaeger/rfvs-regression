## Load your packages, e.g. library(targets).
source("./packages.R")

library(future)
library(future.callr)
plan(callr)

## Load your R files
lapply(list.files("./R", full.names = TRUE), source)

branch_resources <-
 tar_resources(
  future = tar_resources_future(resources = list(n_cores=1))
 )

## tar_plan supports drake-style targets and also tar_target()
tar_plan(

 # which tasks meet inclusion criteria
 tasks_included = task_select(max_miss_prop = 0,
                              min_features = 5,
                              max_features = 100,
                              min_obs = 200,
                              max_obs = 600),

 # used to coordinate running the analyses
 task = seq(nrow(tasks_included$data)),

 run = seq(1),

 rfvs = c(
  'rfvs_none',
  'rfvs_permute',
  'rfvs_cif'
 ),

 tar_target(
  results,
  bench_rfvs(task = task,
             run = run,
             rfvs = rfvs,
             tasks_included = tasks_included),
  pattern = cross(task, run, rfvs),
  resources = branch_resources,
  memory = "transient",
  garbage_collection = TRUE
 )

)
