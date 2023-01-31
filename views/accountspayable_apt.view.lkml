view: accountspayable_apt {

    sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.AccountsPayableTurnover`;;
    fields_hidden_by_default: yes


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
    sql: ${TABLE}.CompanyText_BUTXT;;
    hidden: no
  }

  dimension: account_number_vendoror_creditor_lifnr {
    type: string
    sql: ${TABLE}.AccountNumberOfVendorOrCreditor_LIFNR ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.NAME1 ;;
    hidden: no
  }

  dimension: accounting_document_number_belnr {
    type: number
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
  }

  dimension: number_of_line_item_in_accounting_document_buzei{
    type: number
    sql: ${TABLE}.NumberOfLineItemWithinAccountingDocument_BUZEI ;;
  }

  dimension: posting_date_in_the_document_budat {
    type: date
    datatype: date
    primary_key: yes
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
  }

  dimension_group: posting_month_in_the_document_budat{
    type: time
    timeframes:[
      raw,
      date,
      week,
      month,
      quarter,
      year
   ]
    datatype: date
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
  }


  dimension: accounting_document_type_blart {
    type: string
    sql: ${TABLE}.AccountingDocumenttype_BLART ;;
  }

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR *-1 ;;
  }

  dimension: amount_in_glob_curr {
    type: number
    sql: ${amount_in_local_currency_dmbtr} * ${currency_conversion_new.ukurs} ;;
  }

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: doc_fiscal_period {
    type: string
    sql: ${TABLE}.DocFiscPeriod ;;
    hidden: yes
  }

  dimension: fiscal_period {
    type: string
    sql: concat(LEFT(${doc_fiscal_period},4),"/",RIGHT(${doc_fiscal_period},2)) ;;
    hidden: no
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: total_purchases {
    type: number
    sql: ${TABLE}.TotalPurchases ;;
  }

  dimension: total_purchases_glob_curr {
    type: number
    sql: ${total_purchases} * ${currency_conversion_new.ukurs};;
  }

  dimension: period_ap {
    type: number
    sql: ${TABLE}.PeriodAP ;;
  }

  dimension: opening_ap {
    type: number
    sql: ${TABLE}.OpeningAP ;;
  }

  dimension: closing_ap {
    type: number
    sql: ${TABLE}.ClosingAP ;;
  }

  dimension: accounts_payable_turnover {
    type: number
    sql: COALESCE(${TABLE}.AccountsPayableTurnover *-1,0);;
    value_format: "0.0"
    hidden: no
   }

  measure: turnover {
    type: sum_distinct
    sql: ${accounts_payable_turnover} ;;
    sql_distinct_key: ${doc_fiscal_period} ;;
    hidden: no
  }


  set: detail {
    fields: [
      client_mandt,
      company_code_bukrs,
      period,
      total_purchases,
      period_ap,
      opening_ap,
      closing_ap,
      accounts_payable_turnover
    ]
  }
}
