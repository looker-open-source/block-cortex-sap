view: inventory_metrics_overview {
  derived_table: {
    sql: select * from `@{GCP_PROJECT}.@{REPORTING_DATASET}.InventoryKeyMetrics`
      ;;
  }
  
  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${material_number_matnr},${plant_werks},${cal_year},${cal_month});;
  }

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR ;;
  }

  measure: total_amount_in_local_currency_dmbtr {
    type: sum
    sql: ${amount_in_local_currency_dmbtr} ;;
  }

  measure: average_amount_in_local_currency_dmbtr {
    type: average
    sql: ${amount_in_local_currency_dmbtr} ;;
  }

  dimension: cal_month {
    type: number
    sql: ${TABLE}.CalMonth ;;
  }

  dimension: cal_year {
    type: number
    sql: ${TABLE}.CalYear ;;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
    #primary_key: yes
  }

  dimension: company_code_bukrs {
    type: string
    sql: ${TABLE}.CompanyCode_BUKRS ;;
    label: "Company Code"
    #primary_key: yes
    hidden: no
  }

  dimension: company_text_butxt {
    type: string
    label: "Company Name"
    sql: ${TABLE}.CompanyText_BUTXT ;;
    hidden: no
  }

  dimension: target_currency {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
    hidden: no
  }

  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.ExchangeRate_UKURS ;;
  }

  dimension: cost_of_goods_sold {
    type: number
    sql: ${TABLE}.CostOfGoodsSold ;;
  }

  dimension: cost_of_goods_sold_as_of_key_date {
    type: number
    sql: ${TABLE}.CostOfGoodsSoldByMonth ;;
  }

  dimension: country_key_land1 {
    type: string
    sql: ${TABLE}.CountryKey_LAND1 ;;
    hidden: no
  }

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: days_of_supply {
    type: number
    value_format: "0"
    sql: ${TABLE}.DaysOfSupplyAsOfToday ;;
    hidden: no
  }

  measure: average_days_of_supply {
    type: average
    sql:  ${days_of_supply} ;;
    label: "Days Of Supply"
    value_format: "0"
    filters: [days_of_supply : ">=0"]
    drill_fields: [material_group_name_wgbez,material_type,material_number_matnr,material_text_maktx,average_days_of_supply]
    hidden: no
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.FiscalPeriod ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.FiscalYear ;;
  }

  dimension: inventory_turn {
    type: number
    sql: ${TABLE}.InventoryTurnByMonth ;;
  }

  measure: drill_fields{
    type: sum
    sql: 0 ;;
    drill_fields: [material_group_name_wgbez,plant_name2_name2,material_text_maktx,average_inventory_turn]
  }


  measure: average_inventory_turn {
    type: average
    label: "Inventory Turn"
    sql: ${inventory_turn} ;;
    link: {
      label: "{{ inventory_metrics_overview.material_group_name_wgbez._value }}"
      url: "{{drill_fields._link}}"
    }
    hidden: no
    filters: [inventory_turn: ">=0"]
    #drill_fields: [material_group_name_wgbez,plant_name2_name2,material_text_maktx,average_inventory_turn]
  }

  measure: sum_inventory_turn {
    type: number
    sql: sum(${inventory_turn}) ;;
  }

  dimension: language_spras {
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
  }

  dimension: material_group_matkl {
    type: string
    sql: ${TABLE}.MaterialGroup_MATKL ;;
    hidden: no
  }

  dimension: material_group_name_wgbez {
    type: string
    label: "Material Group"
    sql: ${TABLE}.MaterialGroupName_WGBEZ ;;
    hidden: no
  }

  dimension: material_number_matnr {
    type: string
    label: "Material Number"
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: material_text_maktx {
    type: string
    sql: ${TABLE}.MaterialText_MAKTX ;;
    label: "Material Name"
    hidden: no
  }

  dimension: material_name {
    type: string
    label: "Material"
    sql: ${TABLE}.MaterialText_MAKTX ;;
    hidden: no
  }

  dimension: material_type_mtart {
    type: string
    sql: ${TABLE}.MaterialType_MTART ;;
    hidden: no
  }

  dimension: material_type {
    type: string
    sql: ${TABLE}.DescriptionOfMaterialType_MTBEZ ;;
    hidden: no
  }

  dimension_group: month_end {
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
    sql: ${TABLE}.MonthEndDate ;;
    hidden: no
  }

  dimension: plant_name2_name2 {
    type: string
    sql: ${TABLE}.Plant_Name2_NAME2 ;;
    label: "Plant Name"
    hidden: no
  }

  dimension: plant_werks {
    type: string
    sql: ${TABLE}.Plant_WERKS ;;
  }

  dimension: quantity_issued_to_delivery {
    type: number
    sql: ${TABLE}.QuantityIssuedToDelivery ;;
  }

  dimension: quantity_menge {
    type: number
    sql: ${TABLE}.QuantityMonthlyCumulative ;;
  }

  dimension: quantity_issued_to_delivery_for_previous_month {
    type: number
    sql: ${TABLE}.QuantityIssuedToDeliveryByMonth ;;
  }

  dimension: inventory_value {
    type: number
    sql: ${TABLE}.InventoryValue ;;
  }

  dimension: inventory_value_target_currency {
    type: number
    sql: ${TABLE}.InventoryValueInTargetCurrency ;;
  }

  measure: sum_inventory_value_target_currency {
    type: sum
    sql: ${inventory_value_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Stock Value Details"
      url: "/dashboards/cortex_sap_operational::stock_value_details?Company+Name={{ _filters['inventory_metrics_overview.company_text_butxt']| url_encode }}&Currency={{ _filters['inventory_metrics_overview.target_currency']| url_encode }}&Plant={{ _filters['inventory_metrics_overview.plant_name2_name2']| url_encode }}&Material={{ _filters['inventory_metrics_overview.material_text_maktx']| url_encode }}&Country={{ _filters['inventory_metrics_overview.country_key_land1']| url_encode }}&Stock+Type={{ _filters['inventory_by_plant.stock_characteristic']| url_encode }}&Material+Type={{ _filters['inventory_metrics_overview.material_type']| url_encode }}"
    }
  }

  dimension: inventory_for_previous_two_months {
    type: number
    sql: ${TABLE}.InventoryByMonth ;;
  }

  dimension: avg_inventory_for_previous_two_months {
    type: number
    sql: ${TABLE}.AvgInventoryByMonth ;;
  }



  measure: sum_inventory_value {
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${inventory_value} ;;
    hidden: no
  }

  dimension: slow_moving_inventory {
    type: number
    sql: ${TABLE}.SlowMovingInventoryAsOfPreviousMonth ;;
  }

  dimension: slow_moving_inventory_target_currency {
    type: number
    sql: ${TABLE}.SlowMovingInventoryAsOfPreviousMonthInTargetCurrency ;;
  }

  measure: sum_slow_moving_inventory_target_currency {
    type: sum
    sql: ${slow_moving_inventory_target_currency} ;;
    filters: [slow_moving_inventory_target_currency : ">0"]
    hidden: no
    value_format_name: Greek_Number_Format
    drill_fields: [material_name,sum_slow_moving_inventory_target_currency]
  }

  measure: sum_slow_moving_inventory {
    type: sum
    sql: ${slow_moving_inventory} ;;
    #value_format_name: Greek_Number_Format
  }

  dimension: stock_on_hand {
    type: number
    sql: ${TABLE}.StockOnHand ;;
  }

  dimension: total_consumption_quantity {
    type: number
    sql: ${TABLE}.TotalConsumptionQuantity ;;
  }

  dimension: unit_of_measure_meins {
    type: string
    sql: ${TABLE}.UnitOfMeasure_MEINS ;;
  }

  dimension: value_of_total_valuated_stock_salk3 {
    type: number
    sql: ${TABLE}.ValueOfTotalValuatedStock_SALK3 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
