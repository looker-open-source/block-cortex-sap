#########################################################
# aggregation of Transactions by the following dimensions:
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
# Measures:
#    Amount in Local Currency, Amount in Global Currency
#    Cumulative Amount in Local Currency, Cumulative Amount in Global Currency
#    Exchange Rate (based on last date in the period)
#    Avg Exchange Rate, Max Exchange Rate
#
# To query this table, always include Fiscal Year and Fiscal Period as dimensions
# and filter to:
#   - a single Client MANDT (handled with Constant defined in Manifest file)
#   - a single Language (the Explore based on this view uses User Attribute locale to select language in joined view language_map_sdt)
#   - a single Global Currency
#   - a single Hierarchy Name or Financial Statement Version
#   - a single Chart of Accounts
#   - a single Company
#########################################################


include: "/views/balance_sheet_base.view"

view: +balance_sheet {

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
# a sql_always_where clause defined at explore level will
# filter where fiscal_period_group is null if select_fiscal_period is in the query
#########################################################

  parameter: select_fiscal_period {
    type: unquoted
    view_label: "🗓 Pick Fiscal Periods"
    description: "Select a Fiscal Period for Balance Sheet Reporting"
    suggest_explore: fiscal_periods_sdt
    suggest_dimension: fiscal_year_period
  }

  parameter: select_comparison_type {
    type: unquoted
    view_label: "🗓 Pick Fiscal Periods"
    description: "To include a comparison period in the Balance Sheet report, select the type of comparison to make--Same Period Last Year (default), Previous Fiscal Period or Custom. If Cusom is selected, select a Fiscal Period from Select Custom Comparison Period parameter."
    allowed_value: {
      label: "None" value: "none"
    }
    allowed_value: {
      label: "Same Period Last Year" value: "yoy"
    }
    allowed_value: {
      label: "Previous Fiscal Period" value: "prior"
    }
    allowed_value: {
      label: "Custom Comparison Period" value: "custom"
    }
    default_value: "yoy"
  }

  parameter: select_custom_comparison_period {
    type: unquoted
    view_label: "🗓 Pick Fiscal Periods"
    description: "When Comparison Type = Custom, you must select a Comparison Period. If no comparison period selected, Same Period Last Year will be used."
    suggest_explore: fiscal_periods_sdt
    suggest_dimension: fiscal_year_period
  }


  #} end Parameters

#########################################################
# Dimensions
#{

  dimension: client_mandt {
    type: string
    label: "Client"
    sql: ${TABLE}.Client ;;
  }

  dimension: language_key_spras {
    label: "Language Key"
    description: "Language used for text display of Company, Parent and/or Child Node"
  }

  dimension: currency_key {
    label: "Currency (Local)"
    description: "Local Currency"
  }

  dimension: target_currency_tcurr {
    label: "Currency (Global)"
    description: "Target or Global Currency to display in Balance Sheet"
  }

  dimension: hierarchy_name {
    description: "Hierarchy Name is same as Financial Statement Version (FSV)"
  }

  dimension: ledger_in_general_ledger_accounting {
    label: "Ledger"
    description: "Ledger in General Ledger Accounting"
    sql: coalesce(${TABLE}.LedgerInGeneralLedgerAccounting,'0L') ;;
  }

  dimension: ledger_name {
    description: "Ledger in General Ledger Accounting"
    # sql: if(${ledger_in_general_ledger_accounting} = '0L','Leading Ledger', ${ledger_in_general_ledger_accounting} );;
    sql: case ${ledger_in_general_ledger_accounting}
        when '0L' then '0L - Leading Ledger'
        when '2L' then '2L - IFRS Non-leading Ledger'
        when '0E' then '0E - Extension Ledger'
    else ${ledger_in_general_ledger_accounting} end;;
    order_by_field: ledger_in_general_ledger_accounting
  }

  dimension: business_area {
    sql: coalesce(${TABLE}.BusinessArea,'N/A') ;;
  }

  dimension: company_code {
    label: "Company (code)"
    description: "Company Code"
  }

  dimension: company_text {
    label: "Company (text)"
    description: "Company Name"
  }

  dimension: parent {
    label: "Parent (code)"
    description: "Parent (as ID or code) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Non-Current Assets."
  }

  dimension: parent_text {
    type: string
    label: "Parent (text)"
    description: "Parent (as text) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Non-Current Assets."
    # sql: coalesce(${TABLE}.ParentText,${TABLE}.Parent) ;;
    sql: coalesce(regexp_replace(${TABLE}.ParentText,'Non[- ]Current','Noncurrent'),${TABLE}.Parent) ;;
    order_by_field: parent
  }
  dimension: parent_sort_order {
    type: string
    hidden: yes
    sql: concat(${level_number},${parent}) ;;
  }

  dimension: node {
    label: "Node (code)"
    description: "Child Node (as an ID or code) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Non-Current Assets."
  }

  dimension: node_text {
    type: string
    label: "Node (text)"
    description: "Child Node (as text) of Hierarchy. For example, Assets is Parent with multiple Child Nodes like Current Assets and Non-Current Assets."
    sql: coalesce(regexp_replace(${TABLE}.NodeText,'Non[- ]Current','Noncurrent'),${TABLE}.Node) ;;
    order_by_field: node
  }

  dimension: level {
    hidden: yes
    description: "Shows the Parent-Child Relationship. For example depending on the Hierarchy selected, Level 02 will display FPA1 as the Parent with Assets and Liabilities & Equity as Child Nodes. Level 03 will display Assets as Parent with Current Assets and Non-Current Assets as Child Nodes."
  }

  dimension: level_number {
    type: number
    description: "Level as a numeric. Level shows the Parent-Child Relationship. For example depending on the Hierarchy selected, Level 2 will display FPA1 as the Parent with Assets and Liabilities & Equity as Child Nodes. Level 3 will display Assets as Parent with Current Assets and Non-Current Assets as Child Nodes."
    sql: parse_numeric(${level}) ;;
  }

  dimension: level_string {
    type: string
    label: "Level"
    description: "Level as a numeric. Level shows the Parent-Child Relationship. For example depending on the Hierarchy selected, Level 2 will display FPA1 as the Parent with Assets and Liabilities & Equity as Child Nodes. Level 3 will display Assets as Parent with Current Assets and Non-Current Assets as Child Nodes."
    sql: ltrim(${level},'0') ;;
  }

  dimension: is_leaf_node {
    description: "Yes if GL Account Number and indicates lowest level of hierarchy."
  }


# Fiscal Year and Period and other forms of Fiscal Dates
# {
  dimension: fiscal_period {
    group_label: "Fiscal Dates"
    description: "Fiscal Period as 3-character string (e.g., 001)"
  }

  dimension: fiscal_period_number {
    hidden: yes
    group_label: "Fiscal Dates"
    description: "Fiscal Period as a Numeric Value"
    type: number
    sql: parse_numeric(${fiscal_period}) ;;
    value_format_name: id
  }

  dimension: fiscal_quarter {
    group_label: "Fiscal Dates"
    description: "Fiscal Quarter value of 1, 2, 3, or 4"
  }

  dimension: fiscal_year {
    group_label: "Fiscal Dates"
    description: "Fiscal Year as YYYY"
  }

  dimension: fiscal_year_period_number {
    hidden: no
    type: number
    group_label: "Fiscal Dates"
    description: "Fiscal Year and Period as a Numeric Value in form of YYYYPPP"
    sql: parse_numeric(concat(${fiscal_year},${fiscal_period})) ;;
    value_format_name: id
  }

  # used in order_by_field to sort fiscal year period in descending order
  dimension: fiscal_year_period_negative_number {
    hidden: yes
    type: number
    sql: -1 * ${fiscal_year_period_number} ;;
  }

  dimension: fiscal_year_period {
    type: string
    group_label: "Fiscal Dates"
    description: "Fiscal Year and Period as String in form of YYYY.PPP"
    sql: concat(${fiscal_year},'.',${fiscal_period});;
    order_by_field: fiscal_year_period_negative_number
  }

  dimension: fiscal_year_quarter {
    type: string
    group_label: "Fiscal Dates"
    description: "Fiscal Year and Quater in form of YYYY.Q#"
    sql: concat(${fiscal_year},'.Q',${fiscal_quarter}) ;;
  }

  dimension: fiscal_year_number {
    hidden: yes
    group_label: "Fiscal Dates"
    description: "Fiscal Year as a Numeric Value"
    type: number
    sql: parse_numeric(${fiscal_year}) ;;
    value_format_name: id
  }

  # if select_fiscal_period parameter used in query, assign fiscal_year_period to either Reporting or Comparison group
  # comparison period derived based on select_comparison_type parameter:
  #     if yoy then subtract year from period
  #     if prior then subtract 1 from period (if period 001 then substract 1 year and use max_fiscal_period for period)
  #     if custom then use value from select_custom_comparison_period
  # see manifest for full logic defined in constant derive_comparison_period

  dimension: fiscal_period_group {
    type: string
    group_label: "Fiscal Dates"
    description: "Fiscal Period is labeled either Reporting or Comparison depending on the values user picks for Fiscal Period and Comparison Type."
    sql:    {% if select_fiscal_period._in_query %}
                @{derive_comparison_period}

      case  when ${fiscal_year_period} = '{{fp}}' then 'Reporting'
      {% if comparison_type != 'none' %}
      when ${fiscal_year_period} = '{{cp}}' then 'Comparison'
      {% endif %}
      end
      {% else %} 'No Fiscal Reporting Period has been selected. Add Select Fiscal Period parameter.'
      {% endif %}
      ;;
  }

  dimension: selected_fiscal_reporting_period {
    type: string
    group_label: "Fiscal Dates"
    description: "Fiscal Period chosen with parameter Select Fiscal Period"
    sql: '{% parameter select_fiscal_period %}';;
  }

  #} end Fiscal Dates

# Hidden dimensions including those restated as measures like Amounts and Exchange Rates
# {
  # hide client and define as client_mandt to match other SAP tables
  dimension: client {
    hidden: yes
  }

  dimension: amount_in_local_currency {
    hidden: yes
  }

  dimension: amount_in_target_currency {
    hidden: yes
    label: "Amount in Global Currency"
  }

  dimension: cumulative_amount_in_local_currency {
    hidden: yes
  }

  dimension: cumulative_amount_in_target_currency {
    hidden: yes
    label: "Cumulative Amount in Global Currency"
    description: "End of Period Cumulative Amount in Global/Target Currency"
  }

  dimension: exchange_rate {hidden: yes}
  dimension: avg_exchange_rate {hidden:yes}
  dimension: max_exchange_rate {hidden:yes}
#} end hidden dimensions

#} end Dimensions

#########################################################
# Measures
# {

  measure: count {hidden: yes}

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
    sql: safe_divide(${current_assets},${current_liabilities}) * -1;;
    value_format_name: decimal_2
  }

  measure: reporting_period_amount_in_global_currency {
    type: sum
    group_label: "Reporting v Comparison Period Metrics"
    label_from_parameter: select_fiscal_period
    description: "Cumulative Amount in Global Currency for the selected Fiscal Reporting Period"
    sql: ${cumulative_amount_in_target_currency} ;;
    filters: [fiscal_period_group: "Reporting"]
    value_format_name: millions_d1
    html: @{negative_format} ;;
  }

  # use sum(case ... when Comparison...) instead of type: sum with filter to allow nulls with Comparison is set to None
  measure: comparison_period_amount_in_global_currency {
    type: number
    group_label: "Reporting v Comparison Period Metrics"
    label: "{% if select_fiscal_period._in_query %}
            @{derive_comparison_period}{{cp}}
            {% else %} Comparison Period Amount in Global Currency
            {% endif %}"
    description: "Cumulative Amount in Global Currency for the selected Fiscal Comparison Period"
    sql: sum(case ${fiscal_period_group} when "Comparison" then ${cumulative_amount_in_target_currency} else null end) ;;
    value_format_name: millions_d1
    html: @{negative_format} ;;
  }

  measure: difference_value {
    type: number
    group_label: "Reporting v Comparison Period Metrics"
    label: "Gain (Loss)"
    description: "Reporting Period Amount minus Comparison Period Amount"
    sql: ${reporting_period_amount_in_global_currency} - ${comparison_period_amount_in_global_currency} ;;
    value_format_name: millions_d1
    html: @{negative_format} ;;
  }

  measure: difference_percent {
    type: number
    group_label: "Reporting v Comparison Period Metrics"
    label: "Var %"
    description: "Percentage Change between Reporting and Comparison Periods"
    sql: safe_divide( (${reporting_period_amount_in_global_currency} - ${comparison_period_amount_in_global_currency}),abs(${comparison_period_amount_in_global_currency})) ;;
    value_format_name: percent_1
    html: @{negative_format} ;;
  }

  # used in Balance Sheet dashboard; add to a single-value visualization
  measure: title_balance_sheet {
    type: number
    description: "Used in Balance Sheet dashboard as Summary visualization with Company, Global Currency, Fiscal Period and Current Ratio."
    sql: 1 ;;
    html:
      <div  style="font-size:100pct; background-color:rgb((169,169,169,.5); text-align:center;  line-height: .8; font-family:'Noto Sans SC'; font-color: #808080">
          <a style="font-size:100%;font-family:'verdana';color: black"><b>Balance Sheet</b></a><br>
          <a style= "font-size:80%;font-family:'verdana';color: black">{{company_text._value}}</a><br>
          <a style= "font-size:80%;font-family:'verdana';color: black">Fiscal Period:   {{select_fiscal_period._parameter_value}}&nbsp;&nbsp;&nbsp; Current Ratio: {{current_ratio._rendered_value}}</a>
          <br>
          <a style= "font-size: 70%; text-align:center;font-family:'verdana';color: black"> Amounts in Millions  {{target_currency_tcurr}} </a>
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

  measure: max_fiscal_year_period {
    type: max
    sql: ${fiscal_year_period_number} ;;
    value_format_name: id
  }


  #} end measures

}
