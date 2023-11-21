view: inventory_by_plant {
  derived_table: {
    sql: select * from `@{GCP_PROJECT}.@{REPORTING_DATASET}.InventoryByPlant`;;
  }
  
  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${material_number_matnr},${plant_werks},${batch_number_charg},${storage_location_lgort},${company_code_bukrs},${stock_characteristic},${cal_year},${cal_week});;
  }

  dimension: amount_in_local_currency_dmbtr {
    type: number
    sql: ${TABLE}.AmountInLocalCurrency_DMBTR ;;
  }

  dimension: obsolete_value {
    type: number
    sql: ${TABLE}.ObsoleteInventoryValue ;;
  }

  measure: sum_obsolete_value {
    type: sum
    sql: ${obsolete_value} ;;
    value_format_name: Greek_Number_Format
  }

  measure: total_amount_in_local_currency_dmbtr {
    type: sum
    sql: ${amount_in_local_currency_dmbtr} ;;
  }

  measure: average_amount_in_local_currency_dmbtr {
    type: average
    sql: ${amount_in_local_currency_dmbtr} ;;
  }

  dimension: target_currency {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
    hidden: no
  }

  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.ExchangeRate_UKURS ;;
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

  dimension: fiscal_month_year {
    type: string
    sql: concat(${fiscal_period}, "-"  ,${fiscal_year}) ;;
  }


  measure: sum_stock_quantity {
    type: sum
    sql: ${quantity_menge} ;;
    value_format_name: Greek_Number_Format
  }


  dimension: base_unit_of_measure_meins {
    type: string
    label: "Unit of Measure"
    sql: ${TABLE}.BaseUnitOfMeasure_MEINS ;;
    hidden: no
  }

  dimension: batch_number_charg {
    type: string
    sql: ${TABLE}.BatchNumber_CHARG ;;
    hidden: no
  }

  dimension: cal_week {
    type: number
    sql: ${TABLE}.CalWeek ;;
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

  dimension: language_spras {
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
  }

  dimension: company_code_bukrs {
    type: string
    label: "Company Code"
    sql: ${TABLE}.CompanyCode_BUKRS ;;
    hidden: no
  }

  dimension: company_text_butxt {
    type: string
    label: "Company Name"
    sql: ${TABLE}.CompanyText_BUTXT ;;
    hidden: no
  }

  dimension: country_key_land1 {
    type: string
    sql: ${TABLE}.CountryKey_LAND1 ;;
    hidden: no
  }

  dimension: currency_key_waers {
    type: string
    label: "Currency"
    sql: ${TABLE}.CurrencyKey_WAERS ;;
    hidden: no
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_of_manufacture_hsdat {
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
    sql: ${TABLE}.DateOfManufacture_HSDAT ;;
  }

  dimension: description_of_material_type_mtbez {
    type: string
    label: "Material Type"
    sql: ${TABLE}.DescriptionOfMaterialType_MTBEZ ;;
    hidden: no
  }

  dimension: division_for_intercompany_billing_spart {
    type: string
    sql: ${TABLE}.DivisionForIntercompanyBilling_SPART ;;
  }

  dimension: inventory_value {
    type: number
    #label: "Inventory Value"
    sql: ${TABLE}.InventoryValueInSourceCurrency ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  dimension: inventory_value_target_currency {
    type: number
    sql: ${TABLE}.InventoryValueInTargetCurrency ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_inventory_value_target_currency {
    type: sum
    sql: ${inventory_value_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
    link: {
      label: "Stock Value Details"
      url: "/dashboards/cortex_sap_operational::stock_value_details?Company+Name={{ _filters['inventory_by_plant.company_text_butxt']| url_encode }}&Currency={{ _filters['inventory_by_plant.target_currency']| url_encode }}&Plant={{ _filters['inventory_by_plant.plant_name_name2']| url_encode }}&Material={{ _filters['inventory_by_plant.material_text_maktx']| url_encode }}&Country={{ _filters['inventory_by_plant.country_key_land1']| url_encode }}&Material+Type={{ _filters['inventory_by_plant.description_of_material_type_mtbez']| url_encode }}&Stock+Type={{ _filters['inventory_by_plant.stock_characteristic']| url_encode }}"
    }
  }

  measure: sum_inventory_value_target_currency_for_plant {
    type: sum
    sql: ${inventory_value_target_currency} ;;
    value_format_name: Greek_Number_Format
    hidden: no
  }

  measure: sum_stock_value {
    type: sum
    sql: ${inventory_value} ;;
    value_format_name: Greek_Number_Format
    drill_fields: [company_code_bukrs,plant_name_name2,storage_location_text_lgobe,material_number_matnr,material_text_maktx,description_of_material_type_mtbez,stock_characteristic,quantity_menge,base_unit_of_measure_meins,inventory_value,currency_key_waers]
  }



  measure: sum_stock_value_1 {
    type: sum
    sql: ${inventory_value} ;;
    value_format_name: Greek_Number_Format
  }


  dimension: material_group_matkl {
    type: string
    sql: ${TABLE}.MaterialGroup_MATKL ;;
  }

  dimension: material_group_description{
    type: string
    sql: ${TABLE}.MaterialGroupName_WGBEZ ;;
  }

  dimension: material_number_matnr {
    type: string
    label: "Material Number"
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: material_text_maktx {
    type: string
    label: "Material Name"
    sql: ${TABLE}.MaterialText_MAKTX ;;
    hidden: no
  }

  dimension: material_name {
    type: string
    sql: ${TABLE}.MaterialText_MAKTX ;;
  }

  dimension: material_type_mtart {
    type: string
    sql: ${TABLE}.MaterialType_MTART ;;
  }

  dimension: obsolete_stock {
    type: number
    sql: ${TABLE}.ObsoleteStock ;;
  }

  dimension: obsolete_value_target_currency {
    type: number
    sql: ${TABLE}.ObsoleteInventoryValueInTargetCurrency ;;
  }

  measure: sum_obsolete_value_target_currency {
    type: sum
    sql: ${obsolete_value_target_currency} ;;
    filters: [obsolete_value_target_currency: ">0"]
    value_format_name: Greek_Number_Format
    hidden: no
    drill_fields: [material_name,sum_obsolete_value_target_currency]
  }

  measure: sum_Obsolete_inventory {
    type: sum
    sql: ${obsolete_stock} ;;
    value_format_name: Greek_Number_Format
  }

  dimension: periodic_unit_price_verpr {
    type: number
    sql: ${TABLE}.PeriodicUnitPrice_VERPR ;;
  }

  dimension: plant_name_name2 {
    type: string
    label: "Plant Name"
    sql: ${TABLE}.PlantName_NAME2 ;;
    hidden: no
  }

  dimension: plant_werks {
    type: string
    sql: ${TABLE}.Plant_WERKS ;;
  }

  dimension: quantity_menge {
    type: number
    label: "Quantity"
    sql: ${TABLE}.QuantityWeeklyCumulative ;;
    hidden: no
  }

  dimension: safety_stock_eisbe {
    type: number
    sql: ${TABLE}.SafetyStock_EISBE ;;
  }

  dimension: standard_price_stprs {
    type: number
    sql: ${TABLE}.StandardPrice_STPRS ;;
  }

  dimension: stock_characteristic {
    type: string
    label: "Stock Characteristic"
    sql: ${TABLE}.StockCharacteristic ;;
    hidden: no
  }

  dimension: storage_location_lgort {
    type: string
    sql: ${TABLE}.StorageLocation_LGORT ;;
  }

  dimension: storage_location_text_lgobe {
    type: string
    label: "Storage Location"
    sql: ${TABLE}.StorageLocationText_LGOBE ;;
    hidden: no
  }

  dimension: total_shelf_life_mhdhb {
    type: number
    sql: ${TABLE}.TotalShelfLife_MHDHB ;;
  }

  dimension: valuation_area_bwkey {
    type: string
    sql: ${TABLE}.ValuationArea_BWKEY ;;
  }

  dimension_group: week_end {
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
    sql: ${TABLE}.WeekEndDate ;;
    hidden: no
  }
  
  measure: count {
    type: count
    drill_fields: []
  }
}
