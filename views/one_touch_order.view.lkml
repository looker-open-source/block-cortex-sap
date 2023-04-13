# The name of this view in Looker is "One Touch Order"
view: one_touch_order {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.OneTouchOrder`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Actual Billed Quantity Fkimg" in Explore.
  fields_hidden_by_default: yes
  dimension: actual_billed_quantity_fkimg {
    type: number
    sql: ${TABLE}.ActualBilledQuantity_FKIMG ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_actual_billed_quantity_fkimg {
    type: sum
    sql: ${actual_billed_quantity_fkimg} ;;
  }

  measure: average_actual_billed_quantity_fkimg {
    type: average
    sql: ${actual_billed_quantity_fkimg} ;;
  }

  dimension: one_touch_order_count {
    type: number
    sql: ${TABLE}.OneTouchOrderCount ;;
  }

  dimension: vbapclient_mandt {
    type: string
    primary_key: yes
    sql: ${TABLE}.VBAPClient_MANDT ;;
  }

  dimension: vbapsales_document_item_posnr {
    type: string
    primary_key: yes
    sql: ${TABLE}.VBAPSalesDocument_Item_POSNR ;;
  }

  dimension: vbapsales_document_vbeln {
    type: string
    primary_key: yes
    sql: ${TABLE}.VBAPSalesDocument_VBELN ;;
  }

  dimension: vbaptotal_order_kwmeng {
    type: number
    sql: ${TABLE}.VBAPTotalOrder_KWMENG ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
