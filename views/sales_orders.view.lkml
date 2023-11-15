# The name of this view in Looker is "Sales Orders V2"
view: sales_orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.SalesOrders_V2`
    ;;

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Account Assignment Category Knttp" in Explore.

  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${item_posnr},${sales_document_vbeln});;
  }

  dimension: account_assignment_category_knttp {
    type: string
    sql: ${TABLE}.AccountAssignmentCategory_KNTTP ;;
  }

  dimension: account_assignment_group_for_this_material_ktgrm {
    type: string
    sql: ${TABLE}.AccountAssignmentGroupForThisMaterial_KTGRM ;;
  }

  dimension: agreement_knuma {
    type: string
    sql: ${TABLE}.Agreement_KNUMA ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: agreement_valid_from_guebg {
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
    sql: ${TABLE}.AgreementValidFrom_GUEBG ;;
  }

  dimension_group: agreement_valid_to_gueen {
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
    sql: ${TABLE}.AgreementValidTo_GUEEN ;;
  }

  dimension: allocation_indicator_vpzuo {
    type: string
    sql: ${TABLE}.AllocationIndicator_VPZUO ;;
  }

  dimension: allowed_deviation_absfz {
    type: number
    sql: ${TABLE}.AllowedDeviation_ABSFZ ;;
  }

  dimension: allowed_deviation_percent_kbver {
    type: number
    sql: ${TABLE}.AllowedDeviationPercent_KBVER ;;
  }

  dimension: alternative_for_item_grpos {
    type: string
    sql: ${TABLE}.AlternativeForItem_GRPOS ;;
  }

  dimension: alternative_tax_classification_taxk1 {
    type: string
    sql: ${TABLE}.AlternativeTaxClassification_TAXK1 ;;
  }

  dimension: approval_block_msr_approv_block {
    type: string
    sql: ${TABLE}.ApprovalBlock_MSR_APPROV_BLOCK ;;
  }

  dimension: assignment_number_zuonr {
    type: string
    sql: ${TABLE}.AssignmentNumber_ZUONR ;;
  }

  dimension: assortment_module_skopf {
    type: string
    sql: ${TABLE}.AssortmentModule_SKOPF ;;
  }

  dimension: base_target_conversion_factor_umziz {
    type: number
    sql: ${TABLE}.BaseTargetConversionFactor_UMZIZ ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_base_target_conversion_factor_umziz {
    type: sum
    sql: ${base_target_conversion_factor_umziz} ;;
  }

  measure: average_base_target_conversion_factor_umziz {
    type: average
    sql: ${base_target_conversion_factor_umziz} ;;
  }

  dimension: base_unit_of_measure_for_product_group_prbme {
    type: string
    sql: ${TABLE}.BaseUnitOfMeasureForProductGroup_PRBME ;;
  }

  dimension: base_unit_of_measure_meins {
    type: string
    sql: ${TABLE}.BaseUnitOfMeasure_MEINS ;;
    hidden: no
  }

  dimension: batch_management_indicator_xchar {
    type: string
    sql: ${TABLE}.BatchManagementIndicator_XCHAR ;;
  }

  dimension: batch_management_requirement_indicator_xchpf {
    type: string
    sql: ${TABLE}.BatchManagementRequirementIndicator_XCHPF ;;
  }

  dimension: batch_number_charg {
    type: string
    sql: ${TABLE}.BatchNumber_CHARG ;;
  }

  dimension: batch_split_allowed_chspl {
    type: string
    sql: ${TABLE}.BatchSplitAllowed_CHSPL ;;
  }

  dimension: billing_block_faksk {
    type: string
    sql: ${TABLE}.BillingBlock_FAKSK ;;
  }

  dimension: billing_block_for_item_faksp {
    type: string
    sql: ${TABLE}.BillingBlockForItem_FAKSP ;;
  }

  dimension: bom_stlnr {
    type: string
    sql: ${TABLE}.BOM_STLNR ;;
  }

  dimension: bomcategory_stlty {
    type: string
    sql: ${TABLE}.BOMCategory_STLTY ;;
  }

  dimension_group: bomdate_stdat {
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
    sql: ${TABLE}.BOMDate_STDAT ;;
  }

  dimension: bomexplosion_number_sernr {
    type: string
    sql: ${TABLE}.BOMExplosionNumber_SERNR ;;
  }

  dimension: bomitem_level_uepos {
    type: string
    sql: ${TABLE}.BOMItemLevel_UEPOS ;;
  }

  dimension: bomitem_node_number_stlkn {
    type: string
    sql: ${TABLE}.BOMItemNodeNumber_STLKN ;;
  }

  dimension: bomitem_number_sposn {
    type: string
    sql: ${TABLE}.BOMItemNumber_SPOSN ;;
  }

  dimension: bomorigin_stkey {
    type: string
    sql: ${TABLE}.BOMOrigin_STKEY ;;
  }

  dimension: business_area_gsber {
    type: string
    sql: ${TABLE}.BusinessArea_GSBER ;;
  }

  dimension: business_area_hdr_gsber {
    type: string
    sql: ${TABLE}.BusinessAreaHdr_GSBER ;;
  }

  dimension: business_transaction_type_for_foreign_trade_exart {
    type: string
    sql: ${TABLE}.BusinessTransactionTypeForForeignTrade_EXART ;;
  }

  dimension: cash_discount_indicator_sktof {
    type: string
    sql: ${TABLE}.CashDiscountIndicator_SKTOF ;;
  }

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

  dimension: checking_group_for_availability_check_mtvfp {
    type: string
    sql: ${TABLE}.CheckingGroupForAvailabilityCheck_MTVFP ;;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
    ##primary_key: yes
    hidden:no
  }

  dimension: collective_number_submi {
    type: string
    sql: ${TABLE}.CollectiveNumber_SUBMI ;;
  }

  dimension: commission_group_provg {
    type: string
    sql: ${TABLE}.CommissionGroup_PROVG ;;
  }

  dimension: company_code_to_be_billed_bukrs_vf {
    type: string
    sql: ${TABLE}.CompanyCodeToBeBilled_BUKRS_VF ;;
  }

  dimension: complete_delivery_flag_autlf {
    type: string
    sql: ${TABLE}.CompleteDeliveryFlag_AUTLF ;;
  }

  dimension: completion_rule_for_quotation_erlre {
    type: string
    sql: ${TABLE}.CompletionRuleForQuotation_ERLRE ;;
  }

  dimension: component_quantity_kmpmg {
    type: number
    sql: ${TABLE}.ComponentQuantity_KMPMG ;;
  }

  dimension: condition_number_knumv {
    type: string
    sql: ${TABLE}.ConditionNumber_KNUMV ;;
  }

  dimension: condition_pricing_unit_kpein {
    type: number
    sql: ${TABLE}.ConditionPricingUnit_KPEIN ;;
  }

  dimension: condition_record_number_nrab_knumh {
    type: string
    sql: ${TABLE}.ConditionRecordNumber_NRAB_KNUMH ;;
  }

  dimension: condition_unit_kmein {
    type: string
    sql: ${TABLE}.ConditionUnit_KMEIN ;;
  }

  dimension: condition_update_koupd {
    type: string
    sql: ${TABLE}.ConditionUpdate_KOUPD ;;
  }

  dimension: configuration_cuobj {
    type: string
    sql: ${TABLE}.Configuration_CUOBJ ;;
  }

  dimension: consumption_posting_kzvbr {
    type: string
    sql: ${TABLE}.ConsumptionPosting_KZVBR ;;
  }

  dimension: controlling_area_kokrs {
    type: string
    sql: ${TABLE}.ControllingArea_KOKRS ;;
  }

  dimension: conversion_factor_quantities_umref {
    type: number
    sql: ${TABLE}.ConversionFactorQuantities_UMREF ;;
  }

  dimension: conversion_factor_umzin {
    type: number
    sql: ${TABLE}.ConversionFactor_UMZIN ;;
  }

  dimension: cost_center_hdr_kostl {
    type: string
    sql: ${TABLE}.CostCenterHdr_KOSTL ;;
  }

  dimension: cost_center_kostl {
    type: string
    sql: ${TABLE}.CostCenter_KOSTL ;;
  }

  dimension: cost_ctr_business_area_gskst {
    type: string
    sql: ${TABLE}.CostCtrBusinessArea_GSKST ;;
  }

  dimension: cost_estimate_number_kalnr {
    type: string
    sql: ${TABLE}.CostEstimateNumber_KALNR ;;
  }

  dimension: cost_in_document_currency_wavwr {
    type: number
    sql: ${TABLE}.CostInDocumentCurrency_WAVWR ;;
  }

  dimension: cost_in_target_currency_wavwr {
    type: number
    sql: ${TABLE}.CostInTargetCurrency_WAVWR ;;
  }

  dimension: costing_sheet_kalsm_k {
    type: string
    sql: ${TABLE}.CostingSheet_KALSM_K ;;
  }

  dimension: costing_variant_kalvar {
    type: string
    sql: ${TABLE}.CostingVariant_KALVAR ;;
  }

  dimension: costing_variant_klvar {
    type: string
    sql: ${TABLE}.CostingVariant_KLVAR ;;
  }

  dimension: created_by_ernam {
    type: string
    sql: ${TABLE}.CreatedBy_ERNAM ;;
  }

  dimension_group: creation_date_erdat {
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
    hidden: no
  }

  dimension: creation_time_erzet {
    type: string
    sql: ${TABLE}.CreationTime_ERZET ;;
    hidden: yes

  }

  dimension: credit_block_cmtfg {
    type: string
    sql: ${TABLE}.CreditBlock_CMTFG ;;
    hidden: yes
  }

  dimension: credit_control_area_kkber {
    type: string
    sql: ${TABLE}.CreditControlArea_KKBER ;;
    hidden: yes
  }

  dimension: credit_representative_group_for_credit_management_sbgrp {
    type: string
    sql: ${TABLE}.CreditRepresentativeGroupForCreditManagement_SBGRP ;;
  }

  dimension: cumulative_confirmed_quantity_in_base_uo_m_klmeng {
    type: number
    sql: ${TABLE}.CumulativeConfirmedQuantityInBASeUoM_KLMENG ;;
    hidden: no
  }

  dimension: cumulative_confirmed_quantity_kbmeng {
    type: number
    sql: ${TABLE}.CumulativeConfirmedQuantity_KBMENG ;;
  }

  dimension: cumulative_order_quantity_kwmeng {
    type: number
    sql: ${TABLE}.CumulativeOrderQuantity_KWMENG ;;
    hidden: no
  }

  dimension: cumulative_target_delivery_qty_lsmeng {
    type: number
    sql: ${TABLE}.CumulativeTargetDeliveryQty_LSMENG ;;
  }

  dimension: currency_hdr_waerk {
    type: string
    sql: ${TABLE}.CurrencyHdr_WAERK ;;
  }

  dimension: currency_key_of_credit_control_area_cmwae {
    type: string
    sql: ${TABLE}.CurrencyKeyOfCreditControlArea_CMWAE ;;
  }

  dimension: currency_waerk {
    type: string
    sql: ${TABLE}.Currency_WAERK ;;
    hidden: no
  }

  dimension: customer_credit_group_grupp {
    type: string
    sql: ${TABLE}.CustomerCreditGroup_GRUPP ;;
  }

  dimension: customer_credit_limit_ref_knkli {
    type: string
    sql: ${TABLE}.CustomerCreditLimitRef_KNKLI ;;
  }

  dimension: customer_group1_kvgr1 {
    type: string
    sql: ${TABLE}.CustomerGroup1_KVGR1 ;;
  }

  dimension: customer_group2_kvgr2 {
    type: string
    sql: ${TABLE}.CustomerGroup2_KVGR2 ;;
  }

  dimension: customer_group3_kvgr3 {
    type: string
    sql: ${TABLE}.CustomerGroup3_KVGR3 ;;
  }

  dimension: customer_group4_kvgr4 {
    type: string
    sql: ${TABLE}.CustomerGroup4_KVGR4 ;;
  }

  dimension: customer_group5_kvgr5 {
    type: string
    sql: ${TABLE}.CustomerGroup5_KVGR5 ;;
  }

  dimension: customer_has_not_posted_goods_receipt_nachl {
    type: string
    sql: ${TABLE}.CustomerHasNotPostedGoodsReceipt_NACHL ;;
  }

  dimension: customer_material_number_kdmat {
    type: string
    sql: ${TABLE}.CustomerMaterialNumber_KDMAT ;;
  }

  dimension_group: customer_purchase_order_date_bstdk {
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
    sql: ${TABLE}.CustomerPurchaseOrderDate_BSTDK ;;
  }

  dimension: customer_purchase_order_number_bstnk {
    type: string
    sql: ${TABLE}.CustomerPurchaseOrderNumber_BSTNK ;;
  }

  dimension: customer_purchase_order_type_bsark {
    type: string
    sql: ${TABLE}.CustomerPurchaseOrderType_BSARK ;;
  }

  dimension: dangerous_goods_flag_cont_dg {
    type: string
    sql: ${TABLE}.DangerousGoodsFlag_CONT_DG ;;
  }

  dimension: dangerous_goods_management_profile_proli {
    type: string
    sql: ${TABLE}.DangerousGoodsManagementProfile_PROLI ;;
  }

  dimension_group: date_of_next_credit_check_of_document_cmnup {
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
    sql: ${TABLE}.DateOfNextCreditCheckOfDocument_CMNUP ;;
  }

  dimension: day_of_sales_order_creation_date_erdat {
    type: number
    sql: ${TABLE}.DayOfSalesOrderCreationDate_ERDAT ;;
  }

  dimension: days_by_which_the_quantity_can_be_shifted_kever {
    type: number
    sql: ${TABLE}.DaysByWhichTheQuantityCanBeShifted_KEVER ;;
  }

  dimension: delivery_block_lifsk {
    type: string
    sql: ${TABLE}.DeliveryBlock_LIFSK ;;
  }

  dimension: delivery_date_and_quantity_fixed_fixmg {
    type: string
    sql: ${TABLE}.DeliveryDateAndQuantityFixed_FIXMG ;;
  }

  dimension: delivery_group_grkor {
    type: string
    sql: ${TABLE}.DeliveryGroup_GRKOR ;;
  }

  dimension: delivery_priority_lprio {
    type: string
    sql: ${TABLE}.DeliveryPriority_LPRIO ;;
  }

  dimension: denominator_qty_umvkn {
    type: number
    sql: ${TABLE}.DenominatorQty_UMVKN ;;
  }

  dimension: distribution_channel_vtweg {
    type: string
    sql: ${TABLE}.DistributionChannel_VTWEG ;;
    ##primary_key: yes
  }

  dimension: division_hdr_spart {
    type: string
    sql: ${TABLE}.DivisionHdr_SPART ;;
  }

  dimension: division_spart {
    type: string
    sql: ${TABLE}.Division_SPART ;;
    hidden: no
  }

  dimension: document_category_vbtyp {
    type: string
    sql: ${TABLE}.DocumentCategory_VBTYP ;;
  }

  dimension_group: document_date_audat {
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
    sql: ${TABLE}.DocumentDate_AUDAT ;;
  }

  dimension: document_indicator_vbklt {
    type: string
    sql: ${TABLE}.DocumentIndicator_VBKLT ;;
  }

  dimension: document_number_of_the_reference_document_vgbel {
    type: string
    sql: ${TABLE}.DocumentNumberOfTheReferenceDocument_VGBEL ;;
  }

  dimension: exchange_rate_for_statistics_stcur {
    type: number
    sql: ${TABLE}.ExchangeRateForStatistics_STCUR ;;
  }

  dimension: exchange_rate_type_kurst {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  dimension: fixed_shipping_processing_time_in_days_vbeaf {
    type: number
    sql: ${TABLE}.FixedShippingProcessingTimeInDays_VBEAF ;;
  }

  dimension: form_of_billing_for_co_rkfkf {
    type: string
    sql: ${TABLE}.FormOfBillingForCO_RKFKF ;;
  }

  dimension: form_of_payment_guarantee_abfor {
    type: string
    sql: ${TABLE}.FormOfPaymentGuarantee_ABFOR ;;
  }

  dimension: free_goods_delivery_control_lstanr {
    type: string
    sql: ${TABLE}.FreeGoodsDeliveryControl_LSTANR ;;
  }

  dimension: functional_area_fkber {
    type: string
    sql: ${TABLE}.FunctionalArea_FKBER ;;
  }

  dimension: fund_fonds {
    type: string
    sql: ${TABLE}.Fund_FONDS ;;
  }

  dimension: funds_center_fistl {
    type: string
    sql: ${TABLE}.FundsCenter_FISTL ;;
  }

  dimension: gross_weight_of_item_brgew {
    type: number
    sql: ${TABLE}.GrossWeightOfItem_BRGEW ;;
  }

  dimension: guaranteed_factor_abges {
    type: number
    sql: ${TABLE}.GuaranteedFactor_ABGES ;;
  }

  dimension_group: hand_over_date_at_the_hand_over_location_handoverdate {
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
    sql: ${TABLE}.HandOverDateAtTheHandOverLocation_HANDOVERDATE ;;
  }

  dimension: hand_over_time_at_the_hand_over_location_handovertime {
    type: string
    sql: ${TABLE}.HandOverTimeAtTheHandOverLocation_HANDOVERTIME ;;
  }

  dimension: hierarchy_type_for_pricing_hityp_pr {
    type: string
    sql: ${TABLE}.HierarchyTypeForPricing_HITYP_PR ;;
  }

  dimension: import_export_flag_prefe {
    type: string
    sql: ${TABLE}.ImportExportFlag_PREFE ;;
  }

  dimension: incentive_id_fiscal_incentive_id {
    type: string
    sql: ${TABLE}.IncentiveID_FISCAL_INCENTIVE_ID ;;
  }

  dimension: inconsistent_configuration_stman {
    type: string
    sql: ${TABLE}.InconsistentConfiguration_STMAN ;;
  }

  dimension: internal_class_number_clint {
    type: string
    sql: ${TABLE}.InternalClassNumber_CLINT ;;
  }

  dimension: internal_counter_stpoz {
    type: string
    sql: ${TABLE}.InternalCounter_STPOZ ;;
  }

  dimension: internal_object_number_of_the_batch_classification_cuobj_ch {
    type: string
    sql: ${TABLE}.InternalObjectNumberOfTheBatchClassification_CUOBJ_CH ;;
  }

  dimension: international_article_number_ean11 {
    type: string
    sql: ${TABLE}.InternationalArticleNumber_EAN11 ;;
  }

  dimension: international_unique_key_handle {
    type: string
    sql: ${TABLE}.InternationalUniqueKey_HANDLE ;;
  }

  dimension: item_category_pstyv {
    type: string
    sql: ${TABLE}.ItemCategory_PSTYV ;;
  }

  dimension: item_credit_price_cmpre {
    type: number
    sql: ${TABLE}.ItemCreditPrice_CMPRE ;;
  }

  dimension: item_credit_price_cmpre_flt {
    type: number
    sql: ${TABLE}.ItemCreditPrice_CMPRE_FLT ;;
  }

  dimension: item_number_of_the_underlying_purchase_order_posex {
    type: string
    sql: ${TABLE}.ItemNumberOfTheUnderlyingPurchaseOrder_POSEX ;;
  }

  dimension: item_posnr {
    type: string
    sql: ${TABLE}.Item_POSNR ;;
    ##primary_key: yes
    hidden: no
  }

  measure: count_sales_orders_line_item{
    type: number
    sql: count(${item_posnr}) ;;
    hidden: no
  }

  dimension: item_type_posar {
    type: string
    sql: ${TABLE}.ItemType_POSAR ;;
  }

  dimension: kanban_kannr {
    type: string
    sql: ${TABLE}.KANBAN_KANNR ;;
  }

  dimension_group: last_changed_on_aedat {
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
    sql: ${TABLE}.LastChangedOn_AEDAT ;;
  }

  dimension_group: last_customer_contact_date_mahdt {
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
    sql: ${TABLE}.LastCustomerContactDate_MAHDT ;;
  }

  dimension: leading_uo_m_kzfme {
    type: string
    sql: ${TABLE}.LeadingUoM_KZFME ;;
  }

  dimension: location_for_aphysical_hand_over_of_goods_handoverloc {
    type: string
    sql: ${TABLE}.LocationForAPhysicalHandOverOfGoods_HANDOVERLOC ;;
  }

  dimension: managing_location_stockloc {
    type: string
    sql: ${TABLE}.ManagingLocation_STOCKLOC ;;
  }

  dimension: manual_tax_code_re_ason_manual_tc_reason {
    type: string
    sql: ${TABLE}.ManualTaxCodeReASon_MANUAL_TC_REASON ;;
  }

  dimension: master_contract_number_vbeln_grp {
    type: string
    sql: ${TABLE}.MasterContractNumber_VBELN_GRP ;;
  }

  dimension: material_entered_matwa {
    type: string
    sql: ${TABLE}.MaterialEntered_MATWA ;;
  }

  dimension: material_freight_group_mfrgr {
    type: string
    sql: ${TABLE}.MaterialFreightGroup_MFRGR ;;
  }

  dimension: material_group1_mvgr1 {
    type: string
    sql: ${TABLE}.MaterialGroup1_MVGR1 ;;
  }

  dimension: material_group2_mvgr2 {
    type: string
    sql: ${TABLE}.MaterialGroup2_MVGR2 ;;
  }

  dimension: material_group3_mvgr3 {
    type: string
    sql: ${TABLE}.MaterialGroup3_MVGR3 ;;
  }

  dimension: material_group4_mvgr4 {
    type: string
    sql: ${TABLE}.MaterialGroup4_MVGR4 ;;
  }

  dimension: material_group5_mvgr5 {
    type: string
    sql: ${TABLE}.MaterialGroup5_MVGR5 ;;
  }

  dimension: material_group_hierarchy1_wgru1 {
    type: string
    sql: ${TABLE}.MaterialGroupHierarchy1_WGRU1 ;;
  }

  dimension: material_group_hierarchy2_wgru2 {
    type: string
    sql: ${TABLE}.MaterialGroupHierarchy2_WGRU2 ;;
  }

  dimension: material_group_matkl {
    type: string
    sql: ${TABLE}.MaterialGroup_MATKL ;;
  }

  dimension: material_number_matnr {
    type: string
    sql: ${TABLE}.MaterialNumber_MATNR ;;
    ##primary_key: yes
    hidden: no
  }

  dimension: material_pricing_group_kondm {
    type: string
    sql: ${TABLE}.MaterialPricingGroup_KONDM ;;
  }

  dimension: material_pricing_group_ukonm {
    type: string
    sql: ${TABLE}.MaterialPricingGroup_UKONM ;;
  }

  dimension: maximum_partial_deliveries_antlf {
    type: number
    sql: ${TABLE}.MaximumPartialDeliveries_ANTLF ;;
  }

  dimension: minimum_delivery_quantity_in_delivery_note_processing_lfmng {
    type: number
    sql: ${TABLE}.MinimumDeliveryQuantityInDeliveryNoteProcessing_LFMNG ;;
  }

  dimension: month_of_sales_order_creation_date_erdat {
    type: number
    sql: ${TABLE}.MonthOfSalesOrderCreationDate_ERDAT ;;
  }

  dimension: mrparea_berid {
    type: string
    sql: ${TABLE}.MRPArea_BERID ;;
  }

  dimension: mrpfor_delivery_schedule_types_abdis {
    type: string
    sql: ${TABLE}.MRPForDeliveryScheduleTypes_ABDIS ;;
  }

  dimension: name_of_orderer_bname {
    type: string
    sql: ${TABLE}.NameOfOrderer_BNAME ;;
  }

  dimension: sales_order_net_price_local_currency {
    type: number
    sql: ${TABLE}.NetPrice_NETPR ;;
  }

  dimension: sales_order_net_price_glob_curr {
    type: number
    sql: ${sales_order_net_price_local_currency} * ${currency_conversion_new.ukurs} ;;
    hidden: no
  }

  measure:  sales_order_net_price_global_currency{
    type: number
    value_format_name: Greek_Number_Format
    sql: avg(${sales_order_net_price_glob_curr}) ;;
    hidden: no
  }

  dimension: net_price_netwr {
    type: number
    sql: ${TABLE}.NetPrice_NETWR ;;
  }

  dimension: net_price_target_currency_netpr {
    type: number
    sql: ${TABLE}.NetPriceTargetCurrency_NETPR ;;
  }

  dimension: net_value_of_the_sales_order_in_document_currency_netwr {
    type: number
    sql: ${TABLE}.NetValueOfTheSalesOrderInDocumentCurrency_NETWR ;;
  }

  dimension: net_value_of_the_sales_order_in_target_currency_netwr {
    type: number
    sql: ${TABLE}.NetValueOfTheSalesOrderInTargetCurrency_NETWR ;;
  }

  dimension: net_weight_of_item_ntgew {
    type: number
    sql: ${TABLE}.NetWeightOfItem_NTGEW ;;
  }

  dimension_group: next_date_cmngv {
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
    sql: ${TABLE}.NextDate_CMNGV ;;
  }

  dimension: not_afiscal_special_case_for_cfopdetermination_spcsto {
    type: string
    sql: ${TABLE}.NotAFiscalSpecialCaseForCFOPDetermination_SPCSTO ;;
  }

  dimension: notification_no_qmnum {
    type: string
    sql: ${TABLE}.NotificationNo_QMNUM ;;
  }

  dimension: number_of_condition_record_knumh {
    type: string
    sql: ${TABLE}.NumberOfConditionRecord_KNUMH ;;
  }

  dimension: number_of_contacts_from_the_customer_mahza {
    type: number
    sql: ${TABLE}.NumberOfContactsFromTheCustomer_MAHZA ;;
  }

  dimension: number_of_serial_numbers_anzsn {
    type: number
    sql: ${TABLE}.NumberOfSerialNumbers_ANZSN ;;
  }

  dimension: numerator_qty_umvkz {
    type: number
    sql: ${TABLE}.NumeratorQty_UMVKZ ;;
  }

  dimension: object_number_at_header_level_objnr {
    type: string
    sql: ${TABLE}.ObjectNumberAtHeaderLevel_OBJNR ;;
  }

  dimension: object_number_at_item_level_objnr {
    type: string
    sql: ${TABLE}.ObjectNumberAtItemLevel_OBJNR ;;
  }

  dimension: order_number_aufnr {
    type: string
    sql: ${TABLE}.OrderNumber_AUFNR ;;
  }

  dimension: order_number_hdr_aufnr {
    type: string
    sql: ${TABLE}.OrderNumberHdr_AUFNR ;;
  }

  dimension: order_probability_of_the_item_awahr {
    type: string
    sql: ${TABLE}.OrderProbabilityOfTheItem_AWAHR ;;
  }

  dimension: original_system_vbkla {
    type: string
    sql: ${TABLE}.OriginalSystem_VBKLA ;;
  }

  dimension: originating_document_vbelv {
    type: string
    sql: ${TABLE}.OriginatingDocument_VBELV ;;
  }

  dimension: originating_item_posnv {
    type: string
    sql: ${TABLE}.OriginatingItem_POSNV ;;
  }

  dimension: over_delivery_tolerance_limit_uebto {
    type: number
    sql: ${TABLE}.OverDeliveryToleranceLimit_UEBTO ;;
  }

  dimension: over_head_key_zschl_k {
    type: string
    sql: ${TABLE}.OverHeadKey_ZSCHL_K ;;
  }

  dimension: packaging_materials_magrv {
    type: string
    sql: ${TABLE}.PackagingMaterials_MAGRV ;;
  }

  dimension: parameter_variant_techs {
    type: string
    sql: ${TABLE}.ParameterVariant_TECHS ;;
  }

  dimension: partial_delivery_at_item_level_kztlf {
    type: string
    sql: ${TABLE}.PartialDeliveryAtItemLevel_KZTLF ;;
  }

  dimension: planning_material_vpmat {
    type: string
    sql: ${TABLE}.PlanningMaterial_VPMAT ;;
  }

  dimension: planning_plant_vpwrk {
    type: string
    sql: ${TABLE}.PlanningPlant_VPWRK ;;
  }

  dimension: planning_release_regulation_plavo {
    type: string
    sql: ${TABLE}.PlanningReleaseRegulation_PLAVO ;;
  }

  dimension: plant_werks {
    type: string
    sql: ${TABLE}.Plant_WERKS ;;
  }

  dimension: pre_doc_category_vgtyp {
    type: string
    sql: ${TABLE}.PreDocCategory_VGTYP ;;
  }

  dimension: preceding_doc_category_vgtyp {
    type: string
    sql: ${TABLE}.PrecedingDocCategory_VGTYP ;;
  }

  dimension: preceding_document_has_resulted_from_reference_vgref {
    type: string
    sql: ${TABLE}.PrecedingDocumentHasResultedFromReference_VGREF ;;
  }

  dimension: pricing_is_ok_prsok {
    type: string
    sql: ${TABLE}.PricingIsOK_PRSOK ;;
  }

  dimension: pricing_procedure_kalsm {
    type: string
    sql: ${TABLE}.PricingProcedure_KALSM ;;
  }

  dimension: pricing_reference_material_pmatn {
    type: string
    sql: ${TABLE}.PricingReferenceMaterial_PMATN ;;
  }

  dimension: pricing_reference_material_upmat {
    type: string
    sql: ${TABLE}.PricingReferenceMaterial_UPMAT ;;
  }

  dimension: product_allocation_kosch {
    type: string
    sql: ${TABLE}.ProductAllocation_KOSCH ;;
  }

  dimension: product_hierarchy_prodh {
    type: string
    sql: ${TABLE}.ProductHierarchy_PRODH ;;
  }

  dimension: profit_center_for_billing_pctrf {
    type: string
    sql: ${TABLE}.ProfitCenterForBilling_PCTRF ;;
  }

  dimension: profit_center_prctr {
    type: string
    sql: ${TABLE}.ProfitCenter_PRCTR ;;
  }

  dimension: profitability_segment_number_paobjnr {
    type: string
    sql: ${TABLE}.ProfitabilitySegmentNumber_PAOBJNR ;;
  }

  dimension: promotion_knuma_pi {
    type: string
    sql: ${TABLE}.Promotion_KNUMA_PI ;;
  }

  dimension: proposed_billing_type_fkara {
    type: string
    sql: ${TABLE}.ProposedBillingType_FKARA ;;
  }

  dimension: proposed_date_type_vprgr {
    type: string
    sql: ${TABLE}.ProposedDateType_VPRGR ;;
  }

  dimension: purchase_order_number_supplement_bstzd {
    type: string
    sql: ${TABLE}.PurchaseOrderNumberSupplement_BSTZD ;;
  }

  dimension: quantity_is_fixed_fmeng {
    type: string
    sql: ${TABLE}.QuantityIsFixed_FMENG ;;
  }

  dimension_group: quotation_date_from_angdt {
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
    sql: ${TABLE}.QuotationDateFrom_ANGDT ;;
  }

  dimension_group: quotation_date_to_bnddt {
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
    sql: ${TABLE}.QuotationDateTo_BNDDT ;;
  }

  dimension: reason_augru {
    type: string
    sql: ${TABLE}.Reason_AUGRU ;;
  }

  dimension: reason_for_material_substitution_sugrd {
    type: string
    sql: ${TABLE}.ReasonForMaterialSubstitution_SUGRD ;;
  }

  dimension_group: reconciliation_date_abdat {
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
    sql: ${TABLE}.ReconciliationDate_ABDAT ;;
  }

  dimension: reference_document_number_xblnr {
    type: string
    sql: ${TABLE}.ReferenceDocumentNumber_XBLNR ;;
  }

  dimension: reference_document_vgbel {
    type: string
    sql: ${TABLE}.ReferenceDocument_VGBEL ;;
  }

  dimension: reference_indicator_voref {
    type: string
    sql: ${TABLE}.ReferenceIndicator_VOREF ;;
  }

  dimension: reference_item_vgpos {
    type: string
    sql: ${TABLE}.ReferenceItem_VGPOS ;;
  }

  dimension: rejection_reason_abgru {
    type: string
    sql: ${TABLE}.RejectionReason_ABGRU ;;
  }

  dimension_group: rele_ase_date_of_the_document_determined_by_credit_management_cmfre {
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
    sql: ${TABLE}.ReleASeDateOfTheDocumentDeterminedByCreditManagement_CMFRE ;;
  }

  dimension: released_credit_value_of_the_document_amtbl {
    type: number
    sql: ${TABLE}.ReleasedCreditValueOfTheDocument_AMTBL ;;
  }

  dimension: relevant_for_billing_fkrel {
    type: string
    sql: ${TABLE}.RelevantForBilling_FKREL ;;
  }

  dimension: relevant_for_credit_cmpnt {
    type: string
    sql: ${TABLE}.RelevantForCredit_CMPNT ;;
  }

  dimension: relevant_for_delivery_lfrel {
    type: string
    sql: ${TABLE}.RelevantForDelivery_LFREL ;;
  }

  dimension: repair_processing_vkgru {
    type: string
    sql: ${TABLE}.RepairProcessing_VKGRU ;;
  }

  dimension: replacement_part_atpkz {
    type: string
    sql: ${TABLE}.ReplacementPart_ATPKZ ;;
  }

  dimension_group: requested_delivery_date_vdatu {
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
    sql: ${TABLE}.RequestedDeliveryDate_VDATU ;;
  }

  dimension: requirements_type_bedae {
    type: string
    sql: ${TABLE}.RequirementsType_BEDAE ;;
  }

  dimension: results_analysis_key_abgrs {
    type: string
    sql: ${TABLE}.ResultsAnalysisKey_ABGRS ;;
  }

  dimension: return_reason_msr_ret_reason {
    type: string
    sql: ${TABLE}.ReturnReason_MSR_RET_REASON ;;
  }

  dimension: returns_item_shkzg {
    type: string
    sql: ${TABLE}.ReturnsItem_SHKZG ;;
  }

  dimension: returns_refund_code_msr_refund_code {
    type: string
    sql: ${TABLE}.ReturnsRefundCode_MSR_REFUND_CODE ;;
  }

  dimension: risk_category_ctlpc {
    type: string
    sql: ${TABLE}.RiskCategory_CTLPC ;;
  }

  dimension: risk_relevancy_in_sales_trmrisk_relevant {
    type: string
    sql: ${TABLE}.RiskRelevancyInSales_TRMRISK_RELEVANT ;;
  }

  dimension: rounding_quantity_for_delivery_ablfz {
    type: number
    sql: ${TABLE}.RoundingQuantityForDelivery_ABLFZ ;;
  }

  dimension: route_route {
    type: string
    sql: ${TABLE}.Route_ROUTE ;;
  }

  dimension: sales_deal_knuma_ag {
    type: string
    sql: ${TABLE}.SalesDeal_KNUMA_AG ;;
  }

  dimension: sales_document_type_auart {
    type: string
    sql: ${TABLE}.SalesDocumentType_AUART ;;
  }

  dimension: sales_document_vbeln {
    type: string
    sql: ${TABLE}.SalesDocument_VBELN ;;
    #primary_key: yes
    hidden: no
  }

  dimension: sales_group_vkgrp {
    type: string
    sql: ${TABLE}.SalesGroup_VKGRP ;;
  }

  dimension: sales_office_vkbur {
    type: string
    sql: ${TABLE}.SalesOffice_VKBUR ;;
  }

  dimension: sales_order_value_line_item_source_currency {
    type: number
    sql: ${TABLE}.SalesOrderValueLineItemSourceCurrency ;;
    hidden: no
  }

  dimension: sales_order_value_glob_curr {
    type: number
    sql: ${sales_order_value_line_item_source_currency} * ${currency_conversion_new.ukurs} ;;
    hidden: no
  }

  measure: sales_order_value_global_currency {
    type: sum
    sql: ${sales_order_value_glob_curr} ;;
  }

  dimension: sales_order_value_line_item_target_currency {
    type: number
    sql: ${TABLE}.SalesOrderValueLineItemTargetCurrency ;;
  }

  dimension: sales_organization_vkorg {
    type: string
    sql: ${TABLE}.SalesOrganization_VKORG ;;
    #primary_key: yes
  }

  dimension: sales_probability_awahr {
    type: string
    sql: ${TABLE}.SalesProbability_AWAHR ;;
  }

  dimension: sales_unit_vrkme {
    type: string
    sql: ${TABLE}.SalesUnit_VRKME ;;
  }

  dimension: scale_quantity_smeng {
    type: number
    sql: ${TABLE}.ScaleQuantity_SMENG ;;
  }

  dimension: search_term_for_product_proposal_ktext {
    type: string
    sql: ${TABLE}.SearchTermForProductProposal_KTEXT ;;
  }

  dimension: separate_valuation_bwtex {
    type: string
    sql: ${TABLE}.SeparateValuation_BWTEX ;;
  }

  dimension: serial_number_profile_serail {
    type: string
    sql: ${TABLE}.SerialNumberProfile_SERAIL ;;
  }

  dimension: shipping_conditions_vsbed {
    type: string
    sql: ${TABLE}.ShippingConditions_VSBED ;;
  }

  dimension: shipping_receiving_point_vstel {
    type: string
    sql: ${TABLE}.ShippingReceivingPoint_VSTEL ;;
  }

  dimension: short_text_arktx {
    type: string
    sql: ${TABLE}.ShortText_ARKTX ;;
  }

  dimension: sold_to_party_kunnr {
    type: string
    sql: ${TABLE}.SoldToParty_KUNNR ;;
    #primary_key: yes
  }

  dimension: sold_to_party_name {
    type: string
    sql: if(${partner_function_parvw} = 'AG', ${customers_md_partner_function.name1_name1}, Null);;
    hidden: no
  }

  measure: max_sold_to_party_name {
    type: string
    sql: max(${sold_to_party_name}) ;;
    hidden: no
  }

  dimension: ship_to_party_name {
    type: string
    sql: if(${partner_function_parvw} = 'WE', ${customers_md_partner_function.name1_name1}, Null);;
    hidden: no
  }

  measure: max_ship_to_party_name {
    type: string
    sql: max(${ship_to_party_name}) ;;
    hidden: no
  }

  dimension: bill_to_party_name {
    type: string
    sql: if(${partner_function_parvw} = 'RE', ${customers_md_partner_function.name1_name1}, Null);;
    hidden: no
  }

  measure: max_bill_to_party_name {
    type: string
    sql: max(${bill_to_party_name}) ;;
    hidden: no
  }


  dimension: customer_kunnr {
    type: string
    sql: if((${sales_order_partner_function.item_posnr} is Null
          OR ${sales_order_partner_function.item_posnr} = '000000'),
            ${sales_order_partner_function_header.customer_kunnr},
            ${sales_order_partner_function.customer_kunnr}) ;;
    #primary_key: yes
    hidden: no
  }



  dimension: partner_function_parvw {
    type: string
    sql: if((${sales_order_partner_function.item_posnr} is Null
          OR ${sales_order_partner_function.item_posnr} = '000000'),
            ${sales_order_partner_function_header.partner_function_parvw},
            ${sales_order_partner_function.partner_function_parvw}) ;;
    hidden: no
  }


  dimension: special_stock_indicator_sobkz {
    type: string
    sql: ${TABLE}.SpecialStockIndicator_SOBKZ ;;
  }

  dimension: statistic_scurrency_stwae {
    type: string
    sql: ${TABLE}.StatisticScurrency_STWAE ;;
  }

  dimension: statistical_values_kowrr {
    type: string
    sql: ${TABLE}.StatisticalValues_KOWRR ;;
  }

  dimension_group: statistics_date_stadat {
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
    sql: ${TABLE}.StatisticsDate_STADAT ;;
  }

  dimension: status_expected_price_cepok {
    type: string
    sql: ${TABLE}.StatusExpectedPrice_CEPOK ;;
  }

  dimension: status_manual_price_change_mprok {
    type: string
    sql: ${TABLE}.StatusManualPriceChange_MPROK ;;
  }

  dimension: storage_location_lgort {
    type: string
    sql: ${TABLE}.StorageLocation_LGORT ;;
  }

  dimension: sub_total1_from_pricing_procedure_for_condition_kzwi1 {
    type: number
    sql: ${TABLE}.SubTotal1FromPricingProcedureForCondition_KZWI1 ;;
  }

  dimension: sub_total2_from_pricing_procedure_for_condition_kzwi2 {
    type: number
    sql: ${TABLE}.SubTotal2FromPricingProcedureForCondition_KZWI2 ;;
  }

  dimension: sub_total3_from_pricing_procedure_for_condition_kzwi3 {
    type: number
    sql: ${TABLE}.SubTotal3FromPricingProcedureForCondition_KZWI3 ;;
  }

  dimension: sub_total4_from_pricing_procedure_for_condition_kzwi4 {
    type: number
    sql: ${TABLE}.SubTotal4FromPricingProcedureForCondition_KZWI4 ;;
  }

  dimension: sub_total5_from_pricing_procedure_for_condition_kzwi5 {
    type: number
    sql: ${TABLE}.SubTotal5FromPricingProcedureForCondition_KZWI5 ;;
  }

  dimension: sub_total6_from_pricing_procedure_for_condition_kzwi6 {
    type: number
    sql: ${TABLE}.SubTotal6FromPricingProcedureForCondition_KZWI6 ;;
  }

  dimension: summing_up_of_requirements_sumbd {
    type: string
    sql: ${TABLE}.SummingUpOfRequirements_SUMBD ;;
  }

  dimension: target_currency_tcurr {
    type: string
    sql: ${TABLE}.TargetCurrency_TCURR ;;
    hidden: no
  }

  dimension: target_quantity_uo_m_zieme {
    type: string
    sql: ${TABLE}.TargetQuantityUoM_ZIEME ;;
  }

  dimension: target_quantity_uo_m_zmeng {
    type: number
    sql: ${TABLE}.TargetQuantityUoM_ZMENG ;;
  }

  dimension: target_value_zwert {
    type: number
    sql: ${TABLE}.TargetValue_ZWERT ;;
  }

  dimension: tax_amount_in_document_currency_mwsbp {
    type: number
    sql: ${TABLE}.TaxAmountInDocumentCurrency_MWSBP ;;
  }

  dimension: tax_amount_in_target_currency_mwsbp {
    type: number
    sql: ${TABLE}.TaxAmountInTargetCurrency_MWSBP ;;
  }

  dimension: tax_classification1_taxm1 {
    type: string
    sql: ${TABLE}.TaxClassification1_TAXM1 ;;
  }

  dimension: tax_classification2_taxk2 {
    type: string
    sql: ${TABLE}.TaxClassification2_TAXK2 ;;
  }

  dimension: tax_classification2_taxm2 {
    type: string
    sql: ${TABLE}.TaxClassification2_TAXM2 ;;
  }

  dimension: tax_classification3_taxk3 {
    type: string
    sql: ${TABLE}.TaxClassification3_TAXK3 ;;
  }

  dimension: tax_classification3_taxm3 {
    type: string
    sql: ${TABLE}.TaxClassification3_TAXM3 ;;
  }

  dimension: tax_classification4_taxk4 {
    type: string
    sql: ${TABLE}.TaxClassification4_TAXK4 ;;
  }

  dimension: tax_classification4_taxm4 {
    type: string
    sql: ${TABLE}.TaxClassification4_TAXM4 ;;
  }

  dimension: tax_classification5_taxk5 {
    type: string
    sql: ${TABLE}.TaxClassification5_TAXK5 ;;
  }

  dimension: tax_classification5_taxm5 {
    type: string
    sql: ${TABLE}.TaxClassification5_TAXM5 ;;
  }

  dimension: tax_classification6_taxk6 {
    type: string
    sql: ${TABLE}.TaxClassification6_TAXK6 ;;
  }

  dimension: tax_classification6_taxm6 {
    type: string
    sql: ${TABLE}.TaxClassification6_TAXM6 ;;
  }

  dimension: tax_classification7_taxk7 {
    type: string
    sql: ${TABLE}.TaxClassification7_TAXK7 ;;
  }

  dimension: tax_classification7_taxm7 {
    type: string
    sql: ${TABLE}.TaxClassification7_TAXM7 ;;
  }

  dimension: tax_classification8_taxk8 {
    type: string
    sql: ${TABLE}.TaxClassification8_TAXK8 ;;
  }

  dimension: tax_classification8_taxm8 {
    type: string
    sql: ${TABLE}.TaxClassification8_TAXM8 ;;
  }

  dimension: tax_classification9_taxk9 {
    type: string
    sql: ${TABLE}.TaxClassification9_TAXK9 ;;
  }

  dimension: tax_classification9_taxm9 {
    type: string
    sql: ${TABLE}.TaxClassification9_TAXM9 ;;
  }

  dimension: tax_code_automatically_determined_tc_aut_det {
    type: string
    sql: ${TABLE}.TaxCodeAutomaticallyDetermined_TC_AUT_DET ;;
  }

  dimension: tax_departure_country_landtx {
    type: string
    sql: ${TABLE}.TaxDepartureCountry_LANDTX ;;
  }

  dimension: tax_destination_country_stceg_l {
    type: string
    sql: ${TABLE}.TaxDestinationCountry_STCEG_L ;;
  }

  dimension: tax_incentive_type_fiscal_incentive {
    type: string
    sql: ${TABLE}.TaxIncentiveType_FISCAL_INCENTIVE ;;
  }

  dimension: telephone_number_telf1 {
    type: string
    sql: ${TABLE}.TelephoneNumber_TELF1 ;;
  }

  dimension: transaction_group_trvog {
    type: string
    sql: ${TABLE}.TransactionGroup_TRVOG ;;
  }

  dimension: type_of_first_inventory_sloctype {
    type: string
    sql: ${TABLE}.TypeOfFirstInventory_SLOCTYPE ;;
  }

  dimension: under_delivery_tolerance_limit_untto {
    type: number
    sql: ${TABLE}.UnderDeliveryToleranceLimit_UNTTO ;;
  }

  dimension: unlimited_over_delivery_allowed_uebtk {
    type: string
    sql: ${TABLE}.UnlimitedOverDeliveryAllowed_UEBTK ;;
  }

  dimension: update_group_for_statistics_stafo {
    type: string
    sql: ${TABLE}.UpdateGroupForStatistics_STAFO ;;
  }

  dimension: update_group_for_statistics_update_stafo {
    type: string
    sql: ${TABLE}.UpdateGroupForStatisticsUpdate_STAFO ;;
  }

  dimension: update_indicator_upflu {
    type: string
    sql: ${TABLE}.UpdateIndicator_UPFLU ;;
  }

  dimension: usage_indicator_abrvw {
    type: string
    sql: ${TABLE}.UsageIndicator_ABRVW ;;
  }

  dimension: usage_indicator_vkaus {
    type: string
    sql: ${TABLE}.UsageIndicator_VKAUS ;;
  }

  dimension: utctime_stamp_l_upd_tmstmp {
    type: number
    sql: ${TABLE}.UTCTimeStampL_UPD_TMSTMP ;;
  }

  dimension: valuation_type_bwtar {
    type: string
    sql: ${TABLE}.ValuationType_BWTAR ;;
  }

  dimension: valuationof_special_stock_kzbws {
    type: string
    sql: ${TABLE}.ValuationofSpecialStock_KZBWS ;;
  }

  dimension: value_contract_item_wktps {
    type: string
    sql: ${TABLE}.ValueContractItem_WKTPS ;;
  }

  dimension: value_contract_no_wktnr {
    type: string
    sql: ${TABLE}.ValueContractNo_WKTNR ;;
  }

  dimension: variable_shipping_processing_time_in_days_vbeav {
    type: number
    sql: ${TABLE}.VariableShippingProcessingTimeInDays_VBEAV ;;
  }

  dimension: volume_of_the_item_volum {
    type: number
    sql: ${TABLE}.VolumeOfTheItem_VOLUM ;;
  }

  dimension: volume_rebate_group_bonus {
    type: string
    sql: ${TABLE}.VolumeRebateGroup_BONUS ;;
  }

  dimension: volume_unit_voleh {
    type: string
    sql: ${TABLE}.VolumeUnit_VOLEH ;;
  }

  dimension_group: warranty_date_gwldt {
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
    sql: ${TABLE}.WarrantyDate_GWLDT ;;
  }

  dimension: wbselement_hdr_ps_psp_pnr {
    type: string
    sql: ${TABLE}.WBSElementHdr_PS_PSP_PNR ;;
  }

  dimension: wbselement_ps_psp_pnr {
    type: string
    sql: ${TABLE}.WBSElement_PS_PSP_PNR ;;
  }

  dimension: week_of_sales_order_creation_date_erdat {
    type: number
    sql: ${TABLE}.WeekOfSalesOrderCreationDate_ERDAT ;;
  }

  dimension: weight_unit_gewei {
    type: string
    sql: ${TABLE}.WeightUnit_GEWEI ;;
  }

  dimension: year_of_sales_order_creation_date_erdat {
    type: number
    sql: ${TABLE}.YearOfSalesOrderCreationDate_ERDAT ;;
  }

  dimension: your_reference_ihrez {
    type: string
    sql: ${TABLE}.YourReference_IHREZ ;;
  }

  ##################################################### Total Orders  ############################################################
  dimension: total_orders {
    type: string
    sql: if(${document_category_vbtyp}='C',${sales_document_vbeln},NULL) ;;
    hidden: no
  }

  measure: count_orders {
    type: number
    sql: count(${total_orders}) ;;
    hidden: no
  }

  ##################################################### Fill rate  ############################################################

  dimension: confirmed_quantity_bmeng  {
    type: number
    sql: ${sales_order_schedule_line_dt.sales_order_schedule_line_sum_confirmed_quantity_bmeng} ;;
    hidden: no
  }

  measure: sum_confirmed_quantity_bmeng {
    type: number
    sql: sum(${confirmed_quantity_bmeng}) ;;
    hidden: no
  }

  measure: sum_cumulative_order_quantity_kwmeng {
    type: number
    sql: sum(${cumulative_order_quantity_kwmeng}) ;;
    hidden: no
  }

  measure: fill_rate{
    type: number
    value_format: "0%"
    sql: avg(NULLIF(${confirmed_quantity_bmeng},0)/NULLIF(${cumulative_order_quantity_kwmeng},0)) ;;
    drill_fields: [sales_document_vbeln,item_posnr,materials_md.material_text_maktx,requested_delivery_date_vdatu_date,deliveries.date__proof_of_delivery___podat_date,customers_md.name1_name1,customers_md.name2_name2,customers_md.name3_name3,confirmed_quantity_bmeng,cumulative_order_quantity_kwmeng,base_unit_of_measure_meins,fill_rate]
    hidden: no
  }

  ##################################################### Return Orders  ############################################################
  dimension: return_order {
    type: string
    sql: IF( ${document_category_vbtyp} = 'H',
    IF( ${preceding_doc_category_vgtyp} = 'C' AND ${reference_document_vgbel} = ${document_number_of_the_reference_document_vgbel}
        AND ${item_posnr} = ${reference_item_vgpos},
      'Returned',
      'NotReturned'),
    IF( ${preceding_doc_category_vgtyp} = 'M' AND ${reference_document_vgbel} = ${billing.document_number_of_the_reference_document_vgbel}
      AND ${reference_item_vgpos} = ${billing.item_number_of_the_reference_item_vgpos}
      AND ${billing.sales_document_aubel} = ${sales_document_vbeln}
      AND ${billing.sales_document_item_aupos} = ${item_posnr},
      'Returned',
      'NotReturned') ) ;;
    hidden: no
  }

  measure: count_return_order {
    type: count_distinct
    sql: ${sales_document_vbeln} || ${item_posnr} ;;
    filters: [return_order : "Returned"]
    hidden: no
  }

  measure: Return_Order_Percentage {
    type: number
    sql:if(${deliveries.count_of_delivery}=0,0,round(${count_return_order}/NULLIF(${deliveries.count_of_delivery},0)*100,2)) ;;
    link: {
      label: "Return Order Detailed Report"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_02_c_returned_ordersperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
 }

  ##################################################### Canceled Orders  ############################################################
  dimension: canceled_order {
    type: string
    sql: IF(${rejection_reason_abgru} IS NOT NULL,'Canceled','NotCanceled') ;;
    hidden: no
  }

  measure: count_canceled_order {
    type: count_distinct
    sql: ${sales_document_vbeln} || ${item_posnr} ;;
    filters: [canceled_order: "Canceled"]
    hidden: no
  }

  measure: canceled_order_percentage {
    type: number
    sql: if(${count_total_orders}=0,0,round(${count_canceled_order}/NULLIF(${count_total_orders},0)*100,2)) ;;
    link: {
      label: "Cancelled Order Detailed Report"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_02_a_cancelled_ordersperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }

  ##################################################### Open Orders  ############################################################
  dimension: open_orders {
    type: string
    sql: IF(${deliveries.actual_quantity_delivered_in_sales_units_lfimg} = ${cumulative_order_quantity_kwmeng}
    AND ${cumulative_order_quantity_kwmeng} = ${billing.actual_billed_quantity_fkimg},'NotOpenOrder','OpenOrder') ;;
    hidden: no
    }

  ##################################################### Sales Order Status  ############################################################
  dimension: sales_order_status {
    type: string
    sql: if(${canceled_order}="Canceled","Canceled",if(${open_orders}="OpenOrder","Open","Closed")) ;;
    hidden: no
  }

  #################################################### One Touch Order ############################
  measure: count_one_touch_order {
    type: count_distinct
    sql: ${one_touch_order.vbapsales_document_vbeln} ;;
    hidden: no
  }

  measure: count_total_orders {
    type: count_distinct
    sql: ${sales_document_vbeln} ;;
    hidden: no
  }

  measure: one_touch_order_percentage {
    type: number
    sql: if(${count_total_orders}=0,0,round(${count_one_touch_order}/NULLIF(${count_total_orders},0)*100,2)) ;;
    hidden: no
    link: {
      label: "One Touch Order Detailed Report"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_02_b_one_touch_orderperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
  }
  #***************************************** Billing & Pricing (Sales Order Pricing view) *******************************************#

  # List Price Currency Conversion:

  dimension: list_price {
    type: number
    sql: ${sales_order_pricing.list_price} ;;
    hidden: no
  }

  measure: avg_list_price {
    type: average
    sql: ${list_price} ;;
    hidden: no
  }

  dimension: list_price_glob_curr {
    type: number
    sql: ${sales_order_pricing.list_price} * ${currency_conversion_new.ukurs};;
    hidden: no
  }

  measure: sum_list_price_glob_curr {
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${list_price_glob_curr} ;;
    hidden: no
  }

  measure: avg_list_price_global_currency_customer{
    type: average
    value_format_name: Greek_Number_Format
    sql: ${list_price_glob_curr} ;;
    link: {
      label: "Price Adjustments based on Product Availability"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_b_price_adjustments_based_on_product_availabilityperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_order_pricing.checkbox_kdatu_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }

  ## Adjusted Price Currency Conversion:

  dimension: adjusted_price {
    type: number
    sql: ${sales_order_pricing.adjusted_price} ;;
    hidden: no
  }

  measure: avg_adjusted_price {
    type: average
    sql: ${adjusted_price} ;;
    hidden: no
  }
  dimension: adjusted_price_glob_curr {
    type: number
    sql: ${sales_order_pricing.adjusted_price} * ${currency_conversion_new.ukurs};;
    hidden: no
  }

  measure: sum_adjusted_price_glob_curr {
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${adjusted_price_glob_curr} ;;
    hidden: no
  }

  measure: avg_adjusted_price_global_currency {
    type: average
    value_format_name: Greek_Number_Format
    sql: ${adjusted_price_glob_curr} ;;
    link: {
      label: "Price Adjustments based on Product Availability"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_b_price_adjustments_based_on_product_availabilityperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_order_pricing.checkbox_kdatu_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }

  ## Intercompany Price Currency Conversion:

  dimension: intercompany_price_glob_curr {
    type: number
    hidden: no
    sql: ${sales_order_pricing.inter_company_price} * ${currency_conversion_new.ukurs};;
  }

  measure: avg_list_price_global_currency_product{
    type: average
    value_format_name: Greek_Number_Format
    sql: ${list_price_glob_curr} ;;
    link: {
      label: "Price Adjustments based on Product Availability"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_b_price_adjustments_based_on_product_availabilityperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_order_pricing.checkbox_kdatu_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }

  measure: intercompany_price_global_currency {
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${intercompany_price_glob_curr} ;;
    hidden: no
  }

  measure: avg_intercompany_price_global_currency {
    type: average
    value_format_name: Greek_Number_Format
    sql: ${intercompany_price_glob_curr} ;;
    link: {
      label: "Price Adjustments based on Product Availability"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_b_price_adjustments_based_on_product_availabilityperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_order_pricing.checkbox_kdatu_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }

  ## Discount Currency Conversion:

  dimension: discount_glob_curr {
    type: number
    hidden: no
    sql: ${sales_order_pricing.discount} * ${currency_conversion_new.ukurs};;
  }

  measure: discount_global_currency {
    type: sum
    sql: ${discount_glob_curr} ;;
    hidden: no
  }

  ## Variation of list price n adjusted price:

  dimension: variation_of_listprice_and_adjustedprice{
    value_format_name: Greek_Number_Format
    type: number
    sql: ${sales_order_pricing.list_price} - ${sales_order_pricing.adjusted_price}  ;;
    hidden: no
  }

  measure: avg_variation_of_listprice_and_adjustedprice {
    type: average
    value_format_name: Greek_Number_Format
    sql: ${variation_of_listprice_and_adjustedprice} ;;
    hidden: no
  }

  #************************************************** End of Billing and Pricing *****************************************************#

 ##################################################### Sales Order NetValue  ############################################################
  dimension: sales_order_netvalue_local_currency {
    type: number
    sql: ${cumulative_order_quantity_kwmeng} * ${sales_order_net_price_local_currency} ;;
    hidden: no
  }

  dimension: sales_order_netvalue_glob_curr {
    type: number
    sql: ${sales_order_netvalue_local_currency} * ${currency_conversion_new.ukurs} ;;
    hidden: no
  }

  measure: sales_order_netvalue_glob_curr_1 {
    type: number
    sql: SUM(${sales_order_netvalue_glob_curr}) ;;
    value_format : "0.00"
    hidden: no
  }


  measure: sales_order_netvalue_global_currency_product {
    type: number
    value_format_name: "Greek_Number_Format"
    sql: sum(${sales_order_netvalue_glob_curr}) ;;
    link: {
      label: "Sales Performance by Product"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_c_sales_performance_by_productperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }

  measure: sales_order_netvalue_global_currency_sales_org {
    type: number
    value_format_name: "Greek_Number_Format"
    sql: sum(${sales_order_netvalue_glob_curr});;
    link: {
      label: "Sales Performance by Sales_Org"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_d_sales_performance_by_sales_orgperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }
  measure: sales_order_netvalue_global_currency_dist_channel {
    type: number
    value_format_name: "Greek_Number_Format"
    sql: sum(${sales_order_netvalue_glob_curr});;
    link: {
      label: "Sales Performance by Distribution Channel"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_a_sales_performance_by_distribution_channelperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }
  measure: sales_order_netvalue_global_currency_division {
    type: number
    value_format_name: "Greek_Number_Format"
    sql: sum(${sales_order_netvalue_glob_curr});;
    link: {
      label: "Sales Performance by Division"
      url: "/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_b_sales_performance_by_divisionperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&Currency={{ _filters['currency_conversion_new.tcurr']| url_encode }}"
    }
    hidden: no
  }
  measure: sales_order_netvalue_global_currency_1 {
    type: number
    value_format_name: Greek_Number_Format
    sql: avg(${sales_order_netvalue_glob_curr}) ;;
  }

  measure: count {
    type: count
    hidden: no
  }
  ##################################################### Blocked Orders ###############################################

  dimension: blocked_orders {
    type: string
    sql: if(${deliveries.delivery_block_document_header_lifsk} IS NULL
      AND ${deliveries.billing_block_in_sd_document_faksk} IS NULL,'NotBlocked','Blocked' ) ;;
    hidden: no
  }

  measure: count_blocked_orders {
    type: count_distinct
    sql: ${sales_document_vbeln} || ${item_posnr} ;;
    filters: [blocked_orders:"Blocked"]
    hidden: no
  }

  measure: average_list_price1{
    value_format_name: Greek_Number_Format
    type: average
    sql: ${TABLE}.Average_List_Price1 ;;
    hidden: no
  }

  measure: average_adjusted_price{
    value_format_name: Greek_Number_Format
    type: average
    sql: ${TABLE}.Average_Adjested_Price ;;
    hidden: no
  }

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
    hidden: no
    default_value: "USD"
  }

  dimension: Global_Currency {
    type: string
    sql:  {% parameter Currency_Required %};;
    hidden: no
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

      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_02c_01_order_fulfillment_performance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">Order Fulfillment</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_02_order_status_snapshot?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">Order Status Snapshot</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_03_order_detailsperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">Order Details</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_sales_performanceperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">Sales Performance</a>
      <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_billing_and_pricing?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">Billing and Pricing</a>
      </nav>
      </div>
      <div style="background-color: #FFFFFF; height:500px;width:100%"></div>;;
  }

  measure: Order_fulfillment{
    type: string
    hidden: no
    sql: "Home" ;;
    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_02c_01_order_fulfillment_performance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">{{value}}</a></nav>  ;;
  }

  measure: order_snapshot{
    type: string
    hidden: no
    sql: "Home" ;;
    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_02_order_status_snapshot?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">{{value}}</a></nav>  ;;
  }

  measure: Order_details{
    type: string
    hidden: no
    sql: "Home" ;;
    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_03_order_detailsperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">{{value}}</a></nav>  ;;
  }

  measure: Sales_performance{
    type: string
    sql: "Home" ;;
    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_04_sales_performanceperformance_tuning?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">{{value}}</a></nav>  ;;
    hidden: no
  }

  measure: billing_and_pricing{
    type: string
    hidden: no
    sql: "Home" ;;
    html:<nav style="font-size: 20px; color: #4285F4"><a style="padding: 5px; float: center; line-height: 40px" href="/dashboards/cortex_sap_operational::sap_order_to_cash_o2c_05_billing_and_pricing?Region={{ _filters['countries_md.country_name_landx']| url_encode }}&Year={{ _filters['sales_orders.creation_date_erdat_date']| url_encode }}&Sales+Org={{ _filters['sales_organizations_md.sales_org_name_vtext']| url_encode }}&Distribution+Channel={{ _filters['distribution_channels_md.distribution_channel_name_vtext']| url_encode }}&Product={{ _filters['materials_md.material_text_maktx']| url_encode }}&Division={{ _filters['divisions_md.division_name_vtext']| url_encode }}&ampCurrency={{ _filters['currency_conversion_new.tcurr']| url_encode }}">{{value}}</a></nav>  ;;
  }

}
