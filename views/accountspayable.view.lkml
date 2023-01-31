view: accountspayable {

    sql_table_name:  `@{GCP_PROJECT}.@{REPORTING_DATASET}.AccountsPayable`;;
    fields_hidden_by_default: yes

  parameter: Aging_Interval {
    type: number
    default_value: "30"
    hidden: no
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension : Current_date{
    type: date
    sql: now() ;;
  }

  dimension_group: System_date {
    type: time
    sql: ${Fiscal_date} ;;
  }

  dimension: client_mandt {
    type: string
    primary_key: yes
    sql: ${TABLE}.Client_MANDT ;;
    hidden: no
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

  dimension: account_number_of_vendor_or_creditor_lifnr {
    type: string
    sql: ${TABLE}.AccountNumberOfVendorOrCreditor_LIFNR ;;
    hidden: no
  }

  dimension: name1 {
    type: string
    sql: ${TABLE}.NAME1 ;;
    hidden: no
  }

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: abs(${TABLE}.AmountInLocalCurrency_DMBTR);;
  }

  dimension: amount_in_glob_curr {
    type: number
    sql: ${amount_in_local_currency_dmbtr}*${currency_conversion_new.ukurs};;
  }

  dimension: accounting_document_number_belnr {
    type: string
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
    hidden: no
  }

  dimension: number_of_line_item_within_accounting_document_buzei {
    type: string
    sql: ${TABLE}.NumberOfLineItemWithinAccountingDocument_BUZEI ;;
    hidden: no
  }

  dimension: document_number_of_the_clearing_document_augbl {
    type: string
    sql: ${TABLE}.DocumentNumberOfTheClearingDocument_AUGBL ;;
  }
  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }
  dimension: terms_of_payment_key_zterm {
    type: string
    sql: ${TABLE}.TermsOfPaymentKey_ZTERM ;;
  }

  dimension: account_type_koart {
    type: string
    sql: ${TABLE}.AccountType_KOART ;;
  }

  dimension: account_document_type {
    type: string
    sql: ${TABLE}. AccountingDocumenttype_BLART;;
  }

  dimension: invoice_document_type {
    type: string
    sql: ${TABLE}. InvoiceDocumenttype_BLART;;
  }

  dimension: no_of_days_late {
    type: string
    sql: date_diff(cast(${Key_Date_date} AS Date) ,${net_due_date},Day) ;;
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

  dimension: key_date_1 {
    type: date
    sql: ${Key_Date_date} ;;
  }

  dimension: posting_date_in_the_document_budat {
    type: date
    datatype: date
    primary_key: yes
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
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


  dimension: Fiscal_date {
    type: string
    sql:CONCAT(${TABLE}.FiscalPeriod_MONAT ,"-",${TABLE}.FiscalYear_GJAHR );;
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

  measure: payment_block_amount {
    type: number
    sql: if(${payment_block_key_zlspr} = "A",(${amount_in_local_currency_dmbtr}), ${amount_in_local_currency_dmbtr});;
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

  dimension: overdue_amount {
    type: number
    sql: abs(${TABLE}.OverdueAmount) ;;
    hidden: no
  }

  dimension: overdue_amount_conv {
    type: number
    sql: abs((${TABLE}.OverdueAmount)) * ${currency_conversion_new.ukurs} ;;
    hidden: no
  }

  dimension: debit_credit_indicator_shkzg  {
    type: string
    sql: ${TABLE}.DebitcreditIndicator_SHKZG ;;
  }

  dimension: outstanding_but_not_overdue {
    type: number
    sql: abs(${TABLE}.OutstandingButNotOverdue) ;;
    hidden: no
  }

  dimension: outstanding_but_not_overdue_glob_curr {
    type: number
    sql: ${outstanding_but_not_overdue} * ${currency_conversion_new.ukurs} ;;
    hidden: no
  }

  measure: outstanding_but_not_overdue_1  {
    type: sum
    sql: ${outstanding_but_not_overdue} ;;
  }

  measure: outstanding_but_not_overdue_1_conv_drill  {
    type: sum
    sql: ${outstanding_but_not_overdue_glob_curr} ;;
    hidden: no
  }

  measure: payments {
    type: sum
    sql: ${potential_penalty}+${amount_of_open_debit_items}+${late_payments}+${upcoming_payments} ;;
  }

  dimension: overdue_on_past_due_date {
    type: number
    sql: abs(${TABLE}.OverdueOnPastDate);;
  }

  dimension: overdue_on_past_due_date_conv {
    type: number
    sql: (${TABLE}.OverdueOnPastDate) * ${currency_conversion_new.ukurs};;
  }

  dimension: partial_payments {
    type: number
    sql: ${TABLE}.PartialPayments ;;
  }

  dimension: partial_payments_glob_curr {
    type: number
    sql: ${partial_payments} * ${currency_conversion_new.ukurs} ;;
  }

  dimension: late_payments {
    type: number
    sql: abs(${TABLE}.LatePayments);;
    hidden: no
  }

  measure: Sum_late_payments {
    type: sum
    sql: ${late_payments}  ;;
    value_format: "0.00"
  }

  measure: sum_late_payments_conv_drill {
    type: sum
    sql: ${late_payments} * ${currency_conversion_new.ukurs} ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_late_payments_conv {
    type: sum
    sql: ${late_payments} * ${currency_conversion_new.ukurs} ;;
    value_format_name: Greek_Number_Format
  }

  dimension: upcoming_payments {
    type: number
    sql: abs(${TABLE}.UpcomingPayments) ;;
    hidden: no
  }

  measure: sum_upcoming_payments {
    type: sum
     sql: ${upcoming_payments} ;;
     value_format: "0.00"
  }

  measure: sum_upcoming_payments_conv_drill {
    type: sum
    sql: ${upcoming_payments} * ${currency_conversion_new.ukurs} ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_upcoming_payments_conv {
    type: sum
    sql: ${upcoming_payments} * ${currency_conversion_new.ukurs} ;;
    value_format_name: Greek_Number_Format
  }

  dimension: potential_penalty {
    type: number
    sql: abs(${TABLE}.PotentialPenalty) ;;
    hidden: no
 }

  measure: sum_potential_penalty_payments {
    type: sum
    sql: ${potential_penalty} ;;
    value_format: "0.00"
  }

  measure: sum_potential_penalty_payments_conv_drill {
    type: sum
    sql: ${potential_penalty} * ${currency_conversion_new.ukurs};;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_potential_penalty_payments_conv {
    type: sum
    sql: ${potential_penalty} * ${currency_conversion_new.ukurs};;
    value_format_name: Greek_Number_Format
  }

  dimension: total_purchases {
    type: number
    sql: ${TABLE}.TotalPurchases ;;
  }

  dimension: accounts_payable_turnover {
    type: number
    sql: abs(${TABLE}.AccountsPayableTurnover);;
  }


  measure: turnover {
    type: max
    sql: ${accounts_payable_turnover}  ;;
    required_fields: [accounts_payable_turnover]
  }


  measure: sum_overdue_amount  {
    type: sum
    sql:  abs(${overdue_amount} + ${outstanding_but_not_overdue}) ;;
    value_format: "0.00"
 }

  measure: sum_overdue_amount_conv_drill  {
    type: sum
    sql:  (${overdue_amount} * ${currency_conversion_new.ukurs}) + (${outstanding_but_not_overdue} * ${currency_conversion_new.ukurs}) ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }


  measure: sum_overdue_amount_3  {
    type: sum
    sql:  abs(${TABLE}.OverdueAmount);;
    value_format: "0.00"
  }

  measure: sum_overdue_amount_3_conv_drill  {
    type: sum
    sql:  ${overdue_amount_conv};;
    value_format_name: Greek_Number_Format
  }

  measure: sum_overdue_amount_1  {
    type: sum
    sql:  abs(${TABLE}.OverdueAmount) ;;
    value_format: "0.00"
  }

  measure: sum_overdue_amount_1_conv_drill  {
    type: sum
    sql:  ${overdue_amount_conv};;
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Accounts Payable Aging"
      url: "/dashboards/cortex_sap_operational::accounts_payable_aging?Target+Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}&Vendor+Name={{ _filters['accountspayable.name1']| url_encode }}&Company+Code={{ _filters['accountspayable.company_text_butxt']| url_encode }}"
    }
  }

  measure: sum_overdue_on_past_due_date {
    type: sum
    sql: abs(${TABLE}.OverdueOnPastDate) ;;
    value_format: "0.00"
  }

  measure: sum_overdue_on_past_due_date_conv_drill{
    type: sum
    sql: abs(${overdue_on_past_due_date_conv}) ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_overdue_on_past_due_date_1 {
    type: sum
    sql: abs(${TABLE}.OverdueOnPastDate) ;;
    value_format: "0,,\" K\""
  }


  measure: sum_overdue_amount2  {
    type: sum
    sql:  abs(${TABLE}.OverdueAmount) ;;
    value_format: "0.00"
  }

  measure: sum_overdue_amount_2_conv_drill  {
    type: sum
    sql:  ${overdue_amount_conv} ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }


  dimension: is_parked_invoice {
    type: yesno
    sql: ${TABLE}.IsParkedInvoice ;;
  }


  measure: parked_invoice {
    type: count
    filters: [is_parked_invoice: "Yes"]
    hidden: no
  }

  measure: parked_invoice_amount {
    type: sum
    filters: [is_parked_invoice: "Yes"]
    sql: ${amount_in_local_currency_dmbtr} ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0, \"K\";0;"
    hidden: no
  }

  measure: parked_invoice_amount_global_currency {
    type: sum
    filters: [is_parked_invoice: "Yes"]
    sql: abs(${amount_in_glob_curr}) ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0, \"K\";0;"
    hidden: no
  }

  dimension: is_blocked_invoice {
    type: yesno
    sql: ${TABLE}.IsBlockedInvoice ;;
    hidden: no
  }

  measure: blocked_invoice {
    type: count
    filters: [is_blocked_invoice: "Yes"]
    hidden: no
  }

  measure: blocked_invoice_amount {
    type: sum
    filters: [is_blocked_invoice: "Yes"]
    sql: ${amount_in_local_currency_dmbtr} ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0, \"K\";0;"
    hidden: no
  }

  measure: blocked_invoice_amount_global_currency {
    type: sum
    filters: [is_blocked_invoice: "Yes"]
    sql: ${amount_in_glob_curr} ;;
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0, \"K\";0;"
    hidden: no
  }


  measure: total_invoice {
    type: count
    filters: [is_parked_invoice: "Yes, No",is_blocked_invoice: "Yes, No"]
  }

  dimension: cash_discount_received {
    type: number
    sql: ${TABLE}.CashDiscountReceived ;;
  }

  dimension: target_cash_discount {
    type: number
    sql: ${TABLE}.TargetCashDiscount ;;
  }

  dimension: amount_of_open_debit_items {
    type: number
    sql: abs(${TABLE}.AmountOfOpenDebitItems) ;;
  }

  dimension: amount_of_open_debit_items_conv {
    type: number
    sql: (${TABLE}.AmountOfOpenDebitItems) * ${currency_conversion_new.ukurs} ;;
  }

  dimension: amount_of_return {
    type: number
    sql: ${TABLE}.AmountOfReturn ;;
  }


  dimension: Currency {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
    hidden: no
  }


  measure: Cash_Discount_Utilization {
    type:  sum
    sql: NULLIF(NULLIF(${cash_discount_received},0)/NULLIF(${target_cash_discount},0),0) ;;
    value_format: "0.00%"
  }

  measure: Cash_Discount_Utilization_1{
    type:  sum
    sql: NULLIF(NULLIF(${cash_discount_received},0)/NULLIF(${target_cash_discount},0),0) ;;
  }

  dimension: Past_Due_Interval{
    type: string
    hidden: no
    sql: if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)>0 and date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)<({% parameter Aging_Interval %}+1)),concat('b1- ',({% parameter Aging_Interval %}),' Days'),
        (if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)<(({% parameter Aging_Interval %}*2)+1)),concat('c31-',({% parameter Aging_Interval %}*2),' Days'),
        (if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)<(({% parameter Aging_Interval %}*3)+1)),concat('d61-',({% parameter Aging_Interval %}*3),' Days'),
        (if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)>(({% parameter Aging_Interval %}*3)+1)),concat('e> ',({% parameter Aging_Interval %}*3),' Days'),'aNot OverDue' )) )) )) ) ;;
  }

  dimension:  past_overdue_1_to_30day{
    type: number
    sql: if(${Past_Due_Interval}='b1- 30 Days',${overdue_amount},0) ;;
    hidden: no
  }

  dimension:  past_overdue_1_to_30day_glob_curr{
    type: number
    sql: if(${Past_Due_Interval}='b1- 30 Days',${overdue_amount_conv},0) ;;
    hidden: no
  }

  dimension:  past_overdue_31_to_60day{
    type: number
    sql: if(${Past_Due_Interval}='c31-60 Days',${overdue_amount},0) ;;
    hidden: no
  }

  dimension:  past_overdue_31_to_60day_glob_curr{
    type: number
    sql: if(${Past_Due_Interval}='c31-60 Days',${overdue_amount_conv},0) ;;
    hidden: no
  }

  dimension:  past_overdue_61_to_90day{
    type: number
    sql: if(${Past_Due_Interval}='d61-90 Days',${overdue_amount},0) ;;
    hidden: no
  }

  dimension:  past_overdue_61_to_90day_glob_curr{
    type: number
    sql: if(${Past_Due_Interval}='d61-90 Days',${overdue_amount_conv},0) ;;
    hidden: no
  }

  dimension:  past_overdue_greater_than_90day{
    type: number
    sql: if(${Past_Due_Interval}='e> 90 Days',${overdue_amount},0) ;;
    hidden: no
  }

  dimension:  past_overdue_greater_than_90day_glob_curr{
    type: number
    sql: if(${Past_Due_Interval}='e> 90 Days',${overdue_amount_conv},0) ;;
    hidden: no
  }

  dimension:  past_overdue_but_not_overdue{
    type: number
    sql: if(${Past_Due_Interval}='aNot OverDue',${overdue_amount},0) ;;
    hidden: no
  }

  dimension:  past_overdue_but_not_overdue_glob_curr{
    type: number
    sql: if(${Past_Due_Interval}='aNot OverDue',${overdue_amount_conv},0) ;;
    hidden: no
  }

  measure:  past_overdue_1_to_30days{
    type: sum
    sql: ${overdue_amount} ;;
    filters: [Past_Due_Interval: "b1- 30 Days"]
    hidden: no
  }

  measure:  past_overdue_1_to_30days_conv_drill{
    type: sum
    sql: ${past_overdue_1_to_30day_glob_curr} ;;
    hidden: no
  }

  measure:  past_overdue_31_to_60days{
    type: sum
    sql: ${overdue_amount} ;;
    filters: [Past_Due_Interval: "c31-60 Days"]
    hidden: no
  }

  measure:  past_overdue_31_to_60days_conv_drill{
    type: sum
    sql: ${past_overdue_31_to_60day_glob_curr} ;;
    hidden: no
  }

  measure:  past_overdue_61_to_90days{
    type: sum
    sql: ${overdue_amount} ;;
    filters: [Past_Due_Interval: "d61-90 Days"]
    hidden: no
  }

  measure:  past_overdue_61_to_90days_conv_drill{
    type: sum
    sql: ${past_overdue_61_to_90day_glob_curr} ;;
    hidden: no
  }

  measure:  past_overdue_greater_than_90days{
    type: sum
    sql: ${overdue_amount} ;;
    filters: [Past_Due_Interval: "e> 90 Days"]
    hidden: no
  }

  measure:  past_overdue_greater_than_90days_conv_drill{
    type: sum
    sql: ${past_overdue_greater_than_90day_glob_curr} ;;
    hidden: no
  }

  measure:  past_overdue_not_overdue{
    type: sum
    sql: ${overdue_amount} ;;
    filters: [Past_Due_Interval: "aNot OverDue"]
    hidden: no
  }



  set: detail {
    fields: [
      client_mandt,
      company_code_bukrs,
      company_text_butxt,
      account_number_of_vendor_or_creditor_lifnr,
      name1,
      amount_in_local_currency_dmbtr,
      accounting_document_number_belnr,
      number_of_line_item_within_accounting_document_buzei,
      document_number_of_the_clearing_document_augbl,
      terms_of_payment_key_zterm,
      account_type_koart,
      reason_code_for_payments_rstgr,
      payment_block_key_zlspr,
      clearing_date_augdt,
      posting_date_in_the_document_budat,
      fiscal_year_gjahr,
      fiscal_period_monat,
      period,
      previous_period,
      net_due_date,
      inv_status_rbstat,
      posting_date_budat,
      purchasing_document_number_ebeln,
      overdue_amount,
      outstanding_but_not_overdue,
      overdue_on_past_due_date,
      partial_payments,
      late_payments,
      upcoming_payments,
      potential_penalty,
      total_purchases,
      accounts_payable_turnover,
      is_parked_invoice,
      is_blocked_invoice,
      cash_discount_received,
      target_cash_discount,
      amount_of_open_debit_items,
      amount_of_return,
      Fiscal_date,currency_key_waers
    ]
  }
}
