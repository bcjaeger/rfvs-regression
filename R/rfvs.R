#' .. content for \description{} (no empty lines) ..
#'
#' .. content for \details{} ..
#'
#' @title
#' @param train training data
#' @param outcome_colname name of the outcome column
#' @param ... not used
rfvs_none <- function(train, outcome_colname, ...) {

  names(train)

}


rfvs_permute <- function(train, outcome_colname, ...) {

 formula <- as.formula(glue("{outcome_colname} ~ ."))

 fit <- ranger(formula = formula,
               data = train,
               importance = 'permutation')

 vi <- fit$variable.importance

 drop <- names(vi)[vi < 0]

 names(train) %>%
  setdiff(drop)

}


rfvs_cif <- function(train, outcome_colname, ...) {

 formula <- as.formula(glue("{outcome_colname} ~ ."))

 fit <- cforest(formula = formula, data = train)

 vi <- varimp(fit, conditional = TRUE)

 drop <- names(vi)[vi < 0]

 if(all(vi < 0)){

  keep <- vi %>%
   sort(decreasing = TRUE) %>%
   names() %>%
   getElement(1)

  drop <- setdiff(drop, keep)

 }

 names(train) %>%
  setdiff(drop)

}



