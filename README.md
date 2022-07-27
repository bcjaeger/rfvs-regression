
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
hap
</td>
<td style="text-align:center;">
1 (1 - 3)
</td>
<td style="text-align:center;">
-0.11 (-0.11 - 0.03)
</td>
<td style="text-align:center;">
108 (108 - 245)
</td>
</tr>
<tr>
<td style="text-align:left;">
none
</td>
<td style="text-align:center;">
25 (25 - 58)
</td>
<td style="text-align:center;">
0.27 (0.27 - 0.47)
</td>
<td style="text-align:center;">
0.00 (0.00 - 0.00)
</td>
</tr>
<tr>
<td style="text-align:left;">
cif
</td>
<td style="text-align:center;">
15 (15 - 29)
</td>
<td style="text-align:center;">
0.35 (0.35 - 0.52)
</td>
<td style="text-align:center;">
74 (74 - 377)
</td>
</tr>
<tr>
<td style="text-align:left;">
permute
</td>
<td style="text-align:center;">
15 (15 - 31)
</td>
<td style="text-align:center;">
0.35 (0.35 - 0.51)
</td>
<td style="text-align:center;">
0.12 (0.12 - 0.26)
</td>
</tr>
<tr>
<td style="text-align:left;">
mindepth_low
</td>
<td style="text-align:center;">
5 (5 - 25)
</td>
<td style="text-align:center;">
0.40 (0.40 - 0.57)
</td>
<td style="text-align:center;">
18 (18 - 34)
</td>
</tr>
<tr>
<td style="text-align:left;">
mindepth_high
</td>
<td style="text-align:center;">
5 (5 - 23)
</td>
<td style="text-align:center;">
0.45 (0.45 - 0.57)
</td>
<td style="text-align:center;">
16 (16 - 31)
</td>
</tr>
<tr>
<td style="text-align:left;">
mindepth_medium
</td>
<td style="text-align:center;">
5 (5 - 25)
</td>
<td style="text-align:center;">
0.43 (0.43 - 0.57)
</td>
<td style="text-align:center;">
18 (18 - 34)
</td>
</tr>
<tr>
<td style="text-align:left;">
vsurf
</td>
<td style="text-align:center;">
3 (3 - 4)
</td>
<td style="text-align:center;">
0.52 (0.52 - 0.62)
</td>
<td style="text-align:center;">
133 (133 - 415)
</td>
</tr>
<tr>
<td style="text-align:left;">
jiang
</td>
<td style="text-align:center;">
3 (3 - 5)
</td>
<td style="text-align:center;">
0.54 (0.54 - 0.63)
</td>
<td style="text-align:center;">
45 (45 - 159)
</td>
</tr>
</tbody>
</table>
