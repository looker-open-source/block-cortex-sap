#########################################################{
# Step 2 of 3 in deriving Reporting and Comparison Groups of fiscal periods
# Step 2 - Derive Comparison periods based on Reporting selection
# This SQL Derived Table (sdt) uses these views:
#     profit_and_loss_fiscal_periods_sdt (aliased below as comp)
#     profit_and_loss_01_reporting_fiscal_periods_sdt (aliased below as rep)
#
# Purpose:
#   1) Takes user inputs from parameters and filters:
#         profit_and_loss.parameter_display_time_dimension - use either Year, Quarter or Period for timeframes in report
#         profit_and_loss.parameter_compare_to - - compare timeframes selected to either same period(s) last year, most recent period(s) prior or no comparison
#         profit_and_loss.parameter_aggregate - if yes, all timeframes selected will be aggregated into Reporting/Comparison Period else each timeframe selected will be displayed in report
#         profit_and_loss.filter_fiscal_timeframe - select one or more fiscal periods to include in Income Statement report
#
#   2) Using Liquid, builds SQL statement on the fly based on values selected for above parameters
#      and filters to return the "Comparison" timeframes
#
#      Uses a JOIN between profit_and_loss_01_reporting_fiscal_periods_sdt and profit_and_loss_fiscal_periods_sdt to derive the comparison period
#      using either yoy or prior fiscal year/fiscal year quarter/fiscal year period
#      For example, if user selects to display Fiscal Period and compare to last year,
#      the derived join statement will be:
#           FROM profit_and_loss_01_reporting_fiscal_periods_sdt rep
#           JOIN profit_and_loss_fiscal_periods_sdt comp
#                       ON rep.glhierarchy = comp.glhierarchy
#                       AND rep.company_code = comp.company_code
#                       AND rep.yoy_fiscal_year_period = comp.fiscal_year_period
#
#      Another example, if user selects to display Fiscal Quarter, compare to Prior Quarter, and Aggregate results
#      the derived join statement will be:
#           FROM profit_and_loss_01_reporting_fiscal_periods_sdt rep
#           JOIN profit_and_loss_fiscal_periods_sdt comp
#                       ON rep.glhierarchy = comp.glhierarchy
#                       AND rep.company_code = comp.company_code
#                       AND rep.prior_fiscal_quater_rank = comp.fiscal_year_quarter_rank
#                       AND rep.period_order_in_quarter = comp.period_order_in_quarter
#
#      NOTE, If the user selects a partial year or quarter, the comparison period will also be a partial year or quarter
#
#   3) Derives new dimensions:
#         fiscal_reporting_group -- value of Comparison
#         alignment_group -- if parameter_aggregate = 'Yes' assign 1 else
#                            derive with DENSE_RANK() based on Order of fiscal year, quarter or period. If multiple timeframes selected, each set of comparisons will be given a unique group number
#
#                            If multiple timeframes selected and Aggregate = 'No', each set of comparisons will be given a unique group number
#                            e.g., if user selects 2024.001 and 2024.002 to compare to same periods last year and Aggregate = 'No', two alignment groups will be defined as:
#                            alignment group 1 = 2024.001 compared to 2023.001
#                            alignment group 2 = 2024.002 compared to 2023.002
#
#                            If multiple timeframes selected and Aggregate = 'Yes', all timeframes will be combined into 1 alignment group.
#                            e.g., if user selects 2024.001 and 2024.002 to compare to same periods last year, two alignment groups with focus_timeframe labels will be defined as:
#                            alignment group 1 = 2024.001 + 2024.002 compared to 2023.001 + 2023.002
#
#        selected_timeframe -- returns either fiscal_year, fiscal_year_quarter or fiscal_year_period based on parameter_display_time_dimension
#########################################################}

include: "/views/profit_and_loss_fiscal_periods_sdt.view"
include: "/views/profit_and_loss_01_reporting_fiscal_periods_sdt.view"


view: profit_and_loss_02_comparison_fiscal_periods_sdt {
  extends: [profit_and_loss_fiscal_periods_sdt]
  derived_table: {
    sql:
    {% assign comparison_type = profit_and_loss.parameter_compare_to._parameter_value %}

      {% if comparison_type != "none" %}
          {% assign time_level = profit_and_loss.parameter_display_time_dimension._parameter_value %}
          {% assign aggregate = profit_and_loss.parameter_aggregate._parameter_value %}
          {% assign window_partition = "(PARTITION BY comp.glhierarchy, comp.company_code)" %}
          {% if time_level == 'fp' %}
                {% assign timeframe_field = "fiscal_year_period" %}
                {% assign join2_sql = "" %}
            {% elsif time_level == 'qtr' %}
                {% assign timeframe_field = "fiscal_year_quarter" %}
                {% assign join2_sql = "AND rep.period_order_in_quarter = comp.period_order_in_quarter" %}
            {% elsif time_level == 'yr' %}
                {% assign timeframe_field = "fiscal_year" %}
                {% assign join2_sql = "AND rep.fiscal_period = comp.fiscal_period" %}
          {% endif %}
          {% assign rank_field = timeframe_field | append: "_rank" %}

      {% if aggregate == 'Yes' %}{% assign alignment_group_sql = '1' %}
      {% else %}{% assign alignment_group_sql = "DENSE_RANK() OVER (ORDER BY comp." | append: timeframe_field | append: " DESC)" %}
      {% endif %}

      {% if comparison_type == 'yoy' %}{% assign timeframe_join_sql = "fiscal_year_period" %}
      {% elsif comparison_type == 'prior' and aggregate == 'Yes' %}{% assign timeframe_join_sql = timeframe_field | append: "_rank" %}
      {% elsif comparison_type == 'prior' and aggregate == 'No' %}{% assign timeframe_join_sql = timeframe_field  %}
      {% else %}{% assign timeframe_join_sql = "" %}
      {% endif %}

      {% assign join1_sql = "AND rep.prior_timeframe_join = comp." | append: timeframe_join_sql %}


      SELECT
        comp.glhierarchy,
        comp.company_code,
        comp.fiscal_year_period,
        comp.fiscal_year_quarter,
        comp.fiscal_year,
        comp.fiscal_period,
        {{alignment_group_sql}} AS alignment_group,
        comp.{{timeframe_field}} AS selected_timeframe,
        rep.is_partial_timeframe,
        'Comparison' AS fiscal_reporting_group
      FROM ${profit_and_loss_01_reporting_fiscal_periods_sdt.SQL_TABLE_NAME} rep
      JOIN ${profit_and_loss_fiscal_periods_sdt.SQL_TABLE_NAME} comp
      ON rep.glhierarchy = comp.glhierarchy
      AND rep.company_code = comp.company_code
      {{join1_sql}}
      {{join2_sql}}
      WINDOW window_pk AS {{window_partition}}

      {% else %}
      SELECT 1 as dummy_field
      {% endif %}
      ;;

  }

}
