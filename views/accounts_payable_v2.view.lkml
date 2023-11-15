view: accounts_payable_v2 {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.AccountsPayable`
    ;;

  parameter: Aging_Interval {
    type: number
    default_value: "30"
    hidden: no
  }

  dimension: key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${client_mandt},${accounting_document_number_belnr},${number_of_line_item_within_accounting_document_buzei},${company_code_bukrs},${target_currency_tcurr});;
  }

  dimension: account_number_of_vendor_or_creditor_lifnr {
    type: string
    sql: ${TABLE}.AccountNumberOfVendorOrCreditor_LIFNR ;;
  }

  dimension: account_type_koart {
    type: string
    sql: ${TABLE}.AccountType_KOART ;;
  }

  dimension: accounting_document_number_belnr {
    type: string
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
  }

  dimension: accounting_documenttype_blart {
    type: string
    sql: ${TABLE}.AccountingDocumenttype_BLART ;;
  }

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR * -1;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount_in_local_currency_dmbtr {
    type: sum
    sql: ${amount_in_local_currency_dmbtr} ;;
    value_format_name: Greek_Number_Format
  }

  measure: average_amount_in_local_currency_dmbtr {
    type: average
    sql: ${amount_in_local_currency_dmbtr} ;;
    value_format_name: Greek_Number_Format
  }

  dimension: amount_in_target_currency_dmbtr {
    type: number
    hidden: no
    sql: ${TABLE}.AmountInTargetCurrency_DMBTR * -1 ;;
  }

  dimension: amount_of_open_debit_items_in_source_currency {
    type: number
    sql: ${TABLE}.AmountOfOpenDebitItemsInSourceCurrency ;;
  }

  dimension: amount_of_open_debit_items_in_target_currency {
    type: number
    sql: ${TABLE}.AmountOfOpenDebitItemsInTargetCurrency ;;
  }

  dimension: amount_of_return_in_source_currency {
    type: number
    sql: ${TABLE}.AmountOfReturnInSourceCurrency ;;
  }

  dimension: amount_of_return_in_target_currency {
    type: number
    sql: ${TABLE}.AmountOfReturnInTargetCurrency ;;
  }

  dimension: cash_discount_received_in_source_currency {
    type: number
    sql: ${TABLE}.CashDiscountReceivedInSourceCurrency ;;
  }

  dimension: cash_discount_received_in_target_currency {
    type: number
    sql: ${TABLE}.CashDiscountReceivedInTargetCurrency ;;
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

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: doc_fisc_period {
    type: string
    sql: ${TABLE}.DocFiscPeriod ;;
  }

  dimension: document_number_of_the_clearing_document_augbl {
    type: string
    sql: ${TABLE}.DocumentNumberOfTheClearingDocument_AUGBL ;;
  }

  dimension: exchange_rate_ukurs {
    type: number
    sql: ${TABLE}.ExchangeRate_UKURS ;;
  }

  dimension: fiscal_period_monat {
    type: string
    sql: ${TABLE}.FiscalPeriod_MONAT ;;
  }

  dimension: fiscal_year_gjahr {
    type: string
    sql: ${TABLE}.FiscalYear_GJAHR ;;
  }

  dimension: inv_status_rbstat {
    type: string
    sql: ${TABLE}.InvStatus_RBSTAT ;;
  }

  dimension: invoice_documenttype_blart {
    type: string
    sql: ${TABLE}.InvoiceDocumenttype_BLART ;;
  }

  dimension: is_blocked_invoice {
    type: yesno
    sql: ${TABLE}.IsBlockedInvoice ;;
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
    value_format_name: Greek_Number_Format
    hidden: no
  }


  measure: blocked_invoice_amount_global_currency {
    type: sum
    filters: [is_blocked_invoice: "Yes"]
    sql: ${amount_in_target_currency_dmbtr};;
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
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: parked_invoice_amount_global_currency {
    type: sum
    filters: [is_parked_invoice: "Yes"]
    sql: ${TABLE}.AmountInTargetCurrency_DMBTR ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  dimension: key_fisc_period {
    type: string
    sql: ${TABLE}.KeyFiscPeriod ;;
  }

  dimension: late_payments_in_source_currency {
    type: number
    sql: ${TABLE}.LatePaymentsInSourceCurrency ;;
  }

  dimension: late_payments_in_target_currency {
    type: number
    sql: ${TABLE}.LatePaymentsInTargetCurrency * -1 ;;
  }

  measure: sum_late_payments_in_target_currency {
    type: sum
    sql: ${late_payments_in_target_currency}  ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  dimension: month_of_posting_date_in_the_document_budat {
    type: number
    sql: ${TABLE}.MonthOfPostingDateInTheDocument_BUDAT ;;
  }

  dimension: movement_type__inventory_management___bwart {
    type: string
    sql: ${TABLE}.MovementType__inventoryManagement___BWART ;;
  }

  dimension: name1 {
    type: string
    sql: ${TABLE}.NAME1 ;;
    hidden: no

  }

  dimension: is_null_name1 {
    type: yesno
    sql: ${TABLE}.NAME1 IS NULL ;;
    hidden: no
  }

  dimension_group: net_due {
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
    sql: ${TABLE}.NetDueDate ;;
  }

  dimension: number_of_line_item_within_accounting_document_buzei {
    type: string
    sql: ${TABLE}.NumberOfLineItemWithinAccountingDocument_BUZEI ;;
  }

  dimension: outstanding_but_not_overdue_in_source_currency {
    type: number
    sql: ${TABLE}.OutstandingButNotOverdueInSourceCurrency * -1 ;;
    value_format_name: Greek_Number_Format
  }

  dimension: outstanding_but_not_overdue_in_target_currency {
    type: number
    sql: ${TABLE}.OutstandingButNotOverdueInTargetCurrency * -1;;
    value_format_name: Greek_Number_Format
  }

  dimension: overdue_amount_in_source_currency {
    type: number
    sql: ${TABLE}.OverdueAmountInSourceCurrency * -1 ;;
    value_format_name: Greek_Number_Format
  }

  dimension: overdue_amount_in_target_currency {
    type: number
    sql: ${TABLE}.OverdueAmountInTargetCurrency * -1 ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_overdue_amount {
    type: sum
    sql: ${overdue_amount_in_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
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
    sql: if(${Past_Due_Interval}='b1- 30 Days',(${overdue_on_past_date_in_target_currency} ),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }

  dimension:  source_past_overdue_1_to_30day{
    type: number
    sql: if(${Past_Due_Interval}='b1- 30 Days',(${overdue_on_past_date_in_source_currency} ),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }


  dimension:  past_overdue_31_to_60day{
    type: number
    sql: if(${Past_Due_Interval}='c31-60 Days',(${overdue_on_past_date_in_target_currency} ),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }

  dimension:  source_past_overdue_31_to_60day{
    type: number
    sql: if(${Past_Due_Interval}='c31-60 Days',(${overdue_on_past_date_in_source_currency} ),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }


  dimension:  past_overdue_61_to_90day{
    type: number
    sql: if(${Past_Due_Interval}='d61-90 Days',(${overdue_on_past_date_in_target_currency} ),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }

  dimension:  source_past_overdue_61_to_90day{
    type: number
    sql: if(${Past_Due_Interval}='d61-90 Days',(${overdue_on_past_date_in_source_currency} ),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }


  dimension:  past_overdue_greater_than_90day{
    type: number
    sql: if(${Past_Due_Interval}='e> 90 Days',(${overdue_on_past_date_in_target_currency}),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }


  dimension:  source_past_overdue_greater_than_90day{
    type: number
    sql: if(${Past_Due_Interval}='e> 90 Days',(${overdue_on_past_date_in_source_currency} ),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }




  dimension:  past_overdue_but_not_overdue{
    type: number
    sql: if(${Past_Due_Interval}='aNot OverDue',(${outstanding_but_not_overdue_in_target_currency}),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }

  dimension:  source_past_overdue_but_not_overdue{
    type: number
    sql: if(${Past_Due_Interval}='aNot OverDue',(${outstanding_but_not_overdue_in_source_currency}),0) ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }

  measure:  sum_past_overdue_1_to_30days{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "b1- 30 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure:  sum_past_overdue_1_to_30days_conv_drill{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "b1- 30 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Accounts Payable Aging"
      url: "/dashboards/cortex_sap_operational::sap_finance_ap_07_a_accounts_payable_aging?Target+Currency={{ _filters['accounts_payable_v2.target_currency_tcurr']| url_encode }}&Vendor+Name={{ _filters['accounts_payable_v2.name1']| url_encode }}&Company+Name={{ _filters['accounts_payable_v2.company_text_butxt']| url_encode }}"
    }
  }

  measure:  sum_past_overdue_31_to_60days{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "c31-60 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure:  sum_past_overdue_31_to_60days_conv_drill{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "c31-60 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Accounts Payable Aging"
      url: "/dashboards/cortex_sap_operational::sap_finance_ap_07_a_accounts_payable_aging?Target+Currency={{ _filters['accounts_payable_v2.target_currency_tcurr']| url_encode }}&Vendor+Name={{ _filters['accounts_payable_v2.name1']| url_encode }}&Company+Name={{ _filters['accounts_payable_v2.company_text_butxt']| url_encode }}"
    }
  }

  measure:  sum_past_overdue_61_to_90days{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "d61-90 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure:  sum_past_overdue_61_to_90days_conv_drill{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "d61-90 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Accounts Payable Aging"
      url: "/dashboards/cortex_sap_operational::sap_finance_ap_07_a_accounts_payable_aging?Target+Currency={{ _filters['accounts_payable_v2.target_currency_tcurr']| url_encode }}&Vendor+Name={{ _filters['accounts_payable_v2.name1']| url_encode }}&Company+Name={{ _filters['accounts_payable_v2.company_text_butxt']| url_encode }}"
    }
  }

  measure:  sum_past_overdue_greater_than_90days{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "e> 90 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure:  sum_past_overdue_greater_than_90days_conv_drill{
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    filters: [Past_Due_Interval: "e> 90 Days"]
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Accounts Payable Aging"
      url: "/dashboards/cortex_sap_operational::sap_finance_ap_07_a_accounts_payable_aging?Target+Currency={{ _filters['accounts_payable_v2.target_currency_tcurr']| url_encode }}&Vendor+Name={{ _filters['accounts_payable_v2.name1']| url_encode }}&Company+Name={{ _filters['accounts_payable_v2.company_text_butxt']| url_encode }}"
    }
  }

  measure:  sum_past_overdue_not_overdue{
    type: sum
    sql: ${outstanding_but_not_overdue_in_target_currency};;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure:  sum_past_overdue_not_overdue_drill{
    type: sum
    sql: ${outstanding_but_not_overdue_in_target_currency};;
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Accounts Payable Aging"
      url: "/dashboards/cortex_sap_operational::sap_finance_ap_07_a_accounts_payable_aging?Target+Currency={{ _filters['accounts_payable_v2.target_currency_tcurr']| url_encode }}&Vendor+Name={{ _filters['accounts_payable_v2.name1']| url_encode }}&Company+Name={{ _filters['accounts_payable_v2.company_text_butxt']| url_encode }}"
    }
  }


  measure: total_due  {
    type: sum
    sql: (${overdue_on_past_date_in_target_currency} + ${outstanding_but_not_overdue_in_target_currency});;
    value_format_name: Greek_Number_Format
    hidden: no
    }

  measure: sum_overdue_amount_conv_drill_1  {
    type: sum
    sql: ${overdue_amount_in_target_currency};;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_overdue_amount_conv_drill_2 {
    type: sum
    sql: ${overdue_amount_in_target_currency};;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_overdue_amount_conv_drill_3 {
    type: sum
    sql: ${overdue_amount_in_target_currency};;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_past_overdue_amount_conv_drill {
    type: sum
    sql: ${overdue_on_past_date_in_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }


  measure: outstanding_but_not_overdue_1_conv_drill  {
    type: sum
    sql: ${outstanding_but_not_overdue_in_target_currency};;
    value_format_name: Greek_Number_Format
    hidden: no
  }


  dimension: overdue_on_past_date_in_source_currency {
    type: number
    sql: ${TABLE}.OverdueOnPastDateInSourceCurrency ;;
  }

  dimension: overdue_on_past_date_in_target_currency {
    type: number
    sql: ${TABLE}.OverdueOnPastDateInTargetCurrency * -1 ;;
  }

  dimension: partial_payments_in_source_currency {
    type: number
    sql: ${TABLE}.PartialPaymentsInSourceCurrency ;;
  }

  dimension: partial_payments_in_target_currency {
    type: number
    sql: ${TABLE}.PartialPaymentsInTargetCurrency ;;
  }

  dimension: payment_block_key_zlspr {
    type: string
    sql: ${TABLE}.PaymentBlockKey_ZLSPR ;;
  }

  dimension: poorder_history_amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.POOrderHistory_AmountInLocalCurrency_DMBTR ;;
  }

  dimension: poorder_history_amount_in_target_currency_dmbtr {
    type: number
    sql: ${TABLE}.POOrderHistory_AmountInTargetCurrency_DMBTR ;;
  }

  dimension_group: posting_date_budat {
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
    sql: ${TABLE}.PostingDate_BUDAT ;;
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
    sql: ${TABLE}.PotentialPenaltyInTargetCurrency * -1;;
  }

  measure: sum_potential_penalty_in_target_currency {
    type: sum
    sql: ${potential_penalty_in_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }



  dimension: purchase_in_source_currency {
    type: number
    sql: ${TABLE}.PurchaseInSourceCurrency ;;
  }

  dimension: purchase_in_target_currency {
    type: number
    sql: ${TABLE}.PurchaseInTargetCurrency ;;
  }

  dimension: purchasing_document_number_ebeln {
    type: string
    sql: ${TABLE}.PurchasingDocumentNumber_EBELN ;;
  }

  dimension: quarter_of_posting_date_in_the_document_budat {
    type: number
    sql: ${TABLE}.QuarterOfPostingDateInTheDocument_BUDAT ;;
  }

  dimension: reason_code_for_payments_rstgr {
    type: string
    sql: ${TABLE}.ReasonCodeForPayments_RSTGR ;;
  }

  dimension: supplying_country_landl {
    type: string
    sql: ${TABLE}.SupplyingCountry_LANDL ;;
  }

  dimension: target_cash_discount_in_source_currency {
    type: number
    sql: ${TABLE}.TargetCashDiscountInSourceCurrency ;;
  }

  dimension: target_cash_discount_in_target_currency {
    type: number
    sql: ${TABLE}.TargetCashDiscountInTargetCurrency ;;
  }

  dimension: target_currency_tcurr {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
  }

  dimension: terms_of_payment_key_zterm {
    type: string
    sql: ${TABLE}.TermsOfPaymentKey_ZTERM ;;
  }

  dimension: upcoming_payments_in_source_currency {
    type: number
    sql: ${TABLE}.UpcomingPaymentsInSourceCurrency ;;
  }

  dimension: upcoming_payments_in_target_currency {
    type: number
    sql: ${TABLE}.UpcomingPaymentsInTargetCurrency * -1 ;;
  }


  measure: sum_upcoming_payments_in_target_currency {
    type: sum
    sql: ${upcoming_payments_in_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
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
