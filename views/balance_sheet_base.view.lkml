view: balance_sheet {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.BalanceSheet` ;;

  dimension: amount_in_local_currency {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency ;;
  }
  dimension: amount_in_target_currency {
    type: number
    sql: ${TABLE}.AmountInTargetCurrency ;;
  }
  dimension: avg_exchange_rate {
    type: number
    sql: ${TABLE}.AvgExchangeRate ;;
  }
  dimension: business_area {
    type: string
    sql: ${TABLE}.BusinessArea ;;
  }
  dimension: chart_of_accounts {
    type: string
    sql: ${TABLE}.ChartOfAccounts ;;
  }
  dimension: client {
    type: string
    sql: ${TABLE}.Client ;;
  }
  dimension: company_code {
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }
  dimension: company_text {
    type: string
    sql: ${TABLE}.CompanyText ;;
  }
  dimension: cumulative_amount_in_local_currency {
    type: number
    sql: ${TABLE}.CumulativeAmountInLocalCurrency ;;
  }
  dimension: cumulative_amount_in_target_currency {
    type: number
    sql: ${TABLE}.CumulativeAmountInTargetCurrency ;;
  }
  dimension: currency_key {
    type: string
    sql: ${TABLE}.CurrencyKey ;;
  }
  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.ExchangeRate ;;
  }
  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.FiscalPeriod ;;
  }
  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.FiscalQuarter ;;
  }
  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.FiscalYear ;;
  }
  dimension: hierarchy_name {
    type: string
    sql: ${TABLE}.HierarchyName ;;
  }
  dimension: is_leaf_node {
    type: yesno
    sql: ${TABLE}.IsLeafNode ;;
  }
  dimension: language_key_spras {
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
  }
  dimension: ledger_in_general_ledger_accounting {
    type: string
    sql: ${TABLE}.LedgerInGeneralLedgerAccounting ;;
  }
  dimension: level {
    type: string
    sql: ${TABLE}.Level ;;
  }
  dimension: max_exchange_rate {
    type: number
    sql: ${TABLE}.MaxExchangeRate ;;
  }
  dimension: node {
    type: string
    sql: ${TABLE}.Node ;;
  }
  dimension: node_text {
    type: string
    sql: ${TABLE}.NodeText ;;
  }
  dimension: parent {
    type: string
    sql: ${TABLE}.Parent ;;
  }
  dimension: parent_text {
    type: string
    sql: ${TABLE}.ParentText ;;
  }
  dimension: target_currency_tcurr {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
  }
  measure: count {
    type: count
    drill_fields: [hierarchy_name]
  }
}
