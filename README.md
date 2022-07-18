
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rfvs-regression

<!-- badges: start -->
<!-- badges: end -->

The goal of rfvs-regression is to …

# Central illustration

This will be a figure at some point, but a table will do for now.

``` r
targets::tar_load(results_smry)

library(table.glue)
library(tidyverse)
#> -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.6     v purrr   0.3.4
#> v tibble  3.1.7     v dplyr   1.0.9
#> v tidyr   1.2.0     v stringr 1.4.0
#> v readr   2.1.2     v forcats 0.5.1
#> -- Conflicts ------------------------------------------ tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()

data_tbl <- results_smry %>% 
 ungroup() %>% 
 mutate(
  rfvs = str_remove(rfvs, 'rfvs_'),
  across(starts_with('n_selected'), ~ as.integer(round(.x))),
  across(starts_with('time'),  ~ as.numeric(.x, units = 'secs'))
 ) %>% 
 arrange(rsq_50)

tbl_vars <- c('n_selected',
              # 'rmse', 
              'rsq',
              'time')

for(t in tbl_vars){
 
 t25 <- data_tbl[[paste(t, "25", sep = '_')]]
 t50 <- data_tbl[[paste(t, "50", sep = '_')]]
 t75 <- data_tbl[[paste(t, "75", sep = '_')]]
 
 data_tbl[[t]] <- table_glue("{t25} ({t25} - {t75})")
 
}

data_tbl <- data_tbl %>% 
 select(rfvs, all_of(tbl_vars))


library(knitr)
library(kableExtra)
#> 
#> Attaching package: 'kableExtra'
#> The following object is masked from 'package:dplyr':
#> 
#>     group_rows

kable(data_tbl,
      col.names = c('Selection method',
                    'N variables selected',
                    'R-squared',
                    'Selection time, seconds'),
      align = 'lccc') %>% 
 kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Selection method
</th>
<th style="text-align:center;">
N variables selected
</th>
<th style="text-align:center;">
R-squared
</th>
<th style="text-align:center;">
Selection time, seconds
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
permute
</td>
<td style="text-align:center;">
7 (7 - 20)
</td>
<td style="text-align:center;">
0.34 (0.34 - 0.53)
</td>
<td style="text-align:center;">
0.04 (0.04 - 0.06)
</td>
</tr>
<tr>
<td style="text-align:left;">
mindepth_low
</td>
<td style="text-align:center;">
6 (6 - 11)
</td>
<td style="text-align:center;">
0.35 (0.35 - 0.55)
</td>
<td style="text-align:center;">
14 (14 - 23)
</td>
</tr>
<tr>
<td style="text-align:left;">
mindepth_medium
</td>
<td style="text-align:center;">
5 (5 - 10)
</td>
<td style="text-align:center;">
0.37 (0.37 - 0.55)
</td>
<td style="text-align:center;">
14 (14 - 24)
</td>
</tr>
<tr>
<td style="text-align:left;">
cif
</td>
<td style="text-align:center;">
6 (6 - 14)
</td>
<td style="text-align:center;">
0.36 (0.36 - 0.52)
</td>
<td style="text-align:center;">
19 (19 - 95)
</td>
</tr>
<tr>
<td style="text-align:left;">
mindepth_high
</td>
<td style="text-align:center;">
5 (5 - 10)
</td>
<td style="text-align:center;">
0.36 (0.36 - 0.55)
</td>
<td style="text-align:center;">
12 (12 - 20)
</td>
</tr>
<tr>
<td style="text-align:left;">
jiang
</td>
<td style="text-align:center;">
3 (3 - 6)
</td>
<td style="text-align:center;">
0.42 (0.42 - 0.57)
</td>
<td style="text-align:center;">
6.3 (6.3 - 40)
</td>
</tr>
<tr>
<td style="text-align:left;">
none
</td>
<td style="text-align:center;">
11 (11 - 46)
</td>
<td style="text-align:center;">
0.49 (0.49 - 0.74)
</td>
<td style="text-align:center;">
0.00 (0.00 - 0.00)
</td>
</tr>
</tbody>
</table>
