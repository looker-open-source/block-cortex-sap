view: days_payable_outstanding_v2 {
  derived_table: {
    sql: select * from `@{GCP_PROJECT}.@{REPORTING_DATASET}.DaysPayableOutstanding`
      ;;
  }

  fields_hidden_by_default: yes

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${company_code_bukrs},${fiscal_year},${fiscal_period},${target_currency_tcurr});;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: company_code_bukrs {
    type: string
    sql: ${TABLE}.CompanyCode_BUKRS ;;
    hidden: no
  }

  dimension: company_text_butxt {
    type: string
    sql: ${TABLE}.CompanyText_BUTXT ;;
    hidden: no
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.FiscalYear ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.FiscalPeriod ;;
  }

  dimension: fiscal_period_to_date {
    sql: DATE(CAST(${fiscal_year} AS INT64),CAST(${fiscal_period} AS INT64),01) ;;
  }

  dimension_group: fiscal_date {
    type: time
    datatype: date
    timeframes: [month, year]
    sql: ${fiscal_period_to_date} ;;
    convert_tz: no
    hidden: no
  }

  dimension: target_currency_tcurr {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
    hidden: no
  }

  dimension: period_apin_source_currency {
    type: number
    sql: ${TABLE}.PeriodAPInSourceCurrency ;;
  }

  dimension: period_apin_target_currency {
    type: number
    sql: ${TABLE}.PeriodAPInTargetCurrency ;;
  }

  dimension: cogsin_source_currency {
    type: number
    sql: ${TABLE}.COGSInSourceCurrency ;;
  }

  dimension: cogsin_target_currency {
    type: number
    sql: ${TABLE}.COGSInTargetCurrency ;;
  }

  dimension: number_of_days {
    type: number
    sql: ${TABLE}.NumberOfDays ;;
  }

  dimension: days_payable_outstanding_in_source_currency {
    type: number
    sql: ${TABLE}.DaysPayableOutstandingInSourceCurrency ;;
  }

  dimension: days_payable_outstanding_in_target_currency {
    type: number
    sql: ${TABLE}.DaysPayableOutstandingInTargetCurrency * -1 ;;
  }

  measure: sum_days_payable_outstanding {
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${days_payable_outstanding_in_target_currency} ;;
    hidden: no
  }

  set: detail {
    fields: [
      client_mandt,
      company_code_bukrs,
      company_text_butxt,
      fiscal_year,
      fiscal_period,
      target_currency_tcurr,
      period_apin_source_currency,
      period_apin_target_currency,
      cogsin_source_currency,
      cogsin_target_currency,
      number_of_days,
      days_payable_outstanding_in_source_currency,
      days_payable_outstanding_in_target_currency
    ]
  }
}
