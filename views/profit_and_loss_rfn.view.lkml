#########################################################{
# PURPOSE
# The ProfitAndLoss table and its corresponding View profit_and_loss reflects an aggregation of General Ledger Transactions by the following dimensions:
#   Client
#   Fiscal Year
#   Fiscal Period
#   Company Code
#   Chart of Accounts
#   Hierarchy Name
#   Business Area
#   Profit Center
#   Cost Center
#   Ledger
#   Hierarchy Node
#   Languague
#   Global (Target) Currency
#
# SOURCES
# Refines View profit_and_loss (defined in file profit_and_loss_base.view)
# Extends View common_fields_finance_ext
#
# REFERENCED BY
# Explore profit_and_loss
#
# EXTENDED FIELDS
# Extends common dimensions found in both balance sheet and profit and loss
#   client_mandt, language_key_spras, currency_key, target_currency_tcurr, ledger_in_general_ledger_accounting, company_code, company_text, chart_of_accounts, business_area,
#   fiscal_period, fiscal_quarter, fiscal_year and related fields
# Make changes to these dimensions in the common_fields_finance_ext view or
# in this view if the changes are specific to Profit and Loss.
#
# KEY MEASURES
#    Amount in Local Currency, Amount in Global Currency
#    Cumulative Amount in Local Currency, Cumulative Amount in Global Currency
#    Exchange Rate (based on last date in the period)
#    Avg Exchange Rate, Max Exchange Rate
#
# HOW TO USE
# To query this table, filter to:
#   - a single Client MANDT (handled with Constant defined in Manifest file)
#   - a single Language (the Explore based on this view uses User Attribute locale to select language in joined view language_map_sdt)
#   - a single Global Currency
#   - a single Hierarchy Name or Financial Statement Version
#
#########################################################}


include: "/views/profit_and_loss_base.view"
include: "/views/common_fields_finance_ext.view"

view: +profit_and_loss {
  extends: [common_fields_finance_ext]

  label: "Income Statement"

  dimension: key {
    primary_key: yes
    hidden: yes
    sql:  CONCAT(${client},${company_code}, ${chart_of_accounts}, ${glhierarchy},
          COALESCE(${business_area},'null') ,COALESCE(${ledger_in_general_ledger_accounting},'0L'),
          COALESCE(${profit_center},'null'),COALESCE(${cost_center},'null')
          ,${glnode},${fiscal_year},${fiscal_period},${language_key_spras},${target_currency_tcurr});;
  }

#########################################################
# Parameters & Filters for Income Statement Dashboard and related dimensions
#{
# 4 parameters:
#   parameter_display_time_dimension
#   filter_fiscal_timeframe
#   parameter_compare_to
#   parameter_aggregate
#
# 2 related dimensions:
#   timeframes_list - based on selection for parameter_display_time_dimension will show either fiscal_year, fiscal_year_quarter_label, fiscal_year_period
#
#########################################################

  parameter: parameter_display_time_dimension {
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    label: "Display Year, Quarter or Period"
    allowed_value: {label: "Fiscal Period" value: "fp"}
    allowed_value: {label: "Quarter" value: "qtr"}
    allowed_value: {label: "Year" value: "yr"}
    default_value: "qtr"
  }

  # this filter is intended for use on a dashboard only and should be linked to parameter_display_time_dimension
  # so that values in drop-down populate correctly based on the time display selected
  # note, when used in an explore this filter may not reflect changes in parameter_display_time_dimension
  # this filter is applied in view profit_and_loss_hierarchy_selection_sdt (which is joined to this view in the Explore profit_and_loss)
  filter: filter_fiscal_timeframe {
    type: string
    view_label: "🔍 Filters & 🛠 Tools"
    description: "Choose fiscal periods, quarters or years for Income Statement Reporting. To ensure the correct timeframes are listed, add this filter to a dashboard. Add the parameter \'Display Fiscal Period or Quarter\' and select this filter to update when the display parameter changes."
    label: "Select Fiscal Timeframe"
    suggest_dimension: timeframes_list
  }

  parameter: parameter_aggregate {
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    label: "Combine Selected Timeframes?"
    description: "If multiple timeframes selected, should results be combined or shown for each time period selected?"
    allowed_value: {value: "Yes"}
    allowed_value: {value: "No"}
    default_value: "Yes"
  }

  parameter: parameter_compare_to {
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    label: "Select Comparison Type"
    allowed_value: {
      label: "None" value: "none"
    }
    allowed_value: {
      label: "Year Ago" value: "yoy"
    }
    allowed_value: {
      label: "Prior Fiscal Timeframe" value: "prior"
    }
    default_value: "none"
  }

  dimension: timeframes_list {
    hidden: yes
    view_label: "🔍 Filters & 🛠 Tools"
    label: "Timeframe"
    description: "Used to populate filter labeled Select Fiscal Timeframe. Timeframes listed depend on whether displaying Fiscal Periods, Quarters or Years in the Income Statement dashboards."
    sql: {% assign display = parameter_display_time_dimension._parameter_value %}
         {% if display == 'yr' %}${fiscal_year}
         {% elsif display == 'qtr' %}${fiscal_year_quarter_label}
         {% else %}${fiscal_year_period}
         {% endif %}
        ;;
    order_by_field: selected_timeframe_level_as_negative_number
  }

  dimension: selected_timeframe_level_as_negative_number {
    hidden: yes
    description: "Used to sort timeframes shown (fiscal periods, quarters or years) in descending order."
    sql: {% assign display = parameter_display_time_dimension._parameter_value %}
         {% if display == 'yr' %}${fiscal_year_negative_number}
         {% elsif display == 'qtr' %}${fiscal_year_quarter_negative_number}
         {% else %}${fiscal_year_period_negative_number}
         {% endif %};;
  }

#} end parameters & filters


#########################################################
# GL Hierarchy, Level, Parent and Node dimensions
# {

  dimension: glhierarchy {
    label: "GL Hierarchy"
    description: "GL Hierarchy Name is same as Financial Statement Version (FSV)"
  }

  dimension: gllevel {
    label: "GL Level"
    description: "GL Hierarchy level of the Child Node represents logical classification within a Chart of Accounts and Includes the Parent-Child Relationship."
  }

  dimension: gllevel_number {
    type: number
    label: "GL Level (number)"
    description: "GL Level as a numeric. GL Hierarchy level of the Child Node represents logical classification within a Chart of Accounts and Includes the Parent-Child Relationship."
    sql: PARSE_NUMERIC(${gllevel}) ;;
  }

  # used as input into parameter Top Level of Hierarchy to Show
  dimension: gllevel_string {
    type: string
    hidden: yes
    label: "Level"
    description: "GL Level as a string. GL Hierarchy level of the Child Node represents logical classification within a Chart of Accounts and Includes the Parent-Child Relationship."
    sql: LTRIM(${gllevel},'0') ;;
  }

  dimension: glnode {
    label: "GL Node (code)"
    description: "General Ledger Child Node as a code value."
  }

  dimension: glnode_text {
    label: "GL Node (text)"
    description: "General Ledger Child Node as a descriptive name."
    order_by_field: glnode
  }

  dimension: glparent {
    label: "GL Parent (code)"
    description: "Within a given GL Level, the Parent Node of the Child Node as a code value."
  }

  dimension: glparent_text {
    label: "GL Parent (text)"
    description: "Within a given GL Level, the Parent Node of the Child Node as a descriptive name."
    order_by_field: glparent
  }

  dimension: glfinancial_item {
    label: "GL Financial Item"
    description: "A single line-item entry within a GL account."
  }

  dimension: glis_leaf_node {
    type: yesno
    label: "Is Leaf Node"
    description: "Yes if GL Child Node is a Leaf Node."
  }

  dimension: cost_center {
    description: "Cost Center"
  }

  dimension: profit_center {
    description: "Profit Center"
  }

#} end gl_dimensions

#########################################################
# Amount dimensions with Sign Multiplier
# {
# Revenue is generally displayed in general ledger as a negative number, which indicates a credit.
# By setting the constant SIGN_CHANGE value to 'yes' in the project manifest,
# it's displayed as a positive number in income statement.
#
# Using the constant sign_change_multiplier (which uses SIGN_CHANGE constant), the appropriate multiplier is
# applied to the Amount dimensions below
#
# These dimensions are hidden from the explore and restated using measures
#

  dimension: amount_in_local_currency {
    hidden: yes
    sql: @{sign_change_multiplier}
      ${TABLE}.AmountInLocalCurrency * {{multiplier}} ;;
  }

  # based on value in CONSTANTs sign_change_multiplier flip the signs so Income is positive and Expenses negative
  dimension: amount_in_target_currency {
    hidden: yes
    label: "Amount in Global Currency"
    sql: @{sign_change_multiplier}
      ${TABLE}.AmountInTargetCurrency * {{multiplier}} ;;
  }

  dimension: cumulative_amount_in_local_currency {
    hidden: yes
    sql: @{sign_change_multiplier}
      ${TABLE}.CumulativeAmountInLocalCurrency * {{multiplier}} ;;
  }

  dimension: cumulative_amount_in_target_currency {
    hidden: yes
    label: "Cumulative Amount in Global Currency"
    description: "End of Period Cumulative Amount in Global/Target Currency"
    sql: @{sign_change_multiplier}
      ${TABLE}.CumulativeAmountInTargetCurrency * {{multiplier}} ;;
  }

#} end amount dimensions

#########################################################
# Measures
# {

  measure: count {
    hidden: no
    label: "Count of Rows"
  }

  measure: total_amount_in_local_currency {
    type: sum
    label: "Total Amount (Local Currency)"
    description: "Period Amount in Local Currency"
    sql: ${amount_in_local_currency} ;;
    # value_format_name: millions_d1
  }

  measure: total_cumulative_amount_in_local_currency {
    hidden: yes
    type: sum
    label: "Total Cumulative Amount (Local Currency)"
    description: "End of Period Cumulative Amount in Local Currency"
    sql: ${cumulative_amount_in_local_currency} ;;
    value_format_name: decimal_0
    # value_format_name: millions_d1
  }

  measure: total_amount_in_global_currency {
    type: sum
    label: "Total Amount (Global Currency)"
    description: "Period Amount in Target or Global Currency"
    sql: ${amount_in_target_currency} ;;
    value_format_name: decimal_0
    # value_format_name: millions_d1
  }

  measure: total_cumulative_amount_in_global_currency {
    hidden: yes
    type: sum
    label: "Total Cumulative Amount (Global Currency)"
    description: "End of Period Cumulative Amount in Target or Global Currency"
    sql: ${cumulative_amount_in_target_currency} ;;
    value_format_name: decimal_0
    # value_format_name: millions_d1
  }

  measure: net_income {
    type: sum
    hidden: no
    label: "Total Net Income (Global Currency)"
    sql: ${amount_in_target_currency} ;;
    filters: [gllevel_number: "2"]
    value_format_name: millions_d1
  }

  measure: list_companies {
    type: list
    hidden: yes
    list_field: company_text
  }

  #} end measures


}
