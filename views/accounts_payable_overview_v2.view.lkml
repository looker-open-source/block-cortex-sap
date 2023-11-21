# The name of this view in Looker is "Accounts Payable Overview"
view: accounts_payable_overview_v2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.AccountsPayableOverview`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account Number of Vendor or Creditor Lifnr" in Explore.

  dimension: account_number_of_vendor_or_creditor_lifnr {
    type: string
    sql: ${TABLE}.AccountNumberOfVendorOrCreditor_LIFNR ;;
  }

  dimension: accounting_document_number_belnr {
    type: string
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
  }

  dimension: target_currency_tcurr {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
  }

  dimension: accounts_payable_turnover_in_source_currency {
    type: number
    sql: ${TABLE}.AccountsPayableTurnoverInSourceCurrency ;;
  }

  dimension: accounts_payable_turnover_in_target_currency {
    type: number
    sql: ${TABLE}.AccountsPayableTurnoverInTargetCurrency ;;
  }

  dimension: blocked_invoice_amount {
    type: number
    sql: ${TABLE}.BlockedInvoiceAmount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_blocked_invoice_amount {
    type: sum
    sql: ${blocked_invoice_amount} ;;
  }

  measure: average_blocked_invoice_amount {
    type: average
    sql: ${blocked_invoice_amount} ;;
  }

  dimension: cash_discount_received_in_source_currency {
    type: number
    sql: ${TABLE}.CashDiscountReceivedInSourceCurrency ;;
  }

  dimension: cash_discount_received_in_target_currency {
    type: number
    sql: ${TABLE}.CashDiscountReceivedInTargetCurrency ;;
  }

  dimension: cash_discount_utilization_in_source_currency {
    type: number
    sql: ${TABLE}.CashDiscountUtilizationInSourceCurrency ;;
  }

  dimension: cash_discount_utilization_in_target_currency {
    type: number
    sql: ${TABLE}.CashDiscountUtilizationInTargetCurrency ;;
  }

  measure: Cash_Discount_Utilization {
    type:  average
    sql_distinct_key: ${clearing_date_augdt_date} ;;
    sql: NULLIF(NULLIF(${cash_discount_received_in_target_currency},0)/NULLIF(${target_cash_discount_in_target_currency},0),0) ;;
    value_format: "0.00\%"
    hidden: no
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: clearing_date_augdt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ClearingDate_AUGDT ;;
  }

  dimension_group: posting_date_in_the_document_budat_month {
    type: time
    timeframes: [
      month,
      raw
    ]
    datatype: date
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
    convert_tz: no
    hidden: no
    drill_fields: []
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
    sql: ${TABLE}.CompanyText_BUTXT ;;
  }

  dimension: count_blocked_invoice {
    type: number
    sql: ${TABLE}.CountBlockedInvoice ;;
  }

  dimension: count_parked_invoice {
    type: number
    sql: ${TABLE}.CountParkedInvoice ;;
  }

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: doc_fisc_period {
    type: string
    sql: ${TABLE}.DocFiscPeriod ;;
  }

  dimension: late_payments_in_source_currency {
    type: number
    sql: ${TABLE}.LatePaymentsInSourceCurrency ;;
  }

  dimension: late_payments_in_target_currency {
    type: number
    sql: ${TABLE}.LatePaymentsInTargetCurrency ;;
  }

  dimension: month_of_posting_date_in_the_document_budat {
    type: number
    sql: ${TABLE}.MonthOfPostingDateInTheDocument_BUDAT ;;
  }

  dimension: name1 {
    type: string
    sql: ${TABLE}.Name1 ;;
  }

  dimension: overdue_amount_in_source_currency {
    type: number
    sql: ${TABLE}.OverdueAmountInSourceCurrency ;;
  }

  dimension: overdue_amount_in_target_currency {
    type: number
    sql: ${TABLE}.OverdueAmountInTargetCurrency ;;
  }

  dimension: parked_invoice_amount {
    type: number
    sql: ${TABLE}.ParkedInvoiceAmount ;;
  }

  dimension: past_due_amount_in_source_currency {
    type: number
    sql: ${TABLE}.PastDueAmountInSourceCurrency ;;
  }

  dimension: past_due_amount_in_target_currency {
    type: number
    sql: ${TABLE}.PastDueAmountInTargetCurrency ;;
  }

  dimension_group: posting_date_in_the_document_budat {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
  }

  dimension: potential_penalty_in_source_currency {
    type: number
    sql: ${TABLE}.PotentialPenaltyInSourceCurrency ;;
  }

  dimension: potential_penalty_in_target_currency {
    type: number
    sql: ${TABLE}.PotentialPenaltyInTargetCurrency ;;
  }

  dimension: quarter_of_posting_date_in_the_document_budat {
    type: number
    sql: ${TABLE}.QuarterOfPostingDateInTheDocument_BUDAT ;;
  }

  dimension: target_cash_discount_in_source_currency {
    type: number
    sql: ${TABLE}.TargetCashDiscountInSourceCurrency ;;
  }

  dimension: target_cash_discount_in_target_currency {
    type: number
    sql: ${TABLE}.TargetCashDiscountInTargetCurrency ;;
  }

  dimension: total_due_amount_in_source_currency {
    type: number
    sql: ${TABLE}.TotalDueAmountInSourceCurrency ;;
  }

  dimension: total_due_amount_in_target_currency {
    type: number
    sql: ${TABLE}.TotalDueAmountInTargetCurrency ;;
  }

  dimension: upcoming_payments_in_source_currency {
    type: number
    sql: ${TABLE}.UpcomingPaymentsInSourceCurrency ;;
  }

  dimension: upcoming_payments_in_target_currency {
    type: number
    sql: ${TABLE}.UpcomingPaymentsInTargetCurrency ;;
  }

  dimension: week_of_posting_date_in_the_document_budat {
    type: number
    sql: ${TABLE}.WeekOfPostingDateInTheDocument_BUDAT ;;
  }

  dimension: year_of_posting_date_in_the_document_budat {
    type: number
    sql: ${TABLE}.YearOfPostingDateInTheDocument_BUDAT ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
