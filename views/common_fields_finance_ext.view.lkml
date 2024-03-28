#########################################################{
# PURPOSE
# Defines dimensions and parameters to be EXTENDED into:
#   balance_sheet_rfn
#   profit_and_loss_rfn
# The properties from this view are used and customized by extending views.
#
# SOURCE
#   none. The ${TABLE} property uses the table definition of the extending view
#
# EXTENDABLE FIELDS
#   client_mandt
#   language_key_spras
#   currency_key
#   target_currency_tcurr
#   ledger_in_general_ledger_accounting
#   company_code
#   company_text
#   business_area
#   chart_of_accounts
#   fiscal_period, fiscal_period_number, fiscal_year_period, fiscal_year_period_number, fiscal_year_period_negative_number
#   fiscal_quarter, fiscal_quarter_label, fiscal_year_quarter_label, fiscal_year_quarter_negative_number
#   fiscal_year, fiscal_year_number, fiscal_year_negative_number
#
#   hidden dimensions: client, exchange_rate, avg_exchange_rate, amount_in_local_currency, amount_in_target_currency, amount_in_target_currency
#                     cumulative_amount_in_target_currency, cumulative_amount_in_target_currency
#########################################################}


view: common_fields_finance_ext {
  extension: required

  dimension: client_mandt {
    type: string
    hidden: yes
    label: "Client"
    description: "Client MANDT"
    sql: ${TABLE}.Client ;;
  }

  dimension: language_key_spras {
    label: "Language Key"
    description: "Language used for text display of Company, Parent and/or Child Node. Automatically filters to user's locale user attribute value."
  }

  dimension: currency_key {
    label: "Currency (Local)"
    description: "Local Currency"
  }

  dimension: target_currency_tcurr {
    label: "Currency (Global)"
    description: "Target or Global Currency to display"
  }

  dimension: ledger_in_general_ledger_accounting {
    label: "Ledger"
    description: "Ledger in General Ledger Accounting as ID or Code"
    sql: COALESCE(${TABLE}.LedgerInGeneralLedgerAccounting,'0L') ;;
  }

  dimension: company_code {
    label: "Company Code"
    description: "Company Code"
  }

  dimension: company_text {
    label: "Company Code Text"
    description: "Company Name"
  }

  dimension: business_area {
    description: "Business Area"
    sql: COALESCE(${TABLE}.BusinessArea,'N/A') ;;
  }

  dimension: chart_of_accounts {
    description: "Chart of Accounts"
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
    sql: PARSE_NUMERIC(${fiscal_period}) ;;
    value_format_name: id
  }

  dimension: fiscal_year_period {
    type: string
    group_label: "Fiscal Dates"
    description: "Fiscal Year and Period as String in form of YYYY.PPP"
    sql: CONCAT(${fiscal_year},'.',${fiscal_period});;
    order_by_field: fiscal_year_period_negative_number
  }

  dimension: fiscal_year_period_number {
    hidden: yes
    type: number
    label: "Fiscal Year Period (number)"
    group_label: "Fiscal Dates"
    description: "Fiscal Year and Period as a Numeric Value in form of YYYYPPP"
    sql: PARSE_NUMERIC(CONCAT(${fiscal_year},${fiscal_period})) ;;
    value_format_name: id
  }

  dimension: fiscal_year_period_negative_number {
    hidden: yes
    type: number
    sql: -1 * ${fiscal_year_period_number} ;;
  }

  dimension: fiscal_quarter {
    type: number
    hidden: yes
    label: "Fiscal Quarter (number)"
    group_label: "Fiscal Dates"
    description: "Fiscal Quarter value of 1, 2, 3, or 4"
    sql: PARSE_NUMERIC(${TABLE}.FiscalQuarter) ;;
  }

  dimension: fiscal_quarter_label {
    group_label: "Fiscal Dates"
    label: "Fiscal Quarter"
    description: "Fiscal Quarter value of Q1, Q2, Q3, or Q4"
    sql: CONCAT('Q',${TABLE}.FiscalQuarter);;
  }

  dimension: fiscal_year_quarter_label {
    group_label: "Fiscal Dates"
    label: "Fiscal Year Quarter"
    description: "Fiscal Quarter value with year in format YYYY.Q#"
    sql: CONCAT(${fiscal_year},'.Q',${fiscal_quarter}) ;;
  }

  dimension: fiscal_year_quarter_negative_number {
    hidden: yes
    type: number
    sql: -1 * PARSE_NUMERIC(CONCAT(${fiscal_year},${fiscal_quarter})) ;;
  }

  dimension: fiscal_year {
    group_label: "Fiscal Dates"
    description: "Fiscal Year as YYYY"
  }

  dimension: fiscal_year_number {
    hidden: yes
    group_label: "Fiscal Dates"
    label: "Fiscal Year (number)"
    description: "Fiscal Year as a Numeric Value"
    type: number
    sql: PARSE_NUMERIC(${fiscal_year}) ;;
    value_format_name: id
  }

  dimension: fiscal_year_negative_number {
    hidden: yes
    type: number
    sql: -1 * PARSE_NUMERIC(${fiscal_year}) ;;
  }

#} end fiscal period

# Hidden dimensions that are restated as measures; Amounts and Exchange Rates
# {
  # hide client and define as client_mandt to match other SAP tables
  dimension: client {hidden: yes}
  dimension: exchange_rate {hidden: yes}
  dimension: avg_exchange_rate {hidden:yes}
  dimension: max_exchange_rate {hidden:yes}
  dimension: amount_in_local_currency {hidden: yes}
  dimension: amount_in_target_currency {hidden: yes}
  dimension: cumulative_amount_in_local_currency {hidden: yes}
  dimension: cumulative_amount_in_target_currency {hidden: yes}

  #} end hidden dimensions

}
