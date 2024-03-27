#########################################################{
# PURPOSE
# The BalanceSheet table and its corresponding View balance_sheet reflects
# an aggregation of Transactions by the following dimensions:
#   Client
#   Fiscal Year
#   Fiscal Period
#   Company Code
#   Chart of Accounts
#   Hierarchy Name
#   Business Area
#   Ledger
#   Node
#   Languague
#   Global (Target) Currency
#
# SOURCES
# Refines View balance_sheet (defined in file balance_sheet_base.view)
# Extends View common_fields_finance_ext
#
# REFERENCED BY
# Explore balance_sheet
#
# EXTENDED FIELDS
# Extends common dimensions found in both balance sheet and profit and loss
#   client_mandt, language_key_spras, currency_key, target_currency_tcurr, ledger_in_general_ledger_accounting, company_code, company_text, chart_of_accounts, business_area,
#   fiscal_period, fiscal_quarter, fiscal_year and related fields
# Make changes to these dimensions in the common_fields_finance_ext view or
# in this view if the changes are specific to the Balance Sheet.
#
# KEY MEASURES
#    Amount in Local Currency, Amount in Global Currency
#    Cumulative Amount in Local Currency, Cumulative Amount in Global Currency
#    Exchange Rate (based on last date in the period)
#    Avg Exchange Rate, Max Exchange Rate
#    Current Ratio, Current Assets, and Current Liabilities
#
# CAVEATS
# Current Ratio and related measures are defined using English-only terms found in Node (text).
# Edit these as necessary to support other languages or use Node values instead of text.
#
# HOW TO USE
# To query this table, always include Fiscal Year and Fiscal Period as dimensions
# and filter to:
#   - a single Client MANDT (handled with Constant defined in Manifest file)
#   - a single Language (the Explore based on this view uses User Attribute locale to select language in joined view language_map_sdt)
#   - a single Global Currency
#   - a single Hierarchy Name or Financial Statement Version
#   - a single Chart of Accounts
#   - a single Company
#########################################################}


include: "/views/balance_sheet_base.view"
include: "/views/common_fields_finance_ext.view"

view: +balance_sheet {
  extends: [common_fields_finance_ext]

  dimension: key {
    primary_key: yes
    hidden: yes
    sql: concat(${client},${company_code}, ${chart_of_accounts}, ${hierarchy_name},
          coalesce(${business_area},'is null') ,coalesce(${ledger_in_general_ledger_accounting},'0L')
          ,${node},${fiscal_year},${fiscal_period},${language_key_spras},${target_currency_tcurr});;
  }

#########################################################
# Parameters for Balance Sheet Dashboard
#{
# 3 parameters:
#   select_fiscal_period
#   select_comparison_type
#   select_custom_comparison_period
#
# use parameter selections to define fiscal_period_group values of 'Reporting' or 'Comparison'
#
# the inner join to balance_sheet_fiscal_periods_selected at explore level will
# filter to keep rows where fiscal_period_group is not null if select_fiscal_period is in the query
#########################################################

  parameter: select_fiscal_period {
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    description: "Select a Fiscal Period for Balance Sheet Reporting"
    # suggest_explore: balance_sheet_fiscal_periods_sdt
    suggest_dimension: fiscal_year_period
  }

  parameter: select_comparison_type {
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    description: "When creating a Balance Sheet report, you can choose to compare the selected fiscal period to the previous year, previous fiscal period, or a custom period. If Custom is selected, select a Fiscal Period from the 'Select Custom Comparison Period' parameter."
    allowed_value: {
      label: "None" value: "none"
    }
    allowed_value: {
      label: "Year Ago" value: "yoy"
    }
    allowed_value: {
      label: "Prior Fiscal Period" value: "prior"
    }
    allowed_value: {
      label: "Custom Comparison Period" value: "custom"
    }
    default_value: "yoy"
  }

  parameter: select_custom_comparison_period {
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    description: "When Comparison Type equals Custom, you must select a Comparison Period. If no comparison period selected, previous year will be used."
    # suggest_explore: fiscal_periods_sdt
    suggest_dimension: fiscal_year_period
  }


  #} end Parameters

#########################################################
# Hierarchy Dimensions
#{

  dimension: hierarchy_name {
    description: "Hierarchy Name or Financial Statement Version (FSV)"
  }

  dimension: parent {
    label: "Parent (code)"
    description: "Parent (as ID or code) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Noncurrent Assets."
  }

  dimension: parent_text {
    type: string
    label: "Parent (text)"
    description: "Parent (as text) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Non-Current Assets."
    # sql: coalesce(${TABLE}.ParentText,${TABLE}.Parent) ;;
    sql: COALESCE(regexp_replace(${TABLE}.ParentText,'Non[- ]Current','Noncurrent'),${TABLE}.Parent) ;;
    order_by_field: parent
  }

  dimension: parent_sort_order {
    type: string
    hidden: yes
    sql: CONCAT(${level_number},${parent}) ;;
  }

  dimension: node {
    label: "Node (code)"
    description: "Child Node (as an ID or code) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Noncurrent Assets."
  }

  dimension: node_text {
    type: string
    label: "Node (text)"
    description: "Child Node (as text) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Noncurrent Assets."
    sql: COALESCE(regexp_replace(${TABLE}.NodeText,'Non[- ]Current','Noncurrent'),${TABLE}.Node) ;;
    order_by_field: node
  }

  dimension: level {
    hidden: yes
    description: "The child node level displays the parent-child relationship. For instance at level 2, FPA1 is the parent with Assets and Liabilities & Equity as child nodes. At level 3, Assets is the parent with Current Assets and Noncurrent Assets as child nodes."
  }

  dimension: level_number {
    type: number
    description: "Level as a numeric. The child node level displays the parent-child relationship. For instance at level 2, FPA1 is the parent with Assets and Liabilities & Equity as child nodes. At level 3, Assets is the parent with Current Assets and Noncurrent Assets as child nodes."
    sql: PARSE_NUMERIC(${level}) ;;
  }

  dimension: level_string {
    type: string
    label: "Level"
    description: "Level as a string without any leading 0s. The child node level displays the parent-child relationship. For instance at level 2, FPA1 is the parent with Assets and Liabilities & Equity as child nodes. At level 3, Assets is the parent with Current Assets and Noncurrent Assets as child nodes."
    sql: LTRIM(${level},'0') ;;
  }

  dimension: is_leaf_node {
    description: "Yes if GL Account Number which indicates lowest level of hierarchy"
  }

  #} end Hierarchy Dimensions



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
    value_format_name: millions_d1
  }

  measure: total_cumulative_amount_in_local_currency {
    type: sum
    label: "Total Cumulative Amount (Local Currency)"
    description: "End of Period Cumulative Amount in Local Currency"
    sql: ${cumulative_amount_in_local_currency} ;;
    value_format_name: millions_d1
  }

  measure: total_amount_in_global_currency {
    type: sum
    label: "Total Amount (Global Currency)"
    description: "Period Amount in Target or Global Currency"
    sql: ${amount_in_target_currency} ;;
    value_format_name: millions_d1
  }

  measure: total_cumulative_amount_in_global_currency {
    type: sum
    label: "Total Cumulative Amount (Global Currency)"
    description: "End of Period Cumulative Amount in Target or Global Currency"
    sql: ${cumulative_amount_in_target_currency} ;;
    value_format_name: millions_d1
  }

  measure: current_assets {
    type: sum
    description: "Current Assets are those assets that can be converted into cash/liquid funds at short notice (typically within one year), such as short-term investments and accounts receivable."
    sql:  ${cumulative_amount_in_target_currency};;
    filters: [node_text: "Current Assets"]
  }

  measure: current_liabilities {
    type: sum
    description: "Current liabilities are short-term financial obligations that are due within one year."
    sql:  ${cumulative_amount_in_target_currency};;
    filters: [node_text: "Current Liabilities"]
  }

  measure: current_ratio {
    type: number
    description: "The ratio of current assets to current liabilities. Generally, a current ratio below 1 may be a warning sign that the company doesn’t have enough convertible assets to meet its short-term liabilities."
    sql: SAFE_DIVIDE(${current_assets},${current_liabilities}) * -1;;
    value_format_name: decimal_2
  }

  # used in Balance Sheet dashboard; add to a single-value visualization
  measure: title_balance_sheet {
    type: number
    description: "Used in Balance Sheet dashboard as Summary visualization with Company, Global Currency, Fiscal Period and Current Ratio. Add this measure to a single-value visualizaiton."
    sql: 1 ;;
    html:
      {% if company_text._is_filtered %}{% assign company_list = list_companies._value | replace: '|RECORD|',', ' %}
      {% else %}{% assign company_list = 'All Companies' %}{%endif%}
      <div  style="font-size:100%; background-color:rgb((169,169,169,.5); text-align:center;  line-height: .8; font-color: #808080">
          <a style="font-size:100%;color: black"><b>Balance Sheet</b></a><br>
          <a style= "font-size:80%;color: black">{{company_list}}</a><br>
          <a style= "font-size:80%;color: black">Fiscal Period:   {{select_fiscal_period._parameter_value}}&nbsp;&nbsp;&nbsp; Current Ratio: {{current_ratio._rendered_value}}</a>
          <br>
          <a style= "font-size: 60%; text-align:center;color: black"> Amounts in Millions  {{target_currency_tcurr}} </a>
       </div>
      ;;
  }

  measure: last_day_exchange_rate {
    type: max
    group_label: "Exchange Rates"
    label: "Exchange Rate"
    description: "Exchange Rate between Currency (Local) and Currency (Global) as of Last Day of Fiscal Period"
    sql: ${exchange_rate} ;;
    value_format_name: decimal_4
  }

  measure: max_avg_exchange_rate {
    type: max
    group_label: "Exchange Rates"
    label: "Avg Exchange Rate"
    description: "Average Exchange Rate between Currency (Local) and Currency (Global) for the Fiscal Period"
    sql: ${avg_exchange_rate} ;;
    value_format_name: decimal_4
  }

  measure: max_max_exchange_rate {
    type: max
    group_label: "Exchange Rates"
    label: "Max Exchange Rate"
    description: "Max Exchange Rate between Currency (Local) and Currency (Global) for the Fiscal Period"
    sql: ${max_exchange_rate} ;;
    value_format_name: decimal_4
  }

  measure: list_companies {
    type: list
    hidden: yes
    list_field: company_text
  }

  #} end measures

}
