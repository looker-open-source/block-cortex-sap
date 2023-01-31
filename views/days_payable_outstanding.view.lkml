view: days_payable_outstanding {
  derived_table: {
    sql: SELECT * FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.DaysPayablesOutstanding`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client_mandt {
    type: string
    primary_key: yes
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: company_code_bukrs {
    type: string
    sql: ${TABLE}.CompanyCode_BUKRS ;;
  }

  dimension: company_text_butxt {
    type: string
    sql: ${TABLE}.CompanyText_BUTXT ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.FiscalYear ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.FiscalPeriod ;;
    hidden: no
  }

  dimension: Month_Year {
    type: string
    sql: concat(${fiscal_year},"/",${fiscal_period}) ;;
  }

  dimension: period_ap {
    type: number
    sql: ${TABLE}.PeriodAP ;;
  }

  dimension: cogs {
    type: number
    sql: ${TABLE}.COGS ;;
  }

  dimension: days_payable_outstanding {
    type: number
    sql: abs(${TABLE}.DaysPayableOutstanding) ;;
  }

  measure: sum_days_payable_outstanding {
    type: sum
    sql: abs(${days_payable_outstanding}) ;;
    value_format: "0.0"
  }

  set: detail {
    fields: [
      client_mandt,
      company_code_bukrs,
      company_text_butxt,
      fiscal_year,
      fiscal_period,
      period_ap,
      cogs,
      days_payable_outstanding
    ]
  }
}
