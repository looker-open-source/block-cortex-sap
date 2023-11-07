view: sales_order_schedule_line_dt {
  derived_table: {
    sql: SELECT
          sales_order_schedule_line.Client_MANDT  AS sales_order_schedule_line_client_mandt,
          sales_order_schedule_line.SalesDocument_VBELN  AS sales_order_schedule_line_sales_document_vbeln,
          sales_order_schedule_line.SalesDocumentItem_POSNR  AS sales_order_schedule_line_sales_document_item_posnr,
          COALESCE(SUM(sales_order_schedule_line.ConfirmedQuantity_BMENG ), 0) AS sales_order_schedule_line_sum_confirmed_quantity_bmeng
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.SalesOrderScheduleLine`
           AS sales_order_schedule_line
      GROUP BY
          1,
          2,
          3
      ORDER BY
          4 DESC

       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${sales_order_schedule_line_client_mandt},${sales_order_schedule_line_sales_document_vbeln},${sales_order_schedule_line_sales_document_item_posnr}) ;;
  }

  dimension: sales_order_schedule_line_client_mandt {
    type: string
    sql: ${TABLE}.sales_order_schedule_line_client_mandt ;;
  }

  dimension: sales_order_schedule_line_sales_document_vbeln {
    type: string
    sql: ${TABLE}.sales_order_schedule_line_sales_document_vbeln ;;
  }

  dimension: sales_order_schedule_line_sales_document_item_posnr {
    type: string
    sql: ${TABLE}.sales_order_schedule_line_sales_document_item_posnr ;;
  }

  dimension: sales_order_schedule_line_sum_confirmed_quantity_bmeng {
    type: number
    sql: ${TABLE}.sales_order_schedule_line_sum_confirmed_quantity_bmeng ;;
  }

  set: detail {
    fields: [sales_order_schedule_line_client_mandt, sales_order_schedule_line_sales_document_vbeln, sales_order_schedule_line_sales_document_item_posnr, sales_order_schedule_line_sum_confirmed_quantity_bmeng]
  }
}
