view: vendor_performance {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.VendorPerformance` ;;
  fields_hidden_by_default: yes

  measure: average_amount_in_local_currency_dmbtr {
    type: average
    sql: ${amount_in_local_currency_dmbtr} ;;
  }

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${item_ebelp},${document_number_ebeln},${target_currency_tcurr},${language_key});;
  }

  dimension: amount_in_target_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInTargetCurrency_DMBTR ;;
  }

  dimension: client_mandt {
    type: string
    #primary_key: yes
    sql: ${TABLE}.Client_MANDT ;;
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

  dimension: month_year{
    type: string
    hidden: no
    #primary_key: yes
    sql: concat(${fiscal_year},"/",${fiscal_period}) ;;
  }

  dimension: fiscalyear_variant_periv {
    type: string
    sql: ${TABLE}.FiscalyearVariant_PERIV ;;
  }

  dimension: vendor_cycle_time_in_days {
    type: number
    sql: ${TABLE}.VendorCycleTimeInDays;;
    hidden: no
  }

  measure: avg_vendor_cycle_time_in_days {
    type: average
    sql: ${TABLE}.VendorCycleTimeInDays;;
    #value_format_name: Greek_Number_Format
    hidden: no
  }

  dimension: goods_receipt {
    type: number
    sql: ${TABLE}.GoodsReceiptCount ;;
  }

  measure: sum_goods_receipt {
    type: sum
    sql: ${goods_receipt} ;;
  }

  measure: sum_vendor_cycle_time {
    type: sum
    sql: ${vendor_cycle_time_in_days} ;;
  }

  measure: vendor_lead_time {
    type: number
    sql: ${sum_vendor_cycle_time}/${count_item} ;;
  }

  measure: vendor_lead_time1 {
    type: number
    sql: ceiling(${vendor_lead_time}) ;;
  }


  dimension: Key_date {
    type: date
    sql: ${purchasing_document_date_bedat_date} - 365 ;;
    hidden: no
  }

  measure: PR_Count{
    type: number
    sql: 0 ;;
  }


  dimension: start_date_1 {
    type :  date
    sql: ${purchasing_document_date_bedat_date} ;;
  }

  filter: temp_key_date {
    type: date
    suggest_dimension: purchasing_document_date_bedat_date
    hidden: no
  }

  ## New approach Feb 2023

  dimension: language_key {
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
    hidden: no
  }

  dimension: material_description {
    type: string
    sql: ${TABLE}.MaterialText_MAKTX;;
    hidden: no
  }

  dimension: material_type_description {
    type: string
    sql: ${TABLE}.DescriptionOfMaterialType_MTBEZ;;
    hidden: no
  }

    dimension_group: PO_Creation_Date {
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
    sql: ${TABLE}.CreatedOn_AEDAT ;;
  }

  dimension: invoice_date {
    type: string
    sql: if(${transactionevent_type_vgabe} = '2',${PO_Creation_Date_date},${PO_Creation_Date_date}) ;;
    hidden: no
  }

  dimension_group: Actual_Receipt_Date {
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
    hidden: no
  }

  dimension: company_bukrs {
    type: string
    sql: ${TABLE}.Company_BUKRS ;;
  }

  dimension: company_text_butxt {
    type: string
    sql: ${TABLE}.CompanyText_BUTXT ;;
    suggest_persist_for: "10 minutes"
    hidden: no
  }

  dimension: country_key_land1 {
    type: string
    label: "Vendor Country"
    sql: ${TABLE}.CountryKey_LAND1 ;;
    hidden: no
  }

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
    suggest_persist_for: "10 minutes"
    hidden: no
  }
  
  dimension: target_currency_tcurr {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
    hidden: no
  }
  
  dimension: currency_key_waers2 {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
    hidden: no
  }

  dimension: currency_key_waers3 {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: currency_key_waers4 {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }


  dimension: delivery_completed_flag_elikz {
    type: string
    sql: ${TABLE}.DeliveryCompletedFlag_ELIKZ ;;
  }

  dimension: document_number_ebeln {
    type: string
    #primary_key: yes
    sql: ${TABLE}.DocumentNumber_EBELN ;;
    suggest_persist_for: "10 minutes"
    hidden: no
  }

  dimension: goods_receipt_amount_in_source_currency {
    type: number
    sql: ${TABLE}.GoodsReceiptAmountInSourceCurrency ;;
  }

  dimension: goods_receipt_amount_in_source_currency_1 {
    type: number
    sql: ${transactionevent_type_vgabe} = "1" ;;
  }

  measure: sum_goods_receipt_amount_in_source_currency {
    type: sum
    sql: ${goods_receipt_amount_in_source_currency} ;;
    filters: [transactionevent_type_vgabe: "1"]
  }

  measure: sum_po_currency {
    type: sum
    sql: ${net_order_valuein_pocurrency_netwr} ;;
  }

  dimension: goods_receipt_amount_in_target_currency {
    type: number
    sql: ${TABLE}.GoodsReceiptAmountInTargetCurrency ;;
  }

  dimension: goods_receipt_quantity {
    type: number
    sql: ${TABLE}.GoodsReceiptQuantity ;;
    hidden: no
  }

  dimension: material_number {
    type: string
    #primary_key: yes
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: material_type {
    type: string
    sql: ${TABLE}.MaterialType_MTART ;;
    hidden: no
  }

  dimension: material_group {
    type: string
    sql: ${TABLE}.MaterialGroup_MATKL ;;
  }

  dimension_group: item_delivery_date_eindt {
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
    sql: ${TABLE}.ItemDeliveryDate_EINDT ;;
    hidden: no
  }

  dimension_group: Schedule_line_date {
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
    sql: ${TABLE}.OrderDateOfScheduleLine_BEDAT ;;
    hidden: no
  }

  dimension_group: Requested_delivery_date {
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
    sql: ${TABLE}.ItemDeliveryDate_EINDT ;;
    hidden: no
  }

  dimension_group: Invoice_date {
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
    sql: ${TABLE}.InvoiceDate ;;
    hidden: no
  }

  dimension_group: purchase_doc_date {
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
    sql: ${TABLE}.CreatedOn_AEDAT ;;
    hidden: no
  }

  dimension: po_status {
    type: string
    sql: ${TABLE}.Status_STATU ;;
  }

  dimension: invoice_amount_in_target_currency {
    type: number
    sql: ${TABLE}.InvoiceAmountInTargetCurrency ;;
    hidden: no
  }

  measure: sum_invoice_amount_in_target_currency {
    type: sum
    sql: ${invoice_amount_in_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_invoice_amount_in_target_currency_by_top_vendor {
    type: sum
    sql: ${invoice_amount_in_target_currency} ;;
    value_format_name: Greek_Number_Format
    link: {
      label: "Spend by Top Vendors"
      url: "/dashboards/cortex_sap_operational::sap_finance_sa_08_a_spend_by_top_vendors?Company+Code={{ _filters['vendor_performance.company_text_butxt']| url_encode }}&Purchasing+Organization={{ _filters['vendor_performance.purchasing_organization_text_ekotx']| url_encode }}&Purchasing+Group={{ _filters['vendor_performance.purchasing_group_text_eknam']| url_encode }}&Vendor+Name={{ _filters['vendor_performance.name1']| url_encode }}&Vendor+Country={{ _filters['vendor_performance.country_key_land1']| url_encode }}&Target+Currency={{ _filters['vendor_performance.target_currency_tcurr']| url_encode }}&Invoice+Date={{ _filters['vendor_performance.Invoice_date_date']| url_encode }}"
    }
    hidden: no
  }

  dimension: invoice_quantity {
    type: number
    sql: ${TABLE}.InvoiceQuantity ;;
    hidden: no
  }

  dimension: item_ebelp {
    type: string
    #primary_key: yes
    sql: ${TABLE}.Item_EBELP ;;
    hidden: no
  }

  measure: count_item {
    type: count_distinct
    sql: ${item_ebelp} ;;
  }

  dimension: item_in_material_document_buzei {
    type: string
    sql: ${TABLE}.ItemInMaterialDocument_BUZEI ;;
  }

  dimension: material_document_year_gjahr {
    type: string
    sql: ${TABLE}.MaterialDocumentYear_GJAHR ;;
  }

  dimension: movement_type__inventory_management___bwart {
    type: string
    sql: ${TABLE}.MovementType__inventoryManagement___BWART ;;
  }

  dimension: name1 {
    type: string
    label: "Vendor Name"
    sql: ${TABLE}.NAME1 ;;
    suggest_persist_for: "10 minutes"
    hidden: no
  }

  measure: count_vendors {
    type: count_distinct
    sql: ${name1} ;;
    hidden: no
  }
  
  dimension: net_order_valuein_pocurrency_netwr {
    type: number
    sql: ${TABLE}.NetOrderValueinPOCurrency_NETWR ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  dimension: number_of_material_document_belnr {
    type: string
    sql: ${TABLE}.NumberOfMaterialDocument_BELNR ;;
  }

  dimension: overdelivery_tolerance_limit {
    type: number
    sql: ${TABLE}.OverdeliveryToleranceLimit ;;
  }


  dimension: poquantity_menge {
    type: number
    sql: ${TABLE}.POQuantity_MENGE ;;
    hidden: no
  }

  measure: poquantity {
    type: number
    sql: ${poquantity_menge} ;;

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

  dimension_group: purchasing_document_date_bedat {
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
    sql: ${TABLE}.PurchasingDocumentDate_BEDAT ;;
    hidden: no
  }


  dimension: purchasing_group_ekgrp {
    type: string
    sql: ${TABLE}.PurchasingGroup_EKGRP ;;
  }


  dimension: purchasing_group_text_eknam {
    type: string
    label: "Purchase Group"
    sql: ${TABLE}.PurchasingGroupText_EKNAM ;;
    suggest_persist_for: "10 minutes"
    hidden: no
  }

  dimension: purchasing_organization_ekorg {
    type: string
    sql: ${TABLE}.PurchasingOrganization_EKORG ;;
  }

  dimension: purchasing_organization_text_ekotx {
    type: string
    label: "Purchase Organization"
    sql: ${TABLE}.PurchasingOrganizationText_EKOTX ;;
    suggest_persist_for: "10 minutes"
    hidden: no
  }

  dimension: rejected_quantity {
    type: number
    sql: ${TABLE}.RejectedQuantity ;;
  }

  dimension: sequential_number_of_account_assignment_zekkn {
    type: string
    sql: ${TABLE}.SequentialNumberOfAccountAssignment_ZEKKN ;;
  }

  dimension: transactionevent_type_vgabe {
    type: string
    sql: ${TABLE}.TransactioneventType_VGABE ;;
  }

  dimension: underdelivery_tolerance_limit {
    type: number
    sql: ${TABLE}.UnderdeliveryToleranceLimit ;;
  }

  dimension: uo_m_meins {
    type: string
    sql: ${TABLE}.UoM_MEINS ;;
    hidden: no
  }

  dimension: uo_m_meins2 {
    type: string
    sql: ${TABLE}.UoM_MEINS ;;
    hidden: no
  }

  dimension: uo_m_meins3 {
    type: string
    sql: ${TABLE}.UoM_MEINS ;;
    hidden: no
  }

  dimension: vendor_account_number_lifnr {
    type: string
    sql: ${TABLE}.VendorAccountNumber_LIFNR ;;
    hidden: no
  }

  measure: Active_Vendor{
    type: count_distinct
    sql: ${name1};;
  }

  measure: Active_Vendor_1{
    type: count_distinct
    sql: ${name1};;
    hidden: no
  }


  measure: vendor_cycle_time_in_days_1 {
    type: sum_distinct
    sql: ${TABLE}.VendorCycleTimeInDays;;
    required_fields: [vendor_cycle_time_in_days,name1]
  }


  dimension: vendor_in_full_delivery {
    type: string
    sql: ${TABLE}.VendorInFullDelivery ;;
  }

  dimension: vendor_on_time_delivery {
    type: string
    sql: ${TABLE}.VendorOnTimeDelivery ;;
  }

  dimension: vendor_on_time_in_full_delivery {
    type: string
    sql: ${TABLE}.VendorOnTimeInFullDelivery ;;
  }

  measure: count_otif {
    type: count
    filters: [vendor_on_time_in_full_delivery: "OTIF"]
  }

  measure: otif {
    type: count
    filters: [vendor_on_time_in_full_delivery: "OTIF, NotOTIF"]
  }

  measure: count {
    type: count
  }

  ######################################## Total amount ####################################################

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR ;;
  }

  measure: total_spend {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
  }

  dimension: invoice_amount_in_source_currency_1 {
    type: number
    sql: ${TABLE}.InvoiceAmountInSourceCurrency ;;
  }

  dimension: invoice_amount_in_source_currency {
    type: number
    label: "Spend"
    sql: ${TABLE}.InvoiceAmountInSourceCurrency ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: invoice_amount_in_source_currency_cal {
    type: number
    label: "Spend_test"
    sql: ${TABLE}.InvoiceAmountInSourceCurrency ;;
    required_fields: [invoice_amount_in_source_currency]
  }

  measure: invoice_amount {
    type: number
    label: "Invoice Amount"
    sql: ${TABLE}.InvoiceAmountInSourceCurrency ;;
    required_fields: [invoice_amount_in_source_currency]
  }

  measure: sum_invoice_amount {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    hidden: no
    value_format_name: Greek_Number_Format
  }


  ######################################## Open PO Count ####################################################

  dimension: past_due_or_open_items {
    type: string
    sql: ${TABLE}.PastDueOrOpenItems ;;
  }

  measure: count_past_due {
    type: count
    filters: [past_due_or_open_items: "PastDue"]
    hidden: no
  }

  measure: count_past_due_SP {
    type: count
    filters: [past_due_or_open_items: "PastDue"]
  }

  measure: open {
    type: count
    filters: [past_due_or_open_items: "Open"]
  }

  measure: open_SP {
    type: count
    filters: [past_due_or_open_items: "Open"]
  }

  measure: count_open_po {
    type: count
    filters: [past_due_or_open_items: "Open"]
  }

  measure: count_open_po_1 {
    type: count
    filters: [past_due_or_open_items: "Open"]
  }

  measure: count_open_po_2 {
    type: count
    filters: [past_due_or_open_items: "PastDue"]
  }

  measure: PO_Count {
    type: number
    sql: ${count_open_po_1} + ${count_open_po_2} ;;
  }

  measure: sum_spend_by_purchase_org {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }

  measure: sum_spend_by_purchase_org_1 {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_spend_by_purchase_grp_1 {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_spend_by_vendor_1 {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_spend_by_country_1 {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_spend_by_purchase_grp {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_spend_by_country {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_spend_by_material_type {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
  }


  measure: sum_spend_by_material_type_1 {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
  }


  measure: sum_spend_by_material {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }

  measure: sum_spend_by_month {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
    value_format_name: Greek_Number_Format
  }


  measure: sum_spend_by_month_1 {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
  }


  measure: sum_spend_by_vendor {
    type: sum
    sql: ${invoice_amount_in_source_currency} ;;
  }


  measure: AccurateInvoice_Count {
    type: count
    filters: [vendor_invoice_accuracy: "AccurateInvoice"]
  }

  measure: InaccurateInvoice_Count {
    type: count
    filters: [vendor_invoice_accuracy: " InaccurateInvoice"]
  }

  measure: invoice_count {
    type: count
    filters: [vendor_invoice_accuracy: "AccurateInvoice,  InaccurateInvoice" ]
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: invoice_count_purchase_org {
    type: count
    filters: [vendor_invoice_accuracy: "AccurateInvoice,  InaccurateInvoice" ]
  }

  measure: invoice_count_purchase_grp {
    type: count
    filters: [vendor_invoice_accuracy: "AccurateInvoice,  InaccurateInvoice" ]
  }

  measure: invoice_count_vendor {
    type: count
    filters: [vendor_invoice_accuracy: "AccurateInvoice, InaccurateInvoice" ]
  }

  measure: Invoice_Accuracy {
    type: number
    sql: ${AccurateInvoice_Count} / NULLIF(${AccurateInvoice_Count} + ${InaccurateInvoice_Count}, 0) ;;
    value_format: "0.0%"
    hidden: no
  }

  measure: Invoice_Accuracy_rep {
    type: number
    sql: ${AccurateInvoice_Count}/ NULLIF(${AccurateInvoice_Count} + ${InaccurateInvoice_Count}, 0) ;;
    value_format: "0.0%"
  }

  measure: Notdelayed_count{
    type: count
    filters: [vendor_on_time_delivery: "NotDelayed"]
  }

  dimension: plant {
    type: string
    #primary_key: yes
    sql: ${TABLE}.Plant_WERKS ;;
  }

  #################################   Purchase Price Currency Conversion   #########

  dimension: Purchase_Price1 {
    type: number
    sql: ${TABLE}.NetPrice_NETPR ;;
  }


  dimension: standard_cost {
    type: number
    sql:
    CASE
      WHEN ${material_type} = 'FERT' OR ${material_type} = 'HALB'
        THEN COALESCE(${materials_valuation_v2.standard_cost_stprs}, ${Purchase_Price1})
      WHEN ${material_type} = 'ROH' OR ${material_type} = 'HIBE'
        THEN COALESCE(${materials_valuation_v2.moving_average_price}, ${Purchase_Price1})
    END ;;
  }

  dimension: standard_cost_tc {
    type: number
    label: "Standard Price in TC"
    sql: ${standard_cost}*${exchange_rate_ukurs} ;;
  }

  measure: sum_standard_cost {
    type: sum
    value_format_name: Greek_Number_Format
    label: "Sum Standard Price in TC"
    sql: ${standard_cost_tc} ;;
    hidden: no
  }

  dimension: net_price_in_target_currency_netpr {
    type: number
    value_format_name: Greek_Number_Format
    label: "Purchase Price in TC"
    sql: ${TABLE}.NetPriceInTargetCurrency_NETPR ;;
  }

  measure: sum_net_price_in_target_currency_netpr {
    type: sum
    value_format_name: Greek_Number_Format
    label: "Sum Purchase Price in TC"
    sql: ${net_price_in_target_currency_netpr} ;;
    hidden: no
  }

  dimension: purchase_price_variance {
    type: number
    value_format_name: Greek_Number_Format
    sql: abs((${net_price_in_target_currency_netpr} - ${standard_cost_tc}) * ${poquantity_menge}) ;;
  }

  measure: sum_purchase_price_variance {
    type: sum
    value_format_name: Greek_Number_Format
    label: "Purchase Price Variance in TC"
    sql: ${purchase_price_variance} ;;
    hidden: no
  }



  ###############################Count Of Cleared Invoices##################################################################

  dimension: vendor_invoice_accuracy {
    type: string
    sql: ${TABLE}.VendorInvoiceAccuracy ;;
    hidden: no
  }

  measure: count_cleared_invoices {
    type: count
    filters: [vendor_invoice_accuracy: "AccurateInvoice, InaccurateInvoice"]
    hidden: no
  }

  dimension: Purchase_price {
    type: number
    sql: ${Purchase_Price1} ;;
  }

  measure: sum_Purchase_price {
    type: sum
    sql: ${Purchase_price} ;;
    value_format_name: Greek_Number_Format
  }


  dimension: Invoice_status {
    type: string
    sql: if(${vendor_invoice_accuracy} = "AccurateInvoice","Accurate","Inaccurate") ;;
  }

  dimension: On_Time{
    type: yesno
    sql: ${vendor_on_time_delivery} = "NotDelayed";;
    hidden: no
  }
#################################Spend by Top Vendors Detailed Report######################################

  dimension: net_order_valuein_target_currency_netwr {
    type: number
    sql: ${TABLE}.NetOrderValueinTargetCurrency_NETWR ;;
    hidden: no
  }

  dimension: exchange_rate_ukurs {
    type: number
    sql: ${TABLE}.ExchangeRate_UKURS ;;
    hidden: no
  }

  measure: Delayed_count{
    type: count
    filters: [vendor_on_time_delivery: "Delayed"]
  }

  measure: Vendor_Ontime {
    type: number
    sql:  ${Notdelayed_count}/NULLIF((${Delayed_count}+${Notdelayed_count}),0);;
    hidden: no
    value_format: "0.0%"
    link: {
      label: "Delivery Performance Trend"
      url: "/dashboards/cortex_sap_operational::sap_finance_vp_09_a_delivery_performance_trend?Target+Currency={{ _filters['target_currency_tcurr']| url_encode }}&Purchase+Order+Date={{ _filters['vendor_performance.purchasing_document_date_bedat_date']| url_encode }}&Vendor+Name={{ _filters['vendor_performance.name1']| url_encode }}&Company+Code={{ _filters['vendor_performance.company_text_butxt']| url_encode }}&Purchasing+Organization={{ _filters['vendor_performance.purchasing_organization_text_ekotx']| url_encode }}&Purchasing+Group={{ _filters['vendor_performance.purchasing_group_text_eknam']| url_encode }}&Vendor+Country={{ _filters['vendor_performance.country_key_land1']| url_encode }}"
   }
  }

  measure:  total_delivered{
    type: count
    filters:  [vendor_on_time_delivery: "Delayed, NotDelayed"]
  }

  measure: Vendor_Ontime_late {
    type: number
    sql:  ${Delayed_count}/NULLIF((${Delayed_count}+${Notdelayed_count}),0);;
    value_format: "0.0%"
    hidden: no
  }


  measure: Vendor_Ontime_del {
    type: number
    sql:  ${Notdelayed_count}/NULLIF((${Delayed_count}+${Notdelayed_count}),0);;
    value_format: "0.0%"
    hidden: no
  }

  measure: Vendor_Ontime_vendor {
    type: number
    sql:  ${Notdelayed_count}/NULLIF((${Delayed_count}+${Notdelayed_count}),0);;
    value_format: "0.0%"
    hidden: no
  }

  measure: Rejected_count {
    type: count
    filters: [is_rejected: "yes"]
  }


  dimension: is_rejected {
    type: yesno
    sql: ${TABLE}.IsRejected;;
    hidden: no
  }

  measure: NotRejected_count {
    type: count
    filters: [is_rejected: "no"]
  }

  measure: Rejection_rate_vendor {
    type: number
    sql: ${Rejected_count}/NULLIF((${NotRejected_count} + ${Rejected_count}),0) ;;
    value_format: "0.0%"
    hidden: no
  }

  measure: total_rejected {
    type: count
    filters: [is_rejected: "yes, no"]
  }

  measure: Rejection_rate {
    type: number
    sql: ${Rejected_count}/NULLIF((${NotRejected_count} + ${Rejected_count}),0) ;;
    value_format: "0.0%"
    hidden: no
  }

  measure: Rejection_rate_rep {
    type: number
    sql: ${Rejected_count}/NULLIF((${NotRejected_count} + ${Rejected_count}),0) ;;
    value_format: "0.0%"
  }


  dimension: is_delivered {
    type: yesno
    # sql: If(${TABLE}.DeliveredOrNotDelivered="Delivered",'Yes','No') ;;
    sql: ${TABLE}.IsDelivered ;;
    hidden: no
  }

  measure: Rejection_rate_del {
    type: number
    sql: ${Rejected_count}/NULLIF((${NotRejected_count} + ${Rejected_count}),0) ;;
    value_format: "0.0%"
  }

  measure: Infull_count {
    type: count
    filters: [vendor_in_full_delivery: "DeliveredInFull"]
  }

  dimension: In_full {
    type: yesno
    sql: ${vendor_in_full_delivery} = "DeliveredInFull"  ;;
    hidden: no
  }

  measure: NotInfull_count {
    type: count
    filters: [vendor_in_full_delivery: "NotDeliveredInFull"]
  }

  measure: total_infull {
    type: count
    filters: [vendor_in_full_delivery: "DeliveredInFull, NotDeliveredInFull"]
  }

  measure: Infull_rate_vendor {
    type: number
    sql: ${Infull_count}/NULLIF((${NotInfull_count} + ${Infull_count}),0) ;;
    value_format: "0.0%"
    hidden: no
  }

  measure: Infull_rate {
    type: number
    sql: ${Infull_count}/NULLIF((${NotInfull_count} + ${Infull_count}),0) ;;
    value_format: "0.0%"
  }

  measure: Infull_rate_del {
    type: number
    sql: ${Infull_count}/NULLIF((${NotInfull_count} + ${Infull_count}),0) ;;
    value_format: "0.0%"
    hidden: no
  }

}
