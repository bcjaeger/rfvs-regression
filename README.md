
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rfvs-regression

<!-- badges: start -->
<!-- badges: end -->

The goal of rfvs-regression is to …

# Central illustration

This will be a figure at some point, but a table will do for now.

``` r
tar_load(results_smry)
library(table.glue)

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


library(gt)

gt(data_tbl, rowname_col = 'rfvs') %>% 
 cols_label(n_selected = 'N variables selected',
            rsq = 'R-squared',
            time = 'Selection time, seconds') %>% 
 cols_align('center') %>% 
 tab_stubhead(label = 'Variable selection method') %>% 
 tab_spanner(columns = everything(), label = 'Median (25th - 75th percentile)')
```

<div id="ttmpfumjbi" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ttmpfumjbi .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#ttmpfumjbi .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ttmpfumjbi .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ttmpfumjbi .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ttmpfumjbi .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ttmpfumjbi .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#ttmpfumjbi .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#ttmpfumjbi .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#ttmpfumjbi .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ttmpfumjbi .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ttmpfumjbi .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ttmpfumjbi .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#ttmpfumjbi .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#ttmpfumjbi .gt_from_md > :first-child {
  margin-top: 0;
}

#ttmpfumjbi .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ttmpfumjbi .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#ttmpfumjbi .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#ttmpfumjbi .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#ttmpfumjbi .gt_row_group_first td {
  border-top-width: 2px;
}

#ttmpfumjbi .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ttmpfumjbi .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#ttmpfumjbi .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#ttmpfumjbi .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ttmpfumjbi .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ttmpfumjbi .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ttmpfumjbi .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ttmpfumjbi .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ttmpfumjbi .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ttmpfumjbi .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ttmpfumjbi .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#ttmpfumjbi .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ttmpfumjbi .gt_left {
  text-align: left;
}

#ttmpfumjbi .gt_center {
  text-align: center;
}

#ttmpfumjbi .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ttmpfumjbi .gt_font_normal {
  font-weight: normal;
}

#ttmpfumjbi .gt_font_bold {
  font-weight: bold;
}

#ttmpfumjbi .gt_font_italic {
  font-style: italic;
}

#ttmpfumjbi .gt_super {
  font-size: 65%;
}

#ttmpfumjbi .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#ttmpfumjbi .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#ttmpfumjbi .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#ttmpfumjbi .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#ttmpfumjbi .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1">Variable selection method</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3">
        <span class="gt_column_spanner">Median (25th - 75th percentile)</span>
      </th>
    </tr>
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">N variables selected</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">R-squared</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">Selection time, seconds</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_right gt_stub">permute</td>
<td class="gt_row gt_center">7 (7 - 20)</td>
<td class="gt_row gt_center">0.34 (0.34 - 0.53)</td>
<td class="gt_row gt_center">0.04 (0.04 - 0.06)</td></tr>
    <tr><td class="gt_row gt_right gt_stub">mindepth_low</td>
<td class="gt_row gt_center">6 (6 - 11)</td>
<td class="gt_row gt_center">0.35 (0.35 - 0.55)</td>
<td class="gt_row gt_center">14 (14 - 23)</td></tr>
    <tr><td class="gt_row gt_right gt_stub">mindepth_medium</td>
<td class="gt_row gt_center">5 (5 - 10)</td>
<td class="gt_row gt_center">0.37 (0.37 - 0.55)</td>
<td class="gt_row gt_center">14 (14 - 24)</td></tr>
    <tr><td class="gt_row gt_right gt_stub">cif</td>
<td class="gt_row gt_center">6 (6 - 14)</td>
<td class="gt_row gt_center">0.36 (0.36 - 0.52)</td>
<td class="gt_row gt_center">19 (19 - 95)</td></tr>
    <tr><td class="gt_row gt_right gt_stub">mindepth_high</td>
<td class="gt_row gt_center">5 (5 - 10)</td>
<td class="gt_row gt_center">0.36 (0.36 - 0.55)</td>
<td class="gt_row gt_center">12 (12 - 20)</td></tr>
    <tr><td class="gt_row gt_right gt_stub">jiang</td>
<td class="gt_row gt_center">3 (3 - 6)</td>
<td class="gt_row gt_center">0.42 (0.42 - 0.57)</td>
<td class="gt_row gt_center">6.3 (6.3 - 40)</td></tr>
    <tr><td class="gt_row gt_right gt_stub">none</td>
<td class="gt_row gt_center">11 (11 - 46)</td>
<td class="gt_row gt_center">0.49 (0.49 - 0.74)</td>
<td class="gt_row gt_center">0.00 (0.00 - 0.00)</td></tr>
  </tbody>
  
  
</table>
</div>
