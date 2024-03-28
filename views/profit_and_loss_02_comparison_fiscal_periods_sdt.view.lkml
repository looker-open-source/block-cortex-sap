#########################################################{
# PURPOSE
# Step 2 of 3 in deriving Reporting and Comparison Groups of timeframes. Step 01 returns Comparison periods.
#
# SOURCE
# View profit_and_loss_fiscal_periods_sdt
#
# REFERENCED BY
# VIEW profit_and_loss_fiscal_periods_sdt (aliased in SQL below as comp)
# VIEW profit_and_loss_01_reporting_fiscal_periods_sdt (aliased in SQL below as rep)
#
# PROCESS FOR STEP 2 - DERIVE COMPARISON PERIODS
#   1) Captures user inputs from parameters and filters:
#         profit_and_loss.parameter_display_time_dimension -- filter and display either Fiscal Year, Fiscal Quarter or Fiscal Period
#         profit_and_loss.filter_fiscal_timeframe -- select one or more fiscal timeframes (either Year, Quarter or Fiscal Period) to include in Income Statement report
#         profit_and_loss.parameter_compare_to -- compare selected reporting timeframe to either same timeframe last year, the prior timeframe or no comparison
#         profit_and_loss.parameter_aggregate -- If "yes" is selected, all selected timeframes will be combined into a single Reporting/Comparison Group. Otherwise, each selected timeframe will be displayed separately in the report.
#
#   2) If parameter_compare_to != 'none', builds SQL statement based on parameter values selected. Returns the fiscal periods
#      representing the "Comparison" group.
#
#      Establishes Comparison group with a JOIN between profit_and_loss_01_reporting_fiscal_periods_sdt and profit_and_loss_fiscal_periods_sdt
#      using either yoy_ or prior_[fiscal timeframe]
#
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
#   3) Derives new dimensions:
#         fiscal_reporting_group -- assigned value of Comparison
#         alignment_group -- if parameter_aggregate = 'Yes' assign 1 else
#                            derive with DENSE_RANK() based on order of fiscal year, quarter or period.
#
#                            If multiple timeframes selected and parameter_aggregate = 'No', each set of comparisons will be given a unique group number
#                            e.g., if user selects 2024.001 and 2024.002 to compare to same periods last year and parameter_aggregate = 'No', two alignment groups are defined as:
#                            alignment group 1 = 2024.001 compared to 2023.001
#                            alignment group 2 = 2024.002 compared to 2023.002
#
#                            If multiple timeframes selected and parameter_aggregate = 'Yes', all timeframes will be combined into 1 alignment group.
#                            e.g., if user selects 2024.001 and 2024.002 to compare to same periods last year, one alignment gorup is defined as:
#                            alignment group 1 = 2024.001 + 2024.002 compared to 2023.001 + 2023.002
#
#        selected_timeframe -- returns fiscal year, quarter or period values based on parameter_display_time_dimension
#
# NOTES
# This view is only referenced in another view and does not define any dimensions or measures.
# If the user selects a partial year or quarter, the comparison period will also be a partial year or quarter.
# If comparison = "none" a dummy SQL statement is generated and no comparison period will be derived
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
