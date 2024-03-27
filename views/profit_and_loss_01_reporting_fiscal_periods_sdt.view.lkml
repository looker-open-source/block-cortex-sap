#########################################################{
# PURPOSE
# Step 1 of 3 in deriving Reporting and Comparison Groups of timeframes. Step 01 returns Reporting periods.
#
# SOURCE
# View profit_and_loss_fiscal_periods_sdt
#
# REFERENCED BY
# VIEW profit_and_loss_02_comparison_fiscal_periods_sdt
# VIEW profit_and_loss_03_selected_fiscal_periods_sdt
#
# PROCESS FOR STEP 1 - DERIVE REPORTING SELECTION
#   1)  Captures user inputs from parameters and filters:
#         profit_and_loss.parameter_display_time_dimension -- filter and display either Fiscal Year, Fiscal Quarter or Fiscal Period
#         profit_and_loss.filter_fiscal_timeframe -- select one or more fiscal timeframes (either Year, Quarter or Fiscal Period) to include in Income Statement report
#         profit_and_loss.parameter_compare_to -- compare selected reporting timeframe to either same timeframe last year, the prior timeframe or no comparison
#         profit_and_loss.parameter_aggregate -- If "yes" is selected, all selected timeframes will be combined into a single Reporting/Comparison Group. Otherwise, each selected timeframe will be displayed separately in the report.
#
#   2)  Builds SQL statement based on parameter values selected. Returns the fiscal periods
#       representing the "Reporting" group.
#
#   3) Derives new dimensions:
#         fiscal_reporting_group -- assigned a value of "Reporting"
#         alignment_group -- if parameter_aggregate = 'Yes' assign 1 else
#                            derive with DENSE_RANK() based on order of fiscal year, quarter or period.
#
#                            If multiple timeframes selected and parameter_aggregate = 'No', each set comparisons will be given a unique group number.
#                            e.g., when user selects 2024.001 and 2024.002 to compare to a year ago and parameter_aggregate = 'No', two alignment groups are defined as:
#                            alignment group 1 = 2024.001 compared to 2023.001
#                            alignment group 2 = 2024.002 compared to 2023.002
#
#                            If multiple timeframes selected and parameter_aggregate = 'Yes', all timeframes will be combined into 1 alignment group.
#                            e.g., when user selects 2024.001 and 2024.002 to compare to a year ago, one alignment group is defined as:
#                            alignment group 1 = 2024.001 + 2024.002 compared to 2023.001 + 2023.002
#
#        selected_timeframe -- returns fiscal year, quarter or period values based on parameter_display_time_dimension
#        timeframe_join -- this portion of SQL added if parameter_compare_to != 'none'; used in Step 02 to help derive comparison periods
#                       -- if parameter_compare_to = 'yoy' then fiscal_year_period
#                             else if parameter_compare_to = 'prior' and parameter_aggregate = 'Yes' then use the [timeframe]_rank
#                             else if parameter_compare_to = 'prior' and parameter_aggregate = 'No' then use the selected timeframe field (fiscal_year_period, fiscal_year_quarter or fiscal_year)
#
#        prior_timeframe_join -- this portion of SQL added if parameter_compare_to != 'none'; used in Step 02 to help derive comparison periods
#                             -- if parameter_compare_to = 'yoy' then yoy_fiscal_year_period
#                                   else if parameter_compare_to = 'prior' and parameter_aggregate = 'Yes' then derive as:
#                                     [timeframe]_rank + (
#                                     max([timeframe]_rank) over (partition by glhierarchy, company_code)  -
#                                     min([timeframe]_rank) over (partition by glhierarchy, company_code) ) + 1
#                                  else if paramter_compare_to = 'prior' and parameter_aggregate = 'No' then derive as:
#                                     prior_[timeframe]
# NOTE
# This view is only referenced in another view and does not define any dimensions or measures.
#########################################################}

include: "/views/profit_and_loss_fiscal_periods_sdt.view"

view: profit_and_loss_01_reporting_fiscal_periods_sdt {

  derived_table: {
    sql:
    {% assign comparison_type = profit_and_loss.parameter_compare_to._parameter_value %}
    {% assign time_level = profit_and_loss.parameter_display_time_dimension._parameter_value %}
    {% assign aggregate = profit_and_loss.parameter_aggregate._parameter_value %}
    {% assign window_partition = "(PARTITION BY glhierarchy, company_code)" %}
    {% if time_level == 'fp' %}{% assign timeframe_field = "fiscal_year_period" %}{% assign is_partial_sql = "false" %}
      {% elsif time_level == 'qtr' %}{% assign timeframe_field = "fiscal_year_quarter" %}
        {% assign is_partial_sql = "is_qtd" %}
      {% elsif time_level == 'yr' %}{% assign timeframe_field = "fiscal_year" %}{% assign is_partial_sql = "is_ytd" %}
      {% else %}{% assign is_partial_sql = "" %}
    {% endif %}
    {% assign rank_field = timeframe_field | append: "_rank" %}

    {% if comparison_type == 'yoy' %}
      {% assign timeframe_join_sql = "fiscal_year_period" %}
      {% assign prior_timeframe_join_sql = "yoy_fiscal_year_period" %}
    {% elsif comparison_type == 'prior' and aggregate == 'Yes' %}
      {% assign timeframe_join_sql = timeframe_field | append: "_rank" %}
      {% assign prior_timeframe_join_sql = rank_field | append: " + (max(" | append: rank_field | append: ") over (window_pk) - min(" | append: rank_field | append: ") over (window_pk) + 1 )" %}
    {% elsif comparison_type == 'prior' and aggregate == 'No' %}
      {% assign timeframe_join_sql = timeframe_field  %}
      {% assign prior_timeframe_join_sql = "prior_" | append: timeframe_field  %}
    {% endif %}

    {% if aggregate == 'Yes' %}{% assign alignment_group_sql = '1' %}
      {% else %}{% assign alignment_group_sql = "DENSE_RANK() OVER (ORDER BY " | append: timeframe_field | append: " DESC)" %}
    {% endif %}

      SELECT
        glhierarchy,
        company_code,
        fiscal_year,
        fiscal_period,
        fiscal_quarter,
        fiscal_year_quarter,
        fiscal_year_period,
        period_order_in_quarter,
        {{alignment_group_sql}} AS alignment_group,
        {{timeframe_field}} AS selected_timeframe,
        {% if comparison_type != "none" %}
        {{timeframe_join_sql}} as timeframe_join,
        {{prior_timeframe_join_sql}} as prior_timeframe_join,
        {% endif %}
        {{is_partial_sql}} as is_partial_timeframe,
        'Reporting' AS fiscal_reporting_group
      FROM ${profit_and_loss_fiscal_periods_sdt.SQL_TABLE_NAME} fp
      WHERE {% condition profit_and_loss.filter_fiscal_timeframe %}{{timeframe_field}}{% endcondition %}
      WINDOW window_pk AS {{window_partition}}
      ;;
  }

}
