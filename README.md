
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rfvs-regression

<!-- badges: start -->
<!-- badges: end -->

The goal of rfvs-regression is to compare random forest variable
selection techniques for continuous outcomes

# Datasets included

<div id="rccskgsbqs" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#rccskgsbqs table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#rccskgsbqs thead, #rccskgsbqs tbody, #rccskgsbqs tfoot, #rccskgsbqs tr, #rccskgsbqs td, #rccskgsbqs th {
  border-style: none;
}
&#10;#rccskgsbqs p {
  margin: 0;
  padding: 0;
}
&#10;#rccskgsbqs .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
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
&#10;#rccskgsbqs .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#rccskgsbqs .gt_title {
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
&#10;#rccskgsbqs .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#rccskgsbqs .gt_heading {
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
&#10;#rccskgsbqs .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#rccskgsbqs .gt_col_headings {
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
&#10;#rccskgsbqs .gt_col_heading {
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
&#10;#rccskgsbqs .gt_column_spanner_outer {
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
&#10;#rccskgsbqs .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#rccskgsbqs .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#rccskgsbqs .gt_column_spanner {
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
&#10;#rccskgsbqs .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#rccskgsbqs .gt_group_heading {
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
  text-align: left;
}
&#10;#rccskgsbqs .gt_empty_group_heading {
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
&#10;#rccskgsbqs .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#rccskgsbqs .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#rccskgsbqs .gt_row {
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
&#10;#rccskgsbqs .gt_stub {
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
&#10;#rccskgsbqs .gt_stub_row_group {
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
&#10;#rccskgsbqs .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#rccskgsbqs .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#rccskgsbqs .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#rccskgsbqs .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#rccskgsbqs .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#rccskgsbqs .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#rccskgsbqs .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#rccskgsbqs .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#rccskgsbqs .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#rccskgsbqs .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#rccskgsbqs .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#rccskgsbqs .gt_footnotes {
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
&#10;#rccskgsbqs .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#rccskgsbqs .gt_sourcenotes {
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
&#10;#rccskgsbqs .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#rccskgsbqs .gt_left {
  text-align: left;
}
&#10;#rccskgsbqs .gt_center {
  text-align: center;
}
&#10;#rccskgsbqs .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#rccskgsbqs .gt_font_normal {
  font-weight: normal;
}
&#10;#rccskgsbqs .gt_font_bold {
  font-weight: bold;
}
&#10;#rccskgsbqs .gt_font_italic {
  font-style: italic;
}
&#10;#rccskgsbqs .gt_super {
  font-size: 65%;
}
&#10;#rccskgsbqs .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#rccskgsbqs .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#rccskgsbqs .gt_indent_1 {
  text-indent: 5px;
}
&#10;#rccskgsbqs .gt_indent_2 {
  text-indent: 10px;
}
&#10;#rccskgsbqs .gt_indent_3 {
  text-indent: 15px;
}
&#10;#rccskgsbqs .gt_indent_4 {
  text-indent: 20px;
}
&#10;#rccskgsbqs .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="n">n</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">Datasets available in open ML</th>
<td headers="stub_1_1 n" class="gt_row gt_right">5000</td></tr>
    <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">Datasets with 'Supervised Regression' task</th>
<td headers="stub_1_2 n" class="gt_row gt_right">1623</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">datasets with &lt;=0% missing observations</th>
<td headers="stub_1_3 n" class="gt_row gt_right">1573</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">datasets with number of features &gt;= 10</th>
<td headers="stub_1_4 n" class="gt_row gt_right">1400</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">datasets with number of features &lt;= 250</th>
<td headers="stub_1_5 n" class="gt_row gt_right">267</td></tr>
    <tr><th id="stub_1_6" scope="row" class="gt_row gt_left gt_stub">datasets with number of observations &gt;= 100</th>
<td headers="stub_1_6 n" class="gt_row gt_right">236</td></tr>
    <tr><th id="stub_1_7" scope="row" class="gt_row gt_left gt_stub">datasets with number of observations &lt;= 5000</th>
<td headers="stub_1_7 n" class="gt_row gt_right">124</td></tr>
    <tr><th id="stub_1_8" scope="row" class="gt_row gt_left gt_stub">removing overly similar datasets<span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span></th>
<td headers="stub_1_8 n" class="gt_row gt_right">53</td></tr>
  </tbody>
  &#10;  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="2"><span class="gt_footnote_marks" style="white-space:nowrap;font-style:italic;font-weight:normal;"><sup>1</sup></span> Many datasets are different versions of the same data</td>
    </tr>
  </tfoot>
</table>
</div>

# Central illustration

The experiment we ran involves three steps:

1.  Select variables with a given method.
2.  Fit a random forest to the data, including only selected variables.
3.  Evaluate prediction accuracy of the forest in held-out data.

*Note*: We use both axis-based and oblique random forests for regression
in step 2.

We assume that better variable selection leads to better prediction
accuracy. Results from the experiment are below.

<div id="vythuygewg" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#vythuygewg table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#vythuygewg thead, #vythuygewg tbody, #vythuygewg tfoot, #vythuygewg tr, #vythuygewg td, #vythuygewg th {
  border-style: none;
}
&#10;#vythuygewg p {
  margin: 0;
  padding: 0;
}
&#10;#vythuygewg .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
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
&#10;#vythuygewg .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#vythuygewg .gt_title {
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
&#10;#vythuygewg .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#vythuygewg .gt_heading {
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
&#10;#vythuygewg .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#vythuygewg .gt_col_headings {
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
&#10;#vythuygewg .gt_col_heading {
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
&#10;#vythuygewg .gt_column_spanner_outer {
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
&#10;#vythuygewg .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#vythuygewg .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#vythuygewg .gt_column_spanner {
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
&#10;#vythuygewg .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#vythuygewg .gt_group_heading {
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
  text-align: left;
}
&#10;#vythuygewg .gt_empty_group_heading {
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
&#10;#vythuygewg .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#vythuygewg .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#vythuygewg .gt_row {
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
&#10;#vythuygewg .gt_stub {
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
&#10;#vythuygewg .gt_stub_row_group {
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
&#10;#vythuygewg .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#vythuygewg .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#vythuygewg .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#vythuygewg .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#vythuygewg .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#vythuygewg .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#vythuygewg .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#vythuygewg .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#vythuygewg .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#vythuygewg .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#vythuygewg .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#vythuygewg .gt_footnotes {
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
&#10;#vythuygewg .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#vythuygewg .gt_sourcenotes {
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
&#10;#vythuygewg .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#vythuygewg .gt_left {
  text-align: left;
}
&#10;#vythuygewg .gt_center {
  text-align: center;
}
&#10;#vythuygewg .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#vythuygewg .gt_font_normal {
  font-weight: normal;
}
&#10;#vythuygewg .gt_font_bold {
  font-weight: bold;
}
&#10;#vythuygewg .gt_font_italic {
  font-style: italic;
}
&#10;#vythuygewg .gt_super {
  font-size: 65%;
}
&#10;#vythuygewg .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#vythuygewg .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#vythuygewg .gt_indent_1 {
  text-indent: 5px;
}
&#10;#vythuygewg .gt_indent_2 {
  text-indent: 10px;
}
&#10;#vythuygewg .gt_indent_3 {
  text-indent: 15px;
}
&#10;#vythuygewg .gt_indent_4 {
  text-indent: 20px;
}
&#10;#vythuygewg .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    &#10;    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="Variable selection method">Variable selection method</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="N variables selected">N variables selected</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="R-squared (25th %, 75th %)">
        <span class="gt_column_spanner">R-squared (25th %, 75th %)</span>
      </th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="2" colspan="1" scope="col" id="Selection time, seconds">Selection time, seconds</th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Oblique">Oblique</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Axis-based">Axis-based</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">aorsf</th>
<td headers="stub_1_1 n_selected" class="gt_row gt_center">5 (5 - 11)</td>
<td headers="stub_1_1 rsq_oblique" class="gt_row gt_center">0.22 (0.22 - 0.63)</td>
<td headers="stub_1_1 rsq_axis" class="gt_row gt_center">0.21 (0.21 - 0.63)</td>
<td headers="stub_1_1 time" class="gt_row gt_center">0.76 (0.76 - 5.1)</td></tr>
    <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">mindepth_medium</th>
<td headers="stub_1_2 n_selected" class="gt_row gt_center">7 (7 - 14)</td>
<td headers="stub_1_2 rsq_oblique" class="gt_row gt_center">0.19 (0.19 - 0.62)</td>
<td headers="stub_1_2 rsq_axis" class="gt_row gt_center">0.21 (0.21 - 0.63)</td>
<td headers="stub_1_2 time" class="gt_row gt_center">9.8 (9.8 - 21)</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">cif</th>
<td headers="stub_1_3 n_selected" class="gt_row gt_center">8 (8 - 29)</td>
<td headers="stub_1_3 rsq_oblique" class="gt_row gt_center">0.17 (0.17 - 0.60)</td>
<td headers="stub_1_3 rsq_axis" class="gt_row gt_center">0.19 (0.19 - 0.61)</td>
<td headers="stub_1_3 time" class="gt_row gt_center">2.2 (2.2 - 23)</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">permute</th>
<td headers="stub_1_4 n_selected" class="gt_row gt_center">10 (10 - 35)</td>
<td headers="stub_1_4 rsq_oblique" class="gt_row gt_center">0.16 (0.16 - 0.60)</td>
<td headers="stub_1_4 rsq_axis" class="gt_row gt_center">0.21 (0.21 - 0.61)</td>
<td headers="stub_1_4 time" class="gt_row gt_center">0.03 (0.03 - 0.04)</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">none</th>
<td headers="stub_1_5 n_selected" class="gt_row gt_center">11 (11 - 41)</td>
<td headers="stub_1_5 rsq_oblique" class="gt_row gt_center">0.16 (0.16 - 0.60)</td>
<td headers="stub_1_5 rsq_axis" class="gt_row gt_center">0.18 (0.18 - 0.61)</td>
<td headers="stub_1_5 time" class="gt_row gt_center">0.00 (0.00 - 0.00)</td></tr>
  </tbody>
  &#10;  
</table>
</div>

*Takeaways*:

1.  Using oblique forests to select variables (the `aorsf` method for
    variable selection) leads to a parsimonious set of predictors with
    high prediction accuracy. Moreover, prediction accuracy is high
    whether the final model is oblique or axis-based.

2.  If the final model is axis-based rather than oblique, the axis-based
    variable selection methods do much better in terms of prediction
    accuracy.
