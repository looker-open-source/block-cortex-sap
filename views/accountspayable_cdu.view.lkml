view: accountspayable_cdu {

    sql_table_name:  `@{GCP_PROJECT}.@{REPORTING_DATASET}.CashDiscountUtilization` ;;
    fields_hidden_by_default: yes


  measure: count {
    type: count
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

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR * (-1);;
  }

  dimension: amount_in_local_currency_dmbtr_conv {
    type: number
    sql: (${TABLE}.AmountInLocalCurrency_DMBTR * (-1)) * ${currency_conversion_new.ukurs};;
  }


  dimension: accounting_document_number_belnr {
    type: string
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
  }

  dimension: number_of_line_item_within_accounting_document_buzei {
    type: string
    sql: ${TABLE}.NumberOfLineItemWithinAccountingDocument_BUZEI ;;
  }

  dimension: document_number_of_the_clearing_document_augbl {
    type: string
    sql: ${TABLE}.DocumentNumberOfTheClearingDocument_AUGBL ;;
  }

  dimension: terms_of_payment_key_zterm {
    type: string
    sql: ${TABLE}.TermsOfPaymentKey_ZTERM ;;
  }

  dimension: account_type_koart {
    type: string
    sql: ${TABLE}.AccountType_KOART ;;
  }

  dimension: reason_code_for_payments_rstgr {
    type: string
    sql: ${TABLE}.ReasonCodeForPayments_RSTGR ;;
  }

  dimension: payment_block_key_zlspr {
    type: string
    sql: ${TABLE}.PaymentBlockKey_ZLSPR ;;
  }

  dimension: clearing_date_augdt {
    type: date
    datatype: date
    sql: ${TABLE}.ClearingDate_AUGDT ;;
  }


  dimension_group: Key_Date {
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
    hidden: no
  }

  dimension_group: posting_date_in_the_document_budat {
    type: time
    timeframes: [
      date,
      month,
      year,
      raw
    ]
    datatype: date
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
    convert_tz: no
    hidden: no
  }

  dimension: fiscal_year_gjahr {
    type: string
    sql: ${TABLE}.FiscalYear_GJAHR ;;
  }

  dimension: fiscal_period_monat {
    type: string
    sql: ${TABLE}.FiscalPeriod_MONAT ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: previous_period {
    type: string
    sql: ${TABLE}.PreviousPeriod ;;
  }

  dimension: net_due_date {
    type: date
    datatype: date
    sql: ${TABLE}.NetDueDate ;;
  }

  dimension: inv_status_rbstat {
    type: string
    sql: ${TABLE}.InvStatus_RBSTAT ;;
  }

  dimension: posting_date_budat {
    type: date
    datatype: date
    sql: ${TABLE}.PostingDate_BUDAT ;;
  }

  dimension: purchasing_document_number_ebeln {
    type: string
    sql: ${TABLE}.PurchasingDocumentNumber_EBELN ;;
  }

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: supplying_country_landl {
    type: string
    sql: ${TABLE}.SupplyingCountry_LANDL ;;
  }

  dimension: documenttype_blart {
    type: string
    sql: ${TABLE}.Documenttype_BLART ;;
  }

  dimension: overdue_amount {
    type: number
    sql: ${TABLE}.OverdueAmount ;;
  }

  dimension: outstanding_but_not_overdue {
    type: number
    sql: ${TABLE}.OutstandingButNotOverdue ;;
  }

  dimension: overdue_on_past_due_date {
    type: number
    sql: ${TABLE}.OverdueOnPastDueDate ;;
  }

  dimension: partial_payments {
    type: number
    sql: ${TABLE}.PartialPayments ;;
  }

  dimension: late_payments {
    type: number
    sql: ${TABLE}.LatePayments ;;
  }

  dimension: upcoming_payments {
    type: number
    sql: ${TABLE}.UpcomingPayments ;;
  }

  dimension: potential_penalty {
    type: number
    sql: ${TABLE}.PotentialPenalty ;;
  }

  dimension: total_purchases {
    type: number
    sql: ${TABLE}.TotalPurchases ;;
  }

  dimension: accounts_payable_turnover {
    type: number
    sql: ${TABLE}.AccountsPayableTurnover ;;
  }

  dimension: is_parked_invoice {
    type: yesno
    sql: ${TABLE}.IsParkedInvoice ;;
  }

  dimension: is_blocked_invoice {
    type: yesno
    sql: ${TABLE}.IsBlockedInvoice ;;
  }

  dimension: cash_discount_received {
    type: number
    sql: ${TABLE}.CashDiscountReceived ;;
    hidden: no
  }

  dimension: cash_discount_received_conv {
    type: number
    sql: ${TABLE}.CashDiscountReceived * ${currency_conversion_new.ukurs} ;;
  }

  dimension: target_cash_discount {
    type: number
    sql: ${TABLE}.TargetCashDiscount ;;
    hidden: no
  }

  dimension: target_cash_discount_conv {
    type: number
    sql: ${TABLE}.TargetCashDiscount * ${currency_conversion_new.ukurs} ;;
  }

  dimension: amount_of_open_debit_items {
    type: number
    sql: ${TABLE}.AmountOfOpenDebitItems ;;
  }

  dimension: amount_of_return {
    type: number
    sql: ${TABLE}.AmountOfReturn ;;
  }

  measure: Cash_Discount_Utilization {
    type:  sum_distinct
    sql_distinct_key: ${Key_Date_month} ;;
    sql: NULLIF(NULLIF(${cash_discount_received},0)/NULLIF(${target_cash_discount},0),0) ;;
    value_format: "0.0\%"
    hidden: no
  }


  measure: Cash_Discount_Utilization_1 {
    type:  sum
    sql: NULLIF(NULLIF(${cash_discount_received},0)/NULLIF(${target_cash_discount},0),0) ;;
    value_format: "0.00%"
  }
}
