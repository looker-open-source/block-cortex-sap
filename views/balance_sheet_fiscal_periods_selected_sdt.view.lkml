#########################################################{
# PURPOSE
# Derives Reporting vs Comparison Periods based on user inputs
#
# SOURCE
# View balance_sheet_fiscal_periods_sdt
#
# REFERENCED BY
# Explore balance_sheet
#
# KEYS TO USING
#   - View label is "Reporting vs. Comparison Period"
#   - Fields are hidden by default so must change field's "hidden:" property to "no" to include in an Explore
#   - Measures include references to fields from view balance_sheet so must join this view to balance_sheet using an inner join on:
#         hierarchy_name, company_code, fiscal_year, fiscal_period
#     Note, the source view already filters to a single Client id so it is not needed in the join
#
# PROCESS
#   1) Captures inputs from parameters:
#         balance_sheet.select_fiscal_period -- user selects a single "Reporting" fiscal period
#         balance_sheet.select_compare_to -- user can compare the Reporting period to either: same period a year ago, the prior fiscal period, a specific fiscal period
#         balance_sheet.select_custom_comparison_period -- if "Custom" comparison selected, user must select one "Comparison" fiscal period. Year ago used if no period provided
#
#   2) Builds SQL statement based on parameter values selected. Returns the fiscal periods
#      representing the "Reporting" and "Comparison" periods
#
#   3) Derives these fields:
#         fiscal_period_group -- value of Reporting or Comparison
#         alignment_group_name -- equals the value of the selected reporting period
#
# MEASURES
#     reporting_period_amount_in_global_currency -- Cumulative Amount in Global Currency when fiscal_period_group = 'Reporting'
#     comparison_period_amount_in_global_currency -- Cumulative Amount in Global Currency when fiscal_period_group = 'Comparison'
#     difference_value -- reporting_period_amount_in_global_currency - comparison_period_amount_in_global_currency
#     difference_percent -- (reporting_period_amount_in_global_currency - comparison_period_amount_in_global_currency) / abs(comparison_period_amount_in_global_currency)
#
#########################################################}


include: "/views/balance_sheet_fiscal_periods_sdt.view.lkml"


view: balance_sheet_fiscal_periods_selected_sdt {
  label: "Reporting vs. Comparison Period"
  fields_hidden_by_default: yes

  derived_table: {
    sql:    {% assign comparison_type = balance_sheet.select_comparison_type._parameter_value %}
            {% assign fp = balance_sheet.select_fiscal_period._parameter_value %}
            {% assign cp = balance_sheet.select_custom_comparison_period._parameter_value %}
            {% if comparison_type == 'custom' %}
                {% if fp == cp %}{% assign comparison_type = 'none' %}
                {% elsif cp == '' %}{% assign comparison_type = 'yoy' %}
                {% endif %}
            {% endif %}

      {% if comparison_type == 'custom' %}
      {% assign cp_list = cp | prepend: ",'" | append: "'" %}
      {%else%}{% assign cp_list = ' ' %}
      {% endif %}

      SELECT
      fp.unique_id,
      fp.hierarchy_name,
      fp.company_code,
      fp.fiscal_year,
      fp.fiscal_period,
      fp.fiscal_year_period,
      CASE fp.fiscal_year_period
      WHEN '{{fp}}' THEN 'Reporting'
      ELSE 'Comparison'
      END AS fiscal_period_group,
      1 AS alignment_group,
      '{{fp}}' AS alignment_group_name
      FROM ${balance_sheet_fiscal_periods_sdt.SQL_TABLE_NAME} fp
      WHERE fiscal_year_period IN ('{{fp}}'{{cp_list}})
      {% if comparison_type == 'prior' or comparison_type == 'yoy' %}
      OR fiscal_year_period IN
      (SELECT {{comparison_type}}_fiscal_year_period
      FROM ${balance_sheet_fiscal_periods_sdt.SQL_TABLE_NAME}
      WHERE fiscal_year_period = '{{fp}}' )
      {% endif %}
      ;;
  }

#########################################################
# Dimensions
# {

  dimension: unique_id {
    type: string
    primary_key: yes
    sql:  ${TABLE}.unique_id;;
  }

  dimension: hierarchy_name {
    type: string
    sql:  ${TABLE}.hierarchy_name;;
  }

  dimension: company_code {
    type: string
    sql:  ${TABLE}.company_code;;
  }

  dimension: fiscal_year {
    type: string
    sql:  ${TABLE}.fiscal_year;;
  }

  dimension: fiscal_period {
    type: string
    sql:  ${TABLE}.fiscal_period;;
  }

  dimension: alignment_group_name {
    type: string
    sql:  ${TABLE}.alignment_group_name;;
  }

  dimension: fiscal_period_group {
    type: string
    hidden: no
    sql:  ${TABLE}.fiscal_period_group;;
  }

  dimension: alignment_group {
    type: number
    sql: ${TABLE}.alignment_group ;;
  }

#########################################################} end dimensions

#########################################################
# Reporting vs Comparison Period Measures
# {

  measure: reporting_period_amount_in_global_currency {
    type: sum_distinct
    sql_distinct_key: ${balance_sheet.key} ;;
    hidden: no
    view_label: "Reporting vs. Comparison Period"
    label_from_parameter: balance_sheet.select_fiscal_period
    description: "Cumulative Amount in Global Currency for the selected Fiscal Reporting Period"
    sql: ${balance_sheet.cumulative_amount_in_target_currency} ;;
    filters: [fiscal_period_group: "Reporting"]
    value_format_name: millions_d1
    html: @{negative_format} ;;
  }

  measure: comparison_period_amount_in_global_currency {
    type: sum_distinct
    sql_distinct_key: ${balance_sheet.key} ;;
    hidden: no
    view_label: "Reporting vs. Comparison Period"
    label: "{% assign compare_to = balance_sheet.select_comparison_type._parameter_value %}
    {% if balance_sheet.select_fiscal_period._in_query %}
    {% if compare_to == 'custom' %}{% parameter balance_sheet.select_custom_comparison_period %}
    {% elsif compare_to == 'prior' %}
    {% assign fp = balance_sheet.select_fiscal_period._parameter_value | split: '.' %}
    {% if fp[1] == '001'%}{% assign cp = 'Previous Fiscal Period'%}
    {% else %}{% assign m = fp[1] | times: 1 | minus: 1 | prepend: '00' | slice: -3, 3 %}{% assign cp = fp[0] | append: '.' | append: m %}
    {% endif %}{{cp}}
    {% elsif compare_to == 'yoy' %}
    {% assign fp = balance_sheet.select_fiscal_period._parameter_value | split: '.' %}
    {% assign yr = fp[0] | times: 1 | minus: 1 %}
    {% assign cp =  yr | append: '.'| append: fp[1] %}{{cp}}
    {% elsif compare_to == 'none' %}
    {% endif %}
    {% else %} Comparison Period Amount in Global Currency
    {% endif %}"
    description: "Cumulative Amount in Global Currency for the selected Fiscal Comparison Period"
    sql: ${balance_sheet.cumulative_amount_in_target_currency} ;;
    filters: [fiscal_period_group: "Comparison"]
    value_format_name: millions_d1
    html: {% if balance_sheet.select_fiscal_period._in_query and balance_sheet.select_comparison_type._parameter_value == 'none' %}
          {% else %}@{negative_format}
          {% endif %};;
  }

  measure: difference_value {
    type: number
    hidden: no
    view_label: "Reporting vs. Comparison Period"
    label: "Variance Amount"
    description: "Reporting Period Amount minus Comparison Period Amount"
    sql: ${reporting_period_amount_in_global_currency} - ${comparison_period_amount_in_global_currency} ;;
    value_format_name: millions_d1
    html: @{negative_format} ;;
  }

  measure: difference_percent {
    type: number
    hidden: no
    view_label: "Reporting vs. Comparison Period"
    label: "Variance %"
    description: "Percentage Change between Reporting and Comparison Periods"
    # note ABS in denominator because both numerator and denominator can both be negative. ABS allows further Decline between 2 negative numbers to show as negative
    sql: SAFE_DIVIDE( (${reporting_period_amount_in_global_currency} - ${comparison_period_amount_in_global_currency}),ABS(${comparison_period_amount_in_global_currency})) ;;
    value_format_name: percent_1
    html: @{negative_format} ;;
  }

#########################################################} end reporting metrics
}
