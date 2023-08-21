view: materials_valuation_v2 {
  derived_table: {
    sql: select * from  `@{GCP_PROJECT}.@{REPORTING_DATASET}.MaterialLedger`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${material_number_matnr},${valuation_type_bwtar},${valuation_area_bwkey},${fiscal_year},${posting_period});;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: material_number_matnr {
    type: string
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: valuation_type_bwtar {
    type: string
    sql: ${TABLE}.ValuationType_BWTAR ;;
  }

  dimension: valuation_area_bwkey {
    type: string
    sql: ${TABLE}.ValuationArea_BWKEY ;;
  }

  dimension: price_unit_peinh {
    type: number
    sql: ${TABLE}.PriceUnit_PEINH ;;
  }

  dimension: posting_period {
    type: string
    sql: ${TABLE}.PostingPeriod ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.FiscalYear ;;
  }

  dimension: month_year {
    type: string
    hidden: no
    sql: concat(${fiscal_year},"/",${posting_period}) ;;
  }

  dimension: price_control_indicator_vprsv {
    type: string
    sql: ${TABLE}.PriceControlIndicator_VPRSV ;;
  }

  dimension: standard_cost_stprs {
    type: number
    sql: ${TABLE}.StandardCost_STPRS ;;
  }

  dimension: value_of_total_valuated_stock_salk3 {
    type: number
    sql: ${TABLE}.ValueOfTotalValuatedStock_SALK3 ;;
  }

  dimension: moving_average_price {
    type: number
    sql: ${TABLE}.MovingAveragePrice ;;
  }

  dimension: currency_key_waers {
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  set: detail {
    fields: [
      client_mandt,
      material_number_matnr,
      valuation_type_bwtar,
      valuation_area_bwkey,
      price_unit_peinh,
      posting_period,
      fiscal_year,
      price_control_indicator_vprsv,
      standard_cost_stprs,
      value_of_total_valuated_stock_salk3,
      moving_average_price,
      currency_key_waers
    ]
  }
}
