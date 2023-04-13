# The name of this view in Looker is "Sales Order Header Status"
view: sales_order_header_status {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.SalesOrderHeaderStatus`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "At Least One of ID Items Not Yet Complete on Hold Hdals" in Explore.
  fields_hidden_by_default: yes
  dimension: at_least_one_of_id_items_not_yet_complete_on_hold_hdals {
    type: string
    sql: ${TABLE}.AtLeastOneOfIdItemsNotYetCompleteOnHold_HDALS ;;
  }

  dimension: billing_block_status_fsstk {
    type: string
    sql: ${TABLE}.BillingBlockStatus_FSSTK ;;
  }

  dimension: billing_incompletion_status_all_items_uvfas {
    type: string
    sql: ${TABLE}.BillingIncompletionStatusAllItems_UVFAS ;;
  }

  dimension: billing_incompletion_status_header_uvfak {
    type: string
    sql: ${TABLE}.BillingIncompletionStatusHeader_UVFAK ;;
  }

  dimension: billing_status_fkstk {
    type: string
    sql: ${TABLE}.BillingStatus_FKSTK ;;
  }

  dimension: billing_totals_status_for_intercompany_billing_fkivk {
    type: string
    sql: ${TABLE}.BillingTotalsStatusForIntercompanyBilling_FKIVK ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: changed_on_aedat {
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
    sql: ${TABLE}.ChangedOn_AEDAT ;;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: confirmation_status_bestk {
    type: string
    sql: ${TABLE}.ConfirmationStatus_BESTK ;;
  }

  dimension: confirmation_status_for_ale_costa {
    type: string
    sql: ${TABLE}.ConfirmationStatusForAle_COSTA ;;
  }

  dimension: credit_check_data_is_obsolete_cmpsm {
    type: string
    sql: ${TABLE}.CreditCheckDataIsObsolete_CMPSM ;;
  }

  dimension: custmer_reserves4_header_status_uvk04 {
    type: string
    sql: ${TABLE}.CustmerReserves4HeaderStatus_UVK04 ;;
  }

  dimension: customer_reserves1_header_status_uvk01 {
    type: string
    sql: ${TABLE}.CustomerReserves1HeaderStatus_UVK01 ;;
  }

  dimension: customer_reserves1_sum_of_all_items_uvs01 {
    type: string
    sql: ${TABLE}.CustomerReserves1SumOfAllItems_UVS01 ;;
  }

  dimension: customer_reserves2_header_status_uvk02 {
    type: string
    sql: ${TABLE}.CustomerReserves2HeaderStatus_UVK02 ;;
  }

  dimension: customer_reserves2_sum_of_all_items_uvs02 {
    type: string
    sql: ${TABLE}.CustomerReserves2SumOfAllItems_UVS02 ;;
  }

  dimension: customer_reserves3_header_status_uvk03 {
    type: string
    sql: ${TABLE}.CustomerReserves3HeaderStatus_UVK03 ;;
  }

  dimension: customer_reserves3_sum_of_all_items_uvs03 {
    type: string
    sql: ${TABLE}.CustomerReserves3SumOfAllItems_UVS03 ;;
  }

  dimension: customer_reserves4_sum_of_all_items_uvs04 {
    type: string
    sql: ${TABLE}.CustomerReserves4SumOfAllItems_UVS04 ;;
  }

  dimension: customer_reserves5_header_status_uvk05 {
    type: string
    sql: ${TABLE}.CustomerReserves5HeaderStatus_UVK05 ;;
  }

  dimension: customer_reserves5_sum_of_all_items_uvs05 {
    type: string
    sql: ${TABLE}.CustomerReserves5SumOfAllItems_UVS05 ;;
  }

  dimension: delay_status_dcstk {
    type: string
    sql: ${TABLE}.DelayStatus_DCSTK ;;
  }

  dimension: delivery_incompletion_status_all_items_uvvls {
    type: string
    sql: ${TABLE}.DeliveryIncompletionStatusAllItems_UVVLS ;;
  }

  dimension: delivery_incompletion_status_header_uvvlk {
    type: string
    sql: ${TABLE}.DeliveryIncompletionStatusHeader_UVVLK ;;
  }

  dimension: delivery_status_lfstk {
    type: string
    sql: ${TABLE}.DeliveryStatus_LFSTK ;;
  }

  dimension: distribution_status_decentralized_warehouse_processing_vlstk {
    type: string
    sql: ${TABLE}.DistributionStatusDecentralizedWarehouseProcessing_VLSTK ;;
  }

  dimension: document_category_vbtyp {
    type: string
    sql: ${TABLE}.DocumentCategory_VBTYP ;;
  }

  dimension: extension_of_sd_document_category_vbtyp_ext {
    type: string
    sql: ${TABLE}.ExtensionOfSdDocumentCategory_VBTYP_EXT ;;
  }

  dimension: handling_unit_placed_in_stock_vestk {
    type: string
    sql: ${TABLE}.HandlingUnitPlacedInStock_VESTK ;;
  }

  dimension: header_incomplete_status_for_packaging_uvpak {
    type: string
    sql: ${TABLE}.HeaderIncompleteStatusForPackaging_UVPAK ;;
  }

  dimension: header_incomplete_status_for_picking_putaway_uvpik {
    type: string
    sql: ${TABLE}.HeaderIncompleteStatusForPickingPutaway_UVPIK ;;
  }

  dimension: inbound_delivery_header_not_yet_complete_on_hold_hdall {
    type: string
    sql: ${TABLE}.InboundDeliveryHeaderNotYetCompleteOnHold_HDALL ;;
  }

  dimension: incompletion_status_all_items_uvals {
    type: string
    sql: ${TABLE}.IncompletionStatusAllItems_UVALS ;;
  }

  dimension: incompletion_status_header_uvall {
    type: string
    sql: ${TABLE}.IncompletionStatusHeader_UVALL ;;
  }

  dimension: indicator_document_preselected_for_archiving_block {
    type: string
    sql: ${TABLE}.IndicatorDocumentPreselectedForArchiving_BLOCK ;;
  }

  dimension: invoice_list_status_of_billing_document_relik {
    type: string
    sql: ${TABLE}.InvoiceListStatusOfBillingDocument_RELIK ;;
  }

  dimension: manual_completion_of_contract_manek {
    type: string
    sql: ${TABLE}.ManualCompletionOfContract_MANEK ;;
  }

  dimension: order_related_billing_status_all_items_fksak {
    type: string
    sql: ${TABLE}.OrderRelatedBillingStatusAllItems_FKSAK ;;
  }

  dimension: overall_allocation_status_sales_document_header_fsh_ar_stat_hdr {
    type: string
    sql: ${TABLE}.OverallAllocationStatusSalesDocumentHeader_FSH_AR_STAT_HDR ;;
  }

  dimension: overall_block_status_header_spstg {
    type: string
    sql: ${TABLE}.OverallBlockStatusHeader_SPSTG ;;
  }

  dimension: overall_delivery_block_status_all_items_lsstk {
    type: string
    sql: ${TABLE}.OverallDeliveryBlockStatusAllItems_LSSTK ;;
  }

  dimension: overall_delivery_status_lfgsk {
    type: string
    sql: ${TABLE}.OverallDeliveryStatus_LFGSK ;;
  }

  dimension: overall_packing_status_of_all_items_pkstk {
    type: string
    sql: ${TABLE}.OverallPackingStatusOfAllItems_PKSTK ;;
  }

  dimension: overall_picking_putaway_status_kostk {
    type: string
    sql: ${TABLE}.OverallPickingPutawayStatus_KOSTK ;;
  }

  dimension: overall_processing_status_gbstk {
    type: string
    sql: ${TABLE}.OverallProcessingStatus_GBSTK ;;
    hidden: no
  }

  dimension: return_order_status {
    type: string
    hidden: no
    sql: case
          when ${overall_processing_status_gbstk}='A' THEN 'Not yet Processed'
          when ${overall_processing_status_gbstk}='B' THEN 'Partially Processed'
          when ${overall_processing_status_gbstk}='C' THEN 'Completely Processed'
          else 'Not relevant'
        end;;
  }

  dimension: overall_reference_status_all_items_rfgsk {
    type: string
    sql: ${TABLE}.OverallReferenceStatusAllItems_RFGSK ;;
  }

  dimension: overall_status_of_credit_checks_cmgst {
    type: string
    sql: ${TABLE}.OverallStatusOfCreditChecks_CMGST ;;
  }

  dimension: overall_status_of_warehouse_management_activities_lvstk {
    type: string
    sql: ${TABLE}.OverallStatusOfWarehouseManagementActivities_LVSTK ;;
  }

  dimension: pod_status_on_header_level_pdstk {
    type: string
    sql: ${TABLE}.PodStatusOnHeaderLevel_PDSTK ;;
  }

  dimension: post_header_incomplete_status_for_goods_movement_uvwak {
    type: string
    sql: ${TABLE}.PostHeaderIncompleteStatusForGoodsMovement_UVWAK ;;
  }

  dimension: posting_status_of_billing_document_buchk {
    type: string
    sql: ${TABLE}.PostingStatusOfBillingDocument_BUCHK ;;
  }

  dimension: pricing_incompletion_status_all_items_uvprs {
    type: string
    sql: ${TABLE}.PricingIncompletionStatusAllItems_UVPRS ;;
  }

  dimension: reference_document_header_status_rfstk {
    type: string
    sql: ${TABLE}.ReferenceDocumentHeaderStatus_RFSTK ;;
  }

  dimension: rejections_status_abstk {
    type: string
    sql: ${TABLE}.RejectionsStatus_ABSTK ;;
  }

  dimension: revenue_determination_status_rrsta {
    type: string
    sql: ${TABLE}.RevenueDeterminationStatus_RRSTA ;;
  }

  dimension: sales_document_vbeln {
    type: string
    sql: ${TABLE}.SalesDocument_VBELN ;;
  }

  dimension: sap_release_saprl {
    type: string
    sql: ${TABLE}.SapRelease_SAPRL ;;
  }

  dimension: sd_document_object_vbobj {
    type: string
    sql: ${TABLE}.SdDocumentObject_VBOBJ ;;
  }

  dimension: status_funds_management_fmstk {
    type: string
    sql: ${TABLE}.StatusFundsManagement_FMSTK ;;
  }

  dimension: status_of_credit_check_against_customer_review_date_cmpse {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstCustomerReviewDate_CMPSE ;;
  }

  dimension: status_of_credit_check_against_export_credit_insurance_cmpsj {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstExportCreditInsurance_CMPSJ ;;
  }

  dimension: status_of_credit_check_against_financial_document_cmpsi {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstFinancialDocument_CMPSI ;;
  }

  dimension: status_of_credit_check_against_highest_dunning_level_cmpsh {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstHighestDunningLevel_CMPSH ;;
  }

  dimension: status_of_credit_check_against_maximum_document_value_cmpsc {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstMaximumDocumentValue_CMPSC ;;
  }

  dimension: status_of_credit_check_against_oldest_open_items_cmpsg {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstOldestOpenItems_CMPSG ;;
  }

  dimension: status_of_credit_check_against_open_items_due_cmpsf {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstOpenItemsDue_CMPSF ;;
  }

  dimension: status_of_credit_check_against_payment_card_authorization_cmpsk {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstPaymentCardAuthorization_CMPSK ;;
  }

  dimension: status_of_credit_check_against_terms_of_payment_cmpsd {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckAgainstTermsOfPayment_CMPSD ;;
  }

  dimension: status_of_credit_check_for_customer_reserve1_cmps0 {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckForCustomerReserve1_CMPS0 ;;
  }

  dimension: status_of_credit_check_for_customer_reserve2_cmps1 {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckForCustomerReserve2_CMPS1 ;;
  }

  dimension: status_of_credit_check_for_customer_reserve3_cmps2 {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckForCustomerReserve3_CMPS2 ;;
  }

  dimension: status_of_credit_check_of_reserves4_cmpsl {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckOfReserves4_CMPSL ;;
  }

  dimension: status_of_credit_check_sap_credit_management_cmps_cm {
    type: string
    sql: ${TABLE}.StatusOfCreditCheckSapCreditManagement_CMPS_CM ;;
  }

  dimension: status_of_dynamic_credit_limit_check_in_the_credit_horizon_cmpsb {
    type: string
    sql: ${TABLE}.StatusOfDynamicCreditLimitCheckInTheCreditHorizon_CMPSB ;;
  }

  dimension: status_of_pick_confirmation_koquk {
    type: string
    sql: ${TABLE}.StatusOfPickConfirmation_KOQUK ;;
  }

  dimension: status_of_static_credit_limit_check_cmpsa {
    type: string
    sql: ${TABLE}.StatusOfStaticCreditLimitCheck_CMPSA ;;
  }

  dimension: status_of_technical_error_sap_credit_management_cmps_te {
    type: string
    sql: ${TABLE}.StatusOfTechnicalErrorSapCreditManagement_CMPS_TE ;;
  }

  dimension: temporary_inbound_delivery_spe_tmpid {
    type: string
    sql: ${TABLE}.TemporaryInboundDelivery_SPE_TMPID ;;
  }

  dimension: total_goods_movement_status_wbstk {
    type: string
    sql: ${TABLE}.TotalGoodsMovementStatus_WBSTK ;;
  }

  dimension: total_incomplete_status_of_all_items_post_goods_movement_uvwas {
    type: string
    sql: ${TABLE}.TotalIncompleteStatusOfAllItemsPostGoodsMovement_UVWAS ;;
  }

  dimension: totals_incomplete_status_for_all_items_packaging_uvpas {
    type: string
    sql: ${TABLE}.TotalsIncompleteStatusForAllItemsPackaging_UVPAS ;;
  }

  dimension: totals_incomplete_status_for_all_items_picking_uvpis {
    type: string
    sql: ${TABLE}.TotalsIncompleteStatusForAllItemsPicking_UVPIS ;;
  }

  dimension: transportation_planning_status_header_trsta {
    type: string
    sql: ${TABLE}.TransportationPlanningStatusHeader_TRSTA ;;
  }

  dimension: unused_uvgek {
    type: string
    sql: ${TABLE}.Unused_UVGEK ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
