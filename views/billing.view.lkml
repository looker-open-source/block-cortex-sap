# The name of this view in Looker is "Billing"
view: billing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.Billing`
    ;;


  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accounting Document Number Belnr" in Explore.
  
  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${billing_document_vbeln},${billing_item_posnr});;
  }
  
  dimension: accounting_document_number_belnr {
    type: string
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
  }

  dimension: accrual_billing_type_fkart {
    type: string
    sql: ${TABLE}.AccrualBillingType_FKART ;;
  }

  dimension: actual_billed_quantity_fkimg {
    type: number
    sql: ${TABLE}.ActualBilledQuantity_FKIMG ;;
  }
  
  measure: total_actual_billed_quantity_fkimg {
    type: number
    sql: SUM(${actual_billed_quantity_fkimg}) ;;
    hidden: no
  }

  dimension: batch_number_charg {
    type: string
    sql: ${TABLE}.BatchNumber_CHARG ;;
  }

  dimension: billing_category_fktyp {
    type: string
    sql: ${TABLE}.BillingCategory_FKTYP ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: billing_date_fkdat {
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
    sql: ${TABLE}.BillingDate_FKDAT ;;
    hidden: no
  }

  dimension: billing_document_is_cancelled_fksto {
    type: string
    sql: ${TABLE}.BillingDocumentIsCancelled_FKSTO ;;
  }

  dimension: billing_document_vbeln {
    type: string
    sql: ${TABLE}.BillingDocument_VBELN ;;
  }

  dimension: billing_item_posnr {
    type: string
    sql: ${TABLE}.BillingItem_POSNR ;;
  }

  dimension: billing_type_fkart {
    type: string
    sql: ${TABLE}.BillingType_FKART ;;
  }

  dimension: bomexplosion_number_sernr {
    type: string
    sql: ${TABLE}.BOMExplosionNumber_SERNR ;;
  }

  dimension: business_area_gsber {
    type: string
    sql: ${TABLE}.BusinessArea_GSBER ;;
  }

  dimension: city_code_cityc {
    type: string
    sql: ${TABLE}.CityCode_CITYC ;;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: company_code_bukrs {
    type: string
    sql: ${TABLE}.CompanyCode_BUKRS ;;
  }

  dimension: condition_item_number_kposn {
    type: string
    sql: ${TABLE}.ConditionItemNumber_KPOSN ;;
  }

  dimension: controlling_area_kokrs {
    type: string
    sql: ${TABLE}.ControllingArea_KOKRS ;;
  }

  dimension: cost_center_kostl {
    type: string
    sql: ${TABLE}.CostCenter_KOSTL ;;
  }

  dimension: country_code_counc {
    type: string
    sql: ${TABLE}.CountryCode_COUNC ;;
  }

  dimension: country_of_sales_tax_idnumber_stceg_l {
    type: string
    sql: ${TABLE}.CountryOfSalesTaxIDNumber_STCEG_L ;;
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

  dimension: customer_group_kdgrp {
    type: string
    sql: ${TABLE}.CustomerGroup_KDGRP ;;
  }

  dimension: customer_price_group_konda {
    type: string
    sql: ${TABLE}.CustomerPriceGroup_KONDA ;;
  }

  dimension: day_of_billing_date_fkdat {
    type: number
    sql: ${TABLE}.DayOfBillingDate_FKDAT ;;
  }

  dimension: destination_country_land1 {
    type: string
    sql: ${TABLE}.DestinationCountry_LAND1 ;;
  }

  dimension: distribution_channel_vtweg {
    type: string
    sql: ${TABLE}.DistributionChannel_VTWEG ;;
  }

  dimension: division_spart {
    type: string
    sql: ${TABLE}.Division_SPART ;;
  }

  dimension: document_category_of_preceding_sddocument_vgtyp {
    type: string
    sql: ${TABLE}.DocumentCategoryOfPrecedingSDDocument_VGTYP ;;
  }

  dimension: document_number_of_the_reference_document_vgbel {
    type: string
    sql: ${TABLE}.DocumentNumberOfTheReferenceDocument_VGBEL ;;
  }

  dimension: dunning_block_mansp {
    type: string
    sql: ${TABLE}.DunningBlock_MANSP ;;
  }

  dimension: dunning_key_mschl {
    type: string
    sql: ${TABLE}.DunningKey_MSCHL ;;
  }

  dimension: fiscal_year_gjahr {
    type: string
    sql: ${TABLE}.FiscalYear_GJAHR ;;
  }

  dimension: gross_weight_brgew {
    type: number
    sql: ${TABLE}.GrossWeight_BRGEW ;;
  }

  dimension: incoterms_part1_inco1 {
    type: string
    sql: ${TABLE}.IncotermsPart1_INCO1 ;;
  }

  dimension: incoterms_part2_inco2 {
    type: string
    sql: ${TABLE}.IncotermsPart2_INCO2 ;;
  }

  dimension: international_article_number_ean11 {
    type: string
    sql: ${TABLE}.InternationalArticleNumber_EAN11 ;;
  }

  dimension: item_number_of_the_reference_item_vgpos {
    type: string
    sql: ${TABLE}.ItemNumberOfTheReferenceItem_VGPOS ;;
  }

  dimension: item_type_posar {
    type: string
    sql: ${TABLE}.ItemType_POSAR ;;
  }

  dimension_group: last_change_date_aedat {
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
    sql: ${TABLE}.LastChangeDate_AEDAT ;;
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

  dimension: material_group_matkl {
    type: string
    sql: ${TABLE}.MaterialGroup_MATKL ;;
  }

  dimension: material_number_matnr {
    type: string
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: material_price_group_kondm {
    type: string
    sql: ${TABLE}.MaterialPriceGroup_KONDM ;;
  }

  dimension: month_of_billing_date_fkdat {
    type: number
    sql: ${TABLE}.MonthOfBillingDate_FKDAT ;;
  }

  dimension: month_order_count {
    type: number
    sql: ${TABLE}.MonthOrderCount ;;
  }

  dimension: net_value_netwr {
    type: number
    sql: ${TABLE}.NetValue_NETWR ;;
  }

  dimension: net_weight_ntgew {
    type: number
    sql: ${TABLE}.NetWeight_NTGEW ;;
  }

  dimension: number_of_the_document_condition_knumv {
    type: string
    sql: ${TABLE}.NumberOfTheDocumentCondition_KNUMV ;;
  }

  dimension: origin_of_sales_tax_idnumber_stceg_h {
    type: string
    sql: ${TABLE}.OriginOfSalesTaxIDNumber_STCEG_H ;;
  }

  dimension: payer_kunrg {
    type: string
    sql: ${TABLE}.Payer_KUNRG ;;
  }

  dimension: payment_method_zlsch {
    type: string
    sql: ${TABLE}.PaymentMethod_ZLSCH ;;
  }

  dimension: plant_werks {
    type: string
    sql: ${TABLE}.Plant_WERKS ;;
  }

  dimension: posting_period_poper {
    type: string
    sql: ${TABLE}.PostingPeriod_POPER ;;
  }

  dimension: price_list_type_pltyp {
    type: string
    sql: ${TABLE}.PriceListType_PLTYP ;;
  }

  dimension: pricing_reference_material_pmatn {
    type: string
    sql: ${TABLE}.PricingReferenceMaterial_PMATN ;;
  }

  dimension: product_hierarchy_prodh {
    type: string
    sql: ${TABLE}.ProductHierarchy_PRODH ;;
  }

  dimension: profit_center_prctr {
    type: string
    sql: ${TABLE}.ProfitCenter_PRCTR ;;
  }

  dimension: rebate {
    type: number
    sql: ${TABLE}.Rebate ;;
  }

  dimension_group: record_creation_date_erdat {
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
    sql: ${TABLE}.RecordCreationDate_ERDAT ;;
  }

  dimension: reference_document_number_xblnr {
    type: string
    sql: ${TABLE}.ReferenceDocumentNumber_XBLNR ;;
  }

  dimension: region_regio {
    type: string
    sql: ${TABLE}.Region_REGIO ;;
  }

  dimension: sales_district_bzirk {
    type: string
    sql: ${TABLE}.SalesDistrict_BZIRK ;;
  }

  dimension: sales_document_aubel {
    type: string
    sql: ${TABLE}.SalesDocument_AUBEL ;;
  }

  dimension: sales_document_item_aupos {
    type: string
    sql: ${TABLE}.SalesDocumentItem_AUPOS ;;
  }

  dimension: sales_document_item_category_pstyv {
    type: string
    sql: ${TABLE}.SalesDocumentItemCategory_PSTYV ;;
  }

  dimension: sales_group_vkgrp {
    type: string
    sql: ${TABLE}.SalesGroup_VKGRP ;;
  }

  dimension: sales_office_vkbur {
    type: string
    sql: ${TABLE}.SalesOffice_VKBUR ;;
  }

  dimension: sales_organization_vkorg {
    type: string
    sql: ${TABLE}.SalesOrganization_VKORG ;;
  }

  dimension: sd_document_currency_waerk {
    type: string
    sql: ${TABLE}.SdDocumentCurrency_WAERK ;;
  }

  dimension: sddocument_category_vbtyp {
    type: string
    sql: ${TABLE}.SDDocumentCategory_VBTYP ;;
  }

  dimension: shipping_conditions_vsbed {
    type: string
    sql: ${TABLE}.ShippingConditions_VSBED ;;
  }

  dimension: shipping_point_receiving_point_vstel {
    type: string
    sql: ${TABLE}.ShippingPointReceivingPoint_VSTEL ;;
  }

  dimension: sold_to_party_kunag {
    type: string
    sql: ${TABLE}.SoldToParty_KUNAG ;;
  }

  dimension: status_for_transfer_to_accounting_rfbsk {
    type: string
    sql: ${TABLE}.StatusForTransferToAccounting_RFBSK ;;
  }

  dimension: storage_location_lgort {
    type: string
    sql: ${TABLE}.StorageLocation_LGORT ;;
  }

  dimension: tax_amount_mwsbk {
    type: number
    sql: ${TABLE}.TaxAmount_MWSBK ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_tax_amount_mwsbk {
    type: sum
    sql: ${tax_amount_mwsbk} ;;
  }

  measure: average_tax_amount_mwsbk {
    type: average
    sql: ${tax_amount_mwsbk} ;;
  }

  dimension: tax_classification1_for_customer_taxk1 {
    type: string
    sql: ${TABLE}.TaxClassification1ForCustomer_TAXK1 ;;
  }

  dimension: tax_classification2_for_customer_taxk2 {
    type: string
    sql: ${TABLE}.TaxClassification2ForCustomer_TAXK2 ;;
  }

  dimension: tax_classification3_for_customer_taxk3 {
    type: string
    sql: ${TABLE}.TaxClassification3ForCustomer_TAXK3 ;;
  }

  dimension: tax_classification4_for_customer_taxk4 {
    type: string
    sql: ${TABLE}.TaxClassification4ForCustomer_TAXK4 ;;
  }

  dimension: tax_classification5_for_customer_taxk5 {
    type: string
    sql: ${TABLE}.TaxClassification5ForCustomer_TAXK5 ;;
  }

  dimension: tax_departure_country_landtx {
    type: string
    sql: ${TABLE}.TaxDepartureCountry_LANDTX ;;
  }

  dimension: tax_jurisdiction_txjcd {
    type: string
    sql: ${TABLE}.TaxJurisdiction_TXJCD ;;
  }

  dimension: volume_volum {
    type: number
    sql: ${TABLE}.Volume_VOLUM ;;
  }

  dimension: week_of_billing_date_fkdat {
    type: number
    sql: ${TABLE}.WeekOfBillingDate_FKDAT ;;
  }

  dimension: week_order_count {
    type: number
    sql: ${TABLE}.WeekOrderCount ;;
  }

  dimension: year_of_billing_date_fkdat {
    type: number
    sql: ${TABLE}.YearOfBillingDate_FKDAT ;;
  }

  dimension: year_order_count {
    type: number
    sql: ${TABLE}.YearOrderCount ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
