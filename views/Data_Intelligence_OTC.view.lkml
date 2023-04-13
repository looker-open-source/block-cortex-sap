# The name of this view in Looker is "Data Intelligence Otc"
# connection: "@{CONNECTION_NAME2}"
view: data_intelligence_otc {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  #sql_table_name: `@{DATASET}.OrderToCash`;;
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.OrderToCash`;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Actual Quantity Delivered In Sales Units Lfimg" in Explore.
  parameter: Currency_Required{
    type: string
    allowed_value: {
      label: "USD"
      value: "USD"
    }
    allowed_value: {
      label: "EUR"
      value: "EUR"
    }
    allowed_value: {
      label: "CAD"
      value: "CAD"
    }
    allowed_value: {
      label: "JPY"
      value: "JPY"
    }
  }


  dimension: delivered_qty {
    type: number
    sql: ${TABLE}.ActualQuantityDelivered_InSalesUnits_LFIMG ;;
  }

  dimension: Blocked_Order_Quantity{
    type: number
    sql: ${TABLE}.ActualQuantityDelivered_InSalesUnits_LFIMG ;;
  }

  measure: sum_actual_quantity_delivered{
    type: sum
    sql: ${delivered_qty} ;;
    drill_fields: [delivery_number, delivery_line_item, material_number, delivery_date,actual_delivery_date, Sold_To_Party, Ship_To_Party, Bill_To_Party, sales_order,delivered_qty,Base_UoM, delivered_value_Local_Currency]
  }

  dimension: back_order {
    type: string
    sql: ${TABLE}.BackOrder ;;
  }

  dimension: billed_qty {
    type: number
    sql: ${TABLE}.BilledQty ;;
  }

  dimension: billing_block{
    type: string
    sql: ${TABLE}.BillingBlockReasonDescription ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: billing_date_for_billing_index_and_printout {
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
    sql: ${TABLE}.BillingDateForBillingIndexAndPrintout_FKDAT ;;
  }

  dimension: billing_item {
    type: string
    sql: ${TABLE}.BillingItem_POSNR ;;
  }

  dimension: billing_date {
    type: string
    sql: ${TABLE}.BillingDate_FKDAT ;;
  }

  dimension: blocked_order {
    type: string
    sql: ${TABLE}.BlockedSalesOrder ;;
  }

  measure: count_blocked_order {
    type: count_distinct
    sql: ${sales_orders_number} ;;
    filters: [blocked_order : "Blocked"]
    drill_fields:[sales_order, sales_order_line_item, product, delivery_block,billing_block,Sold_To_Party,Blocked_Order_Quantity, Base_UoM,Exchange_Rate_Sales_Value,blocked_order_value_Local_Currency,Local_Currency_Key,blocked_order_value_Global_Currency,Global_Currency]

    #drill_fields:[sales_orders, order_line_items, product_category, delivery_block_document_header,billing_block_in_sd_document,SoldToParty, customer_number, blocked_quantity, BaseUoM, blocked_value,blocked_order_value_Local_Currency,Local_Currency_Key]
    #filters: [blocked_order : "Blocked"]
#>>>>>>> branch 'main' of ssh://benschuler%40google.com@source.developers.google.com:2022/p/kittycorn-dev-inf/r/looker-repo
  }

  dimension: blocked_order_value_Local_Currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.DeliveredNetValue ;;
  }

  dimension: Exchange_Rate_of_blocked_order_Value{
    value_format: "0.00"
    type: number
    sql: if(${blocked_order_value_Global_Currency}=0,0,${blocked_order_value_Local_Currency}/${blocked_order_value_Global_Currency});;
  }

  dimension: blocked_order_value_Global_Currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${delivered_value_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${actual_delivery_date},${delivered_value_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${blocked_order_value_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${creation_date_date},${blocked_order_value_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }

  dimension: blocked_order_quantity {
    type: number
    sql: ${TABLE}.Blocked_Quantity ;;
  }

  dimension: blocked_order_value {
    type: number
    sql: ${TABLE}.Blocked_Value ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: canceled_order {
    type: string
    sql: ${TABLE}.CanceledOrder ;;
  }

  measure: count_canceled_order {
    type: count
    #sql: ${sales_orders_number} ;;
    #sql: ${canceled_order} ;;
    filters: [canceled_order : "Canceled"]

    #drill_fields: [sales_order,sales_order_line_item,product, Sold_To_Party, Ship_To_Party, Bill_To_Party,sales_order_status,sales_order_qty,Base_UoM,Exchange_Rate_Sales_Value,sales_order_value_Local_Currecny,Local_Currency_Key,Sales_Order_Value_Global_Currency,Global_Currency]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: confirmed_qty {
    type: number
    sql: ${TABLE}.ConfirmedOrderQuantity_BMENG ;;
  }

  dimension: country_code {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  dimension:  country{
    type: string
    sql:  ${TABLE}.RegionDescription;;
  }

  dimension_group: creation_date {
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
    sql: ${TABLE}.CreationDate_ERDAT ;;
  }

  dimension: cumulative_order_quantity{
    type: number
    sql: ${TABLE}.CumulativeOrderQuantity_KWMENG ;;
  }

  dimension: customer_address {
    type: string
    sql: ${TABLE}.CustomerAddress ;;
  }

  dimension: customer_name1 {
    type: string
    sql: ${TABLE}.CustomerName1 ;;
  }

  dimension: customer_name2 {
    type: string
    sql: ${TABLE}.CustomerName2 ;;
  }

  dimension: order_created_by {
    type: string
    sql: ${TABLE}.CustomerNumber ;;
  }

  dimension: customer_region {
    type: string
    sql: ${TABLE}.CustomerRegion ;;
  }

  dimension_group: actual_delivery {
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
    sql: ${TABLE}.Date__proofOfDelivery___PODAT ;;
  }

  dimension: delivered_value_Local_Currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.DeliveredNetValue ;;
  }

  dimension: Exchange_Rate_of_Delivered_Value{
    value_format: "0.00"
    type: number
    sql: if(${delivered_value_Global_Currency}=0,0,${delivered_value_Local_Currency}/${delivered_value_Global_Currency});;
  }

  dimension: delivered_value_Global_Currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${delivered_value_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${actual_delivery_date},${delivered_value_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${delivered_value_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${actual_delivery_date},${delivered_value_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }

  measure: sum_delivered_value {
    type: sum
    sql: ${delivered_value_Global_Currency} ;;
    drill_fields: [delivery_number, delivery_line_item, material_number, delivery_date,actual_delivery_date, Sold_To_Party, Ship_To_Party, Bill_To_Party, sales_order,delivered_qty,Base_UoM, delivered_value_Local_Currency]
  }



  dimension: delivery_block{
    type: string
    sql: ${TABLE}.DeliveryBlockReasonDescription ;;
  }

  dimension: Ship_To_Party {
    type: string
    sql: if(${TABLE}.ShipToPartyItemName_KUNNR is not null,${TABLE}.ShipToPartyItemName_KUNNR,${TABLE}.ShipToPartyHeaderName_KUNNR) ;;

  }

  dimension: Sold_To_Party {
    type: string
    sql: ${TABLE}.CustomerName1 ;;
  }

  dimension: Bill_To_Party {
    type: string
    sql: if(${TABLE}.BillToPartyItemName_KUNNR is not null,${TABLE}.BillToPartyItemName_KUNNR,${TABLE}.BillToPartyHeaderName_KUNNR);;
  }

  dimension: Base_UoM {
    type: string
    sql: ${TABLE}.salesUnitMeasure ;;
  }


  dimension: delivery_number {
    type: string
    sql: ${TABLE}.Delivery_VBELN ;;
  }

  measure: count_delivery_number {
    type: count_distinct
    sql: ${delivery} ;;
    filters: [late_deliveries: "Delayed"]
    drill_fields: [delivery_number,delivery_line_item,product,req_delivery_date,actual_delivery_date,Sold_To_Party,Ship_To_Party,Bill_To_Party,sales_order,delivered_qty,Base_UoM,Exchange_Rate_of_Delivered_Value,delivered_value_Local_Currency,Local_Currency_Key,delivered_value_Global_Currency,Global_Currency]
  }

  dimension: distribution_channel_number {
    type: string
    sql: ${TABLE}.DistributionChannel ;;
    #drill_fields: [material_description]
  }

  dimension: distribution_channel {
    type: string
    sql: ${TABLE}.DistributionChannelName ;;
  }


  dimension:  division{
    type: string
    sql:  ${TABLE}.DivisionDescription;;
  }

  dimension:  division_number{
    type: string
    sql:  ${TABLE}.Division;;
  }

  dimension: document_category {
    type: string
    sql: ${TABLE}.DocumentCategory_VBTYP ;;
  }

  dimension: fill_rate {
    type: number
    sql: ${TABLE}.FillRatePercent ;;
    #drill_fields: [sales_order,sales_order_line_items,product, Sold_To_Party, Ship_To_Party, Bill_To_Party,order_status,sales_order_qty,Base_UoM,sales_order_value]
  }

  measure: average_fill_rate {
    type: average
    sql: ${fill_rate} ;;
    drill_fields: [sales_order,sales_order_line_item,product,req_delivery_date,actual_delivery_date ,Sold_To_Party,Ship_To_Party,Bill_To_Party,sales_order_qty,Base_UoM,confirmed_qty,fill_rate]
  }

  dimension: payer_item {
    type: string
    sql: ${TABLE}.PayerItem_KUNNR ;;
  }

  dimension: status_of_delivery {
    type: string
    sql: ${TABLE}.DeliveryStatus ;;
  }

  dimension: delivery_status {
    type: string
    sql: CASE WHEN ${status_of_delivery} = "A" THEN "Not yet processed"
    WHEN ${status_of_delivery}="B" THEN "Partially processed"
    WHEN ${status_of_delivery}="C" THEN "Completely processed"
    else "Not Relevant" END;;
  }

  dimension: sales_order_status {
    type: string
    sql: if(${canceled_order}="Canceled","Canceled",if(${open_orders}="OpenOrder","Open","Closed")) ;;
  }



  dimension: billing_doc {
    type: string
    sql: ${TABLE}.BillingDocument_VBELN ;;


  }

  dimension: billing_Net_Value_Local_Currecy{
    value_format: "0.00"
    type: number
    sql: ${TABLE}.BillingNetValue ;;
  }

  dimension: Exchange_Rate_Billing_net_value{
    value_format: "0.00"
    type: number
    sql: if(${billing_Net_Value_Local_Currecy}=0,0,${billing_Net_Value_Local_Currecy}/${billing_Net_Value_Local_Currecy});;
  }

  dimension: billing_Net_Value_Global_Currecy {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${intercompany_price_Local_currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${intercompany_price_Local_currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${billing_Net_Value_Local_Currecy},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${billing_Net_Value_Local_Currecy})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }

  dimension: in_full_delivery {
    type: string
    sql: ${TABLE}.InFullDelivery ;;
  }


  dimension: incoming_order {
    type: string
    sql: ${TABLE}.IncomingOrderNum ;;

  }

  measure: count_incoming_order {
    type: count
    #sql: ${incoming_order} ;;
    drill_fields: [sales_order,sales_order_line_item,product, Sold_To_Party, Ship_To_Party, Bill_To_Party,sales_order_status,sales_order_qty,Base_UoM,Exchange_Rate_Sales_Value,sales_order_value_Local_Currecny,Local_Currency_Key,Sales_Order_Value_Global_Currency,Global_Currency]
    #drill_fields: [sales_orders, order_line_items, material_number, requesteddeliverydate_date,actual_delivery_date, SoldToParty, ShipToParty, BillToParty, customer_number, delivery_number,billing_document, delivery_status,order_status, sales_order_qty, BaseUoM, sales_order_value]
    link: {
      label: "Explore All Orders"
      url: "{{ link }}&limit=1000000"
    }}

  dimension: intercompany_price_Local_currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.IntercompanyPrice ;;
  }

  dimension: Exchange_Rate_intercompany_price{
    value_format: "0.00"
    type: number
    sql: if(${list_price_Global_currency}=0,0,${intercompany_price_Local_currency}/${list_price_Global_currency});;
  }

  dimension: intercompany_price_Global_currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${intercompany_price_Local_currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${intercompany_price_Local_currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${intercompany_price_Local_currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},cast(${intercompany_price_Local_currency} as numeric))),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }
  dimension: late_deliveries {
    type: string
    sql: ${TABLE}.LateDeliveries ;;
  }

  dimension: material_number {
    type: string
    sql: ${TABLE}.MaterialNumber ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.MaterialDescription ;;
  }

  dimension: net_price {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.NetPrice_NETPR ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_net_price {
    value_format: "0.00"
    type: sum
    sql: ${net_price} ;;
  }

  measure: average_net_price {
    value_format: "0.00"
    type: average
    sql: ${net_price} ;;
  }

  dimension: net_value_local_currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.BillingNetValue ;;
  }

  dimension: on_time_delivery {
    type: string
    sql: ${TABLE}.OnTimeDelivery ;;
  }

  dimension: Delivery {
    type: yesno
    sql:${actual_delivery_date} is not null  ;;
  }

  measure: count_of_deliveries {
    type: count_distinct
    sql: ${delivery_number} ;;
    filters: [Delivery: "Yes"]
  }

  measure: count_on_time_delivery {
    type: count_distinct
    sql: ${delivery_number} ;;
    filters: [OnTime: "Yes",Delivery: "Yes"]
  }

  measure: count_in_full_delivery {
    type: count_distinct
    sql: ${delivery_number} ;;
    filters: [InFull: "Yes", Delivery: "Yes"]
  }

  measure: count_otif {
    type: count_distinct
    sql: ${delivery_number} ;;
    filters: [OnTime_InFull: "Yes", Delivery: "Yes"]
  }

  measure: count_latedeliveries {
    type: count_distinct
    sql: ${delivery_number} ;;
    filters: [Late_Delivery: "Yes", Delivery: "Yes"]
  }

  measure: OnTimePercentage {
    type: number
    sql: if(${count_of_deliveries}=0,0,round(${count_on_time_delivery}/${count_of_deliveries}*100,2))  ;;
    #html:<a href="/dashboards/168?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}">{{value}}%</a> ;;
    html:<a href="/dashboards/cortex_sap_operational::delivery_performance?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}%</a> ;;
  }

  measure: InFullPercentage {
    type: number
    value_format: "0%"
    sql: if(${count_of_deliveries}=0,0,round(${count_in_full_delivery}/${count_of_deliveries}*100,2))  ;;
    #html:<a href="/dashboards/168?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}">{{value}}%</a> ;;
    html:<a href="/dashboards/cortex_sap_operational::delivery_performance?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}%</a> ;;
  }


  measure: OTIFPercentage {
    type: number
    value_format: "0%"
    sql: if(${count_of_deliveries}=0,0,round(${count_otif}/${count_of_deliveries}*100,2))  ;;
    #html:<a href="/dashboards/168?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}">{{value}}%</a> ;;
    html:<a href="/dashboards/cortex_sap_operational::delivery_performance?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}%</a> ;;
  }


  measure: LateDeliveryPercentage {
    type: number
    value_format: "0%"
    sql: if(${count_of_deliveries}=0,0,round(${count_latedeliveries}/${count_of_deliveries}*100,2))  ;;
   #html:<a href="/dashboards/168?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}">{{value}}%</a> ;;
    html:<a href="/dashboards/cortex_sap_operational::delivery_performance?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}%</a> ;;
  }


  dimension: OnTime_InFull {
    type: yesno
    sql: ${otif}="OTIF" ;;
  }

  dimension: OnTime {
    type: yesno
    sql: ${on_time_delivery}="DeliveredOnTime" ;;
  }

  dimension: InFull {
    type: yesno
    sql: ${in_full_delivery}="DeliveredInFull" ;;
  }

  dimension: Late_Delivery {
    type: yesno
    sql: ${late_deliveries}="Delayed" ;;
  }


  dimension: open_orders {
    type: string
    sql: ${TABLE}.OpenOrder ;;
  }

  measure:count_open_orders {
    type: count
    filters: [open_orders: "OpenOrder"]
    drill_fields: [sales_order,sales_order_line_item,product, Sold_To_Party, Ship_To_Party, Bill_To_Party,sales_order_status,sales_order_qty,Base_UoM,sales_order_value_Local_Currecny]
    #drill_fields: [sales_order_number,creation_date_date, material_number, confirmed_order_quantity,sales_order_net_price, shipping_location, requesteddeliverydate_date]
  }

  dimension: order_cycle_time_in_days {
    type: number
    sql: ${TABLE}.OrderCycleTimeInDays ;;
  }

  dimension: sales_order_line_item {
    type: string
    sql: ${TABLE}.Item_POSNR ;;
  }

  dimension: delivery_line_item {
    type: string
    sql: ${TABLE}.DeliveryItem_POSNR ;;
  }

  dimension: sales_order {
    type: string
    sql: ${TABLE}.SalesDocument_VBELN ;;
  }

  measure: count_sales_orders_line_item{
    type: number
    sql: count(${sales_order_line_item}) ;;
  }


  dimension: Total_Sales_Orders {
    type: number
    sql: ${TABLE}.TotalOrderItems ;;
  }

  measure: Total_Sales_Orders_AVG {
    type: average
    sql: ${Total_Sales_Orders} ;;
  }

  dimension: Total_Delevery_Order {
    type: number
    sql: ${TABLE}.TotalDeliveries ;;
  }

  measure: Total_Delevery_Order_AVG {
    type: average
    sql: ${Total_Delevery_Order} ;;
  }

  measure: avg_order_line_items {
    type: number
    sql: if(${Total_Sales_Orders_AVG}=0,0,round(${count_sales_orders_line_item}/${Total_Sales_Orders_AVG},2)) ;;
  }

  dimension: delivery {
    type: string
    sql: ${TABLE}.Delivery_VBELN ;;
  }

  measure: count_deliveries_sales_orders {
    type: number
    sql: count(${delivery_line_item}) ;;
  }

  measure: average_deliveries_sales_orders {
    type: number
    sql: if(${Total_Delevery_Order_AVG}=0,0,round(${count_deliveries_sales_orders}/${Total_Delevery_Order_AVG},2)) ;;
  }

  dimension: otif {
    type: string
    sql: ${TABLE}.OTIF ;;
  }



  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.ProductCategory ;;
  }

  dimension: rejection_reason {
    type: string
    sql: ${TABLE}.RejectionReason_ABGRU ;;
  }

  dimension_group: req_delivery{
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
    sql: ${TABLE}.DeliveryDate_LFDAT;;
  }

  dimension: return_order {
    type: string
    sql: ${TABLE}.ReturnOrder ;;
  }

  measure: count_return_order {
    type: count
    filters: [return_order : "Returned"]
    drill_fields: [sales_order,sales_order_line_item,product, Sold_To_Party, Ship_To_Party, Bill_To_Party,sales_order_status,sales_order_qty,Base_UoM,Exchange_Rate_Sales_Value,sales_order_value_Local_Currecny,Local_Currency_Key,Sales_Order_Value_Global_Currency,Global_Currency]
  }
  measure: Return_Order_Percentage {
    type: number
    sql:if(${count_of_delivery}=0,0,round(${count_return_order}/${count_of_delivery}*100,2)) ;;
    #html:<a href="/dashboards/177?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}">{{value}}%</a> ;;
    html:<a href="/dashboards/cortex_sap_operational::returned_orders?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}%</a> ;;
    #link: {
    #  label: "Returned Orders"
      #url: "/dashboards/177?Distribution+Channel={{ distribution_channel._value }}&Sales+Org={{ sales_org._value }}&Division={{ division._value }}&Product={{ product._value }}&AMPRegion={{ country._value }}"
     # url: "/dashboards/177?"
    #}
    #drill_fields: [sales_order,sales_order_line_item,product, Sold_To_Party, Ship_To_Party, Bill_To_Party,order_status,sales_order_qty,Base_UoM,Exchange_Rate_Sales_Value,Sales_Order_Value_Global_Currency,Global_Currency,sales_order_value_Local_Currecny,Local_Currency_Key]
  }
  dimension: return_order_status{
    type: string
    sql: ${TABLE}.ReturnOrderDescription ;;
  }
  measure: Cancelled_Order_Percentage {
    type: number
    sql: if(${data_intelligence_otc.count}=0,0,round(${count_canceled_order}/${data_intelligence_otc.count}*100,2)) ;;
    #html:<a href="/dashboards/178?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}">{{value}}%</a> ;;
    html:<a href="/dashboards/cortex_sap_operational::canceled_orders?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}%</a> ;;

  }

  measure: count_of_delivery {
    type: count_distinct
    sql: ${delivery} ;;
  }

  dimension: Rebate_Local_Currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.rebate ;;
  }

  dimension: Rebate_Global_Currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Rebate_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${Rebate_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${Rebate_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${billing_date_for_billing_index_and_printout_date},${Rebate_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }

  dimension: Tax_Amount_Local_Currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.TaxAmount_MWSBK ;;
  }

  dimension: Exchange_Rate_Tax_Amount{
    value_format: "0.00"
    type: number
    sql: if(${list_price_Global_currency}=0,0,${Tax_Amount_Local_Currency}/${list_price_Global_currency});;
  }

  dimension: Tax_Amount_Global_Currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Tax_Amount_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${Tax_Amount_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${Tax_Amount_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${billing_date_for_billing_index_and_printout_date},${Tax_Amount_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }



  dimension: sales_order_net_price_local_currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.SalesOrderNetPrice ;;
  }

  dimension: sales_order_net_price_Global_Currency {
    value_format: "0.00"
    type: number
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${sales_order_net_price_local_currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${creation_date_date},${sales_order_net_price_local_currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }



  dimension: sales_order_net_value_Local_Currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.SalesOrderNetValue ;;
  }

  measure: sum_sales_order_net_value {
    hidden: no
    type: sum
    sql: ${sales_order_net_value_Global_Currency} ;;
    link: {
      label: "Sales Performance by Product"
      url:"/dashboards/cortex_sap_operational::sales_performance_by_product?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
   }
  }

  measure: sum_sales_order_net_value_1 {
    hidden: no
    type: sum
    sql: ${sales_order_net_value_Global_Currency} ;;
    link: {
      label: "Sales Performance by Sales_Org"
      url:"/dashboards/cortex_sap_operational::sales_performance_by_sales_org?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
    }
  }

  measure: sum_sales_order_net_value_2 {
    hidden: no
    type: sum
    sql: ${sales_order_net_value_Global_Currency} ;;
    link: {
      label: "Sales Performance by Distribution Channel"
      url:"/dashboards/cortex_sap_operational::sales_performance_by_distribution_channel?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
    }
  }

  measure: sum_sales_order_net_value_3 {
    hidden: no
    type: sum
    sql: ${sales_order_net_value_Global_Currency} ;;
    link: {
      label: "Sales Performance by Division"
      url:"/dashboards/cortex_sap_operational::sales_performance_by_division?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
    }
  }

  dimension: Exchange_Rate_Sales_Net_Value{
    value_format: "0.00"
    type: number
    sql: if(${sales_order_net_value_Global_Currency}=0,0,${sales_order_net_value_Local_Currency}/${sales_order_net_value_Global_Currency});;
  }

  dimension: sales_order_net_value_Global_Currency {
    value_format: "0.00"
    type: number
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${sales_order_net_value_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${creation_date_date},${sales_order_net_value_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }

  dimension: delivery_sales_order {
    type: string
    sql: ${TABLE}.SalesOrderNumber ;;
  }

  dimension: sales_order_qty {
    type: number
    sql: ${TABLE}.SalesOrderQty ;;
  }

  measure: sum_sales_order_qty {
    type: sum
    sql: ${sales_order_qty};;
    drill_fields: [sales_order,sales_order_line_item, material_number, sales_order_qty,
      list_price_Local_Currency, adjusted_price_Local_Currency, discount_Local_currency]
  }

  dimension: sales_order_quantity {
    type: number
    sql: ${TABLE}.SalesOrderQuantity ;;
  }

  dimension: sales_order_value_Local_Currecny {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.SalesOrderValue ;;

  }

  dimension: Exchange_Rate_Sales_Value{
    value_format: "0.00"
    type: number
    sql: if(${Sales_Order_Value_Global_Currency}=0,0,${sales_order_value_Local_Currecny}/${Sales_Order_Value_Global_Currency});;
  }

  dimension: Sales_Order_Value_Global_Currency {
    value_format: "0.00"
    type: number
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${sales_order_value_Local_Currecny},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${creation_date_date},${sales_order_value_Local_Currecny})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }

  measure: sum_sales_order_value {
    type: sum
    sql: ${sales_order_value_Local_Currecny} ;;
    drill_fields: [sales_order,sales_order_line_item, material_number, sales_order_qty,
      list_price_Local_Currency, adjusted_price_Local_Currency, discount_Local_currency]
  }

  dimension: sales_orders_number {
    type: string
    sql: ${TABLE}.SalesOrderNumber ;;
  }


  dimension: sales_org_number {
    type: string
    sql: ${TABLE}.SalesOrganization ;;
  }

  dimension: sales_org {
    type: string
    sql: ${TABLE}.SalesOrganizationName ;;
  }

  dimension: list_price_Local_Currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.ListPrice ;;
  }

  dimension: variation_of_listprice_and_adjustedprice{
    value_format: "0.00"
    type: number
    sql: ${list_price_Global_currency}-${adjusted_price_Global_currency} ;;
  }

  measure: average_variation_of_listprice_and_adjustedprice {
    value_format: "0.00"
    type: average
    sql: ${list_price_Global_currency}-${adjusted_price_Global_currency} ;;
    # link: {
    #   label: "Price Adjustments based on Customer Profiling"
    #   url:"/dashboards/cortex_sap_operational::price_adjustments_based_on_customer_profiling?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
    # }
  }

  measure: average_list_price1{
    value_format: "0.00"
    type: average
    sql: ${list_price_Global_currency} ;;
    link: {
      label: "Price Adjustments based on Product Availability"
      url:"/dashboards/cortex_sap_operational::price_adjustments_based_on_product_availability?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
    }
  }

    measure: average_list_price2{
      value_format: "0.00"
      type: average
      sql: ${list_price_Global_currency} ;;
      link: {
        label: "Price Adjustments based on Customer Profiling"
        url:"/dashboards/cortex_sap_operational::price_adjustments_based_on_customer_profiling?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
      }
  }

  measure: average_adjusted_price{
    value_format: "0.00"
    type: average
    sql: ${adjusted_price_Global_currency} ;;
  }


  measure: average_intercompany_price {
    value_format: "0.00"
    type: average
    sql: ${intercompany_price_Global_currency} ;;
    link: {
      label: "Price Adjustments based on Product Availability"
      url:"/dashboards/cortex_sap_operational::price_adjustments_based_on_product_availability?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}"
    }
   }

  measure: average_discount{
    value_format: "0.00"
    type: average
    sql: ${discount_Global_currency} ;;
  }

  dimension: Exchange_Rate_Billing{
    value_format: "0.00"
    type: number
    sql: if(${list_price_Global_currency}=0,0,${list_price_Local_Currency}/${list_price_Global_currency});;
  }

  dimension: list_price_Global_currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${list_price_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${list_price_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${list_price_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${billing_date_for_billing_index_and_printout_date},cast(${list_price_Local_Currency} as numeric))),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }

  dimension: adjusted_price_Local_Currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.AdjustedPrice ;;
  }

  dimension: adjusted_price_Global_currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${adjusted_price_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${adjusted_price_Local_Currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${adjusted_price_Local_Currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${billing_date_for_billing_index_and_printout_date},cast(${adjusted_price_Local_Currency} as numeric))),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }

  dimension: discount_Local_currency {
    value_format: "0.00"
    type: number
    sql: ${TABLE}.Discount ;;
  }

  dimension: discount_Global_currency {
    value_format: "0.00"
    type: number
    #sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${discount_Local_currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${billing_date},${discount_Local_currency})),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %},${discount_Local_currency},@{FUNCTION_DATASET}.Currency_Conversion( ${Client_ID},'M',${Local_Currency_Key},{% parameter Currency_Required %},${billing_date_for_billing_index_and_printout_date},cast(${discount_Local_currency} as numeric))),ifnull(CAST(@{FUNCTION_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
    }

  dimension: delivery_date {
    type: date
    sql: ${TABLE}.DeliveryDate_LFDAT ;;
  }

  dimension: shipping_location {
    type: string
    sql: ${TABLE}.ShippingLocation ;;
  }

  dimension: Local_Currency_Key {
    type: string
    sql: ${TABLE}.SalesOrderDocumentCurrency_WAERK ;;
  }

  dimension:Local_Currency_Key_Billing{
    type: string
    sql: ${TABLE}.BillingDOcumentCurrencRK ;;
  }



  dimension: Global_Currency {
    type: string
    sql:  {% parameter Currency_Required %};;
  }

  dimension:Local_Currency_Key_Delivery{
    type: string
    sql: ${TABLE}.DeliveryDocumentCurrency_WAERK ;;
  }


  dimension: Exchange_Rate_Type {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  dimension:one_touch_order{
    type: string
    sql: ${TABLE}.OneTouchOrders ;;
  }

  measure: count_one_touch_order {
    type: count_distinct
    sql: ${one_touch_order} ;;
  }

  measure: percentage_one_touch_order {
    type: number
    sql: if(${count_incoming_order}=0,0,round(${count_one_touch_order}/${count_incoming_order}*100,2)) ;;
    #html:<a href="/dashboards/173?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}">{{value}}%</a> ;;
    html:<a href="/dashboards/cortex_sap_operational::one_touch_order?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}%</a> ;;
  }


  dimension: One_Touch_Order_Count {
    type: number
    sql: ${TABLE}.OneTouchOrderCount ;;



  }

  dimension: Client_ID {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: Language{
    type: string
    sql: ${TABLE}.CustomerLanguage ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
  measure: dash_nav {
    hidden: no
    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <div style="background-color: #FFFFFF; height:525px;width:100%"></div>
      <div style="background-color: #FFFFFF; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
        <nav style="font-size: 18px; color: #4285F4">

      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_02c_01_order_fulfillment_performance_tuning?">Order Fulfillment</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_02_order_status_snapshot?">Order Status Snapshot</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_03_order_detailsperformance_tuning?">Order Details</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_sales_performanceperformance_tuning?">Sales Performance</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_billing_and_pricing_v2?Year=2022%2F01%2F01%20to%202022%2F04%2F22&ampRegion=&Sales%20Org=&Distribution%20Channel=&Division=&Product=&ampCurrency=USD">Billing and Pricing</a>
        </nav>
      </div>
    <div style="background-color: #FFFFFF; height:500px;width:100%"></div>;;
  }

  measure: Sales_performance{
    type: string
    sql: "Home" ;;

    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_sales_performanceperformance_tuning?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;

  #  html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sales_performance?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&ampRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;

  }

  measure: Order_details{
    type: string
    sql: "Home" ;;

    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_03_order_detailsperformance_tuning?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;

   # html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::order_details?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&ampRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;

  }

  measure: Order_fulfillment{
    type: string
    sql: "Home" ;;

  #  html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::order_fulfillment?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;

    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_02c_01_order_fulfillment_performance_tuning?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&ampRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;
    }

  measure: Order_status_snapshot{
    type: string
    sql: "Home" ;;

    #html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::order_status_snapshot?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&AMPRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;

    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_02_order_status_snapshot?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&ampRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;
  }

  measure: billing_and_pricing{
    type: string
    sql: "Home" ;;

    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_billing_and_pricing_v2?Year=2022%2F01%2F01%20to%202022%2F04%2F22&ampRegion=&Sales%20Org=&Distribution%20Channel=&Division=&Product=&ampCurrency=USD">Home</nav>  ;;

  #  html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::billing_and_pricing?Distribution+Channel={{ _filters['data_intelligence_otc.distribution_channel']| url_encode }}&Sales+Org={{ _filters['data_intelligence_otc.sales_org']| url_encode }}&Division={{ _filters['data_intelligence_otc.division']| url_encode  }}&Product={{ _filters['data_intelligence_otc.product']| url_encode }}&ampRegion={{ _filters['data_intelligence_otc.country']| url_encode }}&Year={{ _filters['data_intelligence_otc.creation_date_date']| url_encode }}">{{value}}</a></nav>  ;;
  }

}
