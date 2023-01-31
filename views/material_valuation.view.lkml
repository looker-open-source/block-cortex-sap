# The name of this view in Looker is "Material Valuation"
view: material_valuation {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.MaterialsValuation`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client Mandt" in Explore.
  fields_hidden_by_default: yes
  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: current_period_lfmon {
    type: string
    sql: ${TABLE}.CurrentPeriod_LFMON ;;
  }

  dimension: deletion_flag_for_all_material_data_of_valuation_type_lvorm {
    type: string
    sql: ${TABLE}.DeletionFlagForAllMaterialDataOfValuationType_LVORM ;;
  }

  dimension: fiscal_year_of_current_period_lfgja {
    type: string
    sql: ${TABLE}.FiscalYearOfCurrentPeriod_LFGJA ;;
  }

  dimension: material_number_matnr {
    type: string
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: periodic_unit_price_verpr {
    type: number
    sql: ${TABLE}.PeriodicUnitPrice_VERPR ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_periodic_unit_price_verpr {
    type: sum
    sql: ${periodic_unit_price_verpr} ;;
  }

  measure: average_periodic_unit_price_verpr {
    type: average
    sql: ${periodic_unit_price_verpr} ;;
  }

  dimension: price_control_indicator_vprsv {
    type: string
    sql: ${TABLE}.PriceControlIndicator_VPRSV ;;
  }

  dimension: price_unit_peinh {
    type: number
    sql: ${TABLE}.PriceUnit_PEINH ;;
  }

  dimension: standard_price_stprs {
    type: number
    sql: ${TABLE}.StandardPrice_STPRS ;;
    hidden: no
  }



  dimension: total_valuated_stock_lbkum {
    type: number
    sql: ${TABLE}.TotalValuatedStock_LBKUM ;;
  }

  dimension: valuation_area_bwkey {
    type: string
    sql: ${TABLE}.ValuationArea_BWKEY ;;
  }

  dimension: valuation_category_bwtty {
    type: string
    sql: ${TABLE}.ValuationCategory_BWTTY ;;
  }

  dimension: valuation_class_bklas {
    type: string
    sql: ${TABLE}.ValuationClass_BKLAS ;;
  }

  dimension: valuation_type_bwtar {
    type: string
    sql: ${TABLE}.ValuationType_BWTAR ;;
  }

  dimension: value_of_total_valuated_stock_salk3 {
    type: number
    sql: ${TABLE}.ValueOfTotalValuatedStock_SALK3 ;;
  }

  measure : Standrad_Price {
    type: number
    sql: ${standard_price_stprs} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
