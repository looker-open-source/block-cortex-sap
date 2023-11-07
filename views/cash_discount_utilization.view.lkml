view: cash_discount_utilization {
  derived_table: {
    sql: select * from `@{GCP_PROJECT}.@{REPORTING_DATASET}.CashDiscountUtilization`
      ;;
  }

  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${accounting_document_number_belnr},${company_code_bukrs},${target_currency_tcurr});;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: company_code_bukrs {
    type: string
    sql: ${TABLE}.CompanyCode_BUKRS ;;
  }

  dimension: company_text_butxt {
    type: string
    label: "Company Name"
    sql: ${TABLE}.CompanyText_BUTXT ;;
    hidden: no
  }

  dimension: account_number_of_vendor_or_creditor_lifnr {
    type: string
    sql: ${TABLE}.AccountNumberOfVendorOrCreditor_LIFNR ;;
  }

  dimension: name1 {
    type: string
    sql: ${TABLE}.NAME1 ;;
    hidden: no
  }

  dimension: accounting_document_number_belnr {
    type: string
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
  }

  dimension: target_currency_tcurr {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
    hidden: no
  }

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR ;;
  }

  dimension: clearing_date_augdt {
    type: date
    datatype: date
    convert_tz: no
    sql: ${TABLE}.ClearingDate_AUGDT ;;
    hidden: no
  }

  dimension: document_number_of_the_clearing_document_augbl {
    type: string
    sql: ${TABLE}.DocumentNumberOfTheClearingDocument_AUGBL ;;
  }

  dimension_group: posting_date_in_the_document_budat {
    type: time
    timeframes: [
      month,
      raw
    ]
    datatype: date
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
    hidden: no
    convert_tz: no
    drill_fields: []
  }

  dimension: cash_discount_received_in_source_currency {
    type: number
    sql: ${TABLE}.CashDiscountReceivedInSourceCurrency ;;
  }

  dimension: cash_discount_received_in_target_currency {
    type: number
    sql: ${TABLE}.CashDiscountReceivedInTargetCurrency ;;
    hidden: no
  }

  dimension: target_cash_discount_in_source_currency {
    type: number
    sql: ${TABLE}.TargetCashDiscountInSourceCurrency ;;
  }

  dimension: target_cash_discount_in_target_currency {
    type: number
    sql: ${TABLE}.TargetCashDiscountInTargetCurrency ;;
    hidden: no
  }

  measure: Cash_Discount_Utilization {
    type:  average
    sql_distinct_key: ${clearing_date_augdt} ;;
    sql: ${cash_discount_received_in_target_currency}/NULLIF(${target_cash_discount_in_target_currency},0) ;;
    value_format: "0.00\%"
    hidden: no
  }

  set: detail {
    fields: [
      client_mandt,
      company_code_bukrs,
      company_text_butxt,
      account_number_of_vendor_or_creditor_lifnr,
      name1,
      accounting_document_number_belnr,
      target_currency_tcurr,
      currency_key_waers,
      amount_in_local_currency_dmbtr,
      clearing_date_augdt,
      document_number_of_the_clearing_document_augbl,
      posting_date_in_the_document_budat_month,
      cash_discount_received_in_source_currency,
      cash_discount_received_in_target_currency,
      target_cash_discount_in_source_currency,
      target_cash_discount_in_target_currency
    ]
  }
}
