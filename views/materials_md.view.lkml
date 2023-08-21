view: materials_md {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.MaterialsMD`
    ;;
  
  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${material_number_matnr},${language_spras});;
  }
  
  dimension: acceptance_at_origin_weora {
    type: string
    sql: ${TABLE}.AcceptanceAtOrigin_WEORA ;;
  }

  dimension: adjustment_profile_adprof {
    type: string
    sql: ${TABLE}.AdjustmentProfile_ADPROF ;;
  }

  dimension: allowed_packaging_volume_ervol {
    type: number
    sql: ${TABLE}.AllowedPackagingVolume_ERVOL ;;
  }

  dimension: allowed_packaging_weight_ergew {
    type: number
    sql: ${TABLE}.AllowedPackagingWeight_ERGEW ;;
  }

  dimension: assign_effectivity_parameter_values_override_change_numbers_kzeff {
    type: string
    sql: ${TABLE}.AssignEffectivityParameterValuesOverrideChangeNumbers_KZEFF ;;
  }

  dimension: assortment_list_type_bbtyp {
    type: string
    sql: ${TABLE}.AssortmentListType_BBTYP ;;
  }

  dimension: authorization_group_begru {
    type: string
    sql: ${TABLE}.AuthorizationGroup_BEGRU ;;
  }

  dimension: base_unit_of_measure_meins {
    type: string
    sql: ${TABLE}.BaseUnitOfMeasure_MEINS ;;
  }

  dimension: basic_material_wrkst {
    type: string
    sql: ${TABLE}.BasicMaterial_WRKST ;;
  }

  dimension: batch_management_requirement_indicator_xchpf {
    type: string
    sql: ${TABLE}.BatchManagementRequirementIndicator_XCHPF ;;
  }

  dimension: brand_brand_id {
    type: string
    sql: ${TABLE}.Brand_BRAND_ID ;;
  }

  dimension: cad_indicator_cadkz {
    type: string
    sql: ${TABLE}.CadIndicator_CADKZ ;;
  }

  dimension: catalog_profile_rbnrm {
    type: string
    sql: ${TABLE}.CatalogProfile_RBNRM ;;
  }

  dimension: category_of_international_article_number_ean_numtp {
    type: string
    sql: ${TABLE}.CategoryOfInternationalArticleNumber_Ean_NUMTP ;;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: comparison_price_unit_vpreh {
    type: number
    sql: ${TABLE}.ComparisonPriceUnit_VPREH ;;
  }

  measure: total_comparison_price_unit_vpreh {
    type: sum
    sql: ${comparison_price_unit_vpreh} ;;
  }

  measure: average_comparison_price_unit_vpreh {
    type: average
    sql: ${comparison_price_unit_vpreh} ;;
  }

  dimension: competitor_kunnr {
    type: string
    sql: ${TABLE}.Competitor_KUNNR ;;
  }

  dimension: configurable_material_kzkfg {
    type: string
    sql: ${TABLE}.ConfigurableMaterial_KZKFG ;;
  }

  dimension: container_requirements_behvo {
    type: string
    sql: ${TABLE}.ContainerRequirements_BEHVO ;;
  }

  dimension: content_unit_inhme {
    type: string
    sql: ${TABLE}.ContentUnit_INHME ;;
  }

  dimension: country_of_origin_of_material_herkl {
    type: string
    sql: ${TABLE}.CountryOfOriginOfMaterial_HERKL ;;
  }

  dimension_group: created_on_ersda {
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
    sql: ${TABLE}.CreatedOn_ERSDA ;;
  }

  dimension: cross_distribution_chain_material_status_mstav {
    type: string
    sql: ${TABLE}.CrossDistributionChainMaterialStatus_MSTAV ;;
  }

  dimension: cross_plant_configurable_material_satnr {
    type: string
    sql: ${TABLE}.CrossPlantConfigurableMaterial_SATNR ;;
  }

  dimension: cross_plant_material_status_mstae {
    type: string
    sql: ${TABLE}.CrossPlantMaterialStatus_MSTAE ;;
  }

  dimension: dangerous_goods_indicator_profile_profl {
    type: string
    sql: ${TABLE}.DangerousGoodsIndicatorProfile_PROFL ;;
  }

  dimension_group: date_from_which_the_cross_plant_material_status_is_valid_mstde {
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
    sql: ${TABLE}.DateFromWhichTheCrossPlantMaterialStatusIsValid_MSTDE ;;
  }

  dimension_group: date_from_which_the_xdistr_chain_material_status_is_valid_mstdv {
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
    sql: ${TABLE}.DateFromWhichTheXDistrChainMaterialStatusIsValid_MSTDV ;;
  }

  dimension_group: date_of_last_change_laeda {
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
    sql: ${TABLE}.DateOfLastChange_LAEDA ;;
  }

  dimension: deactivated_entar {
    type: string
    sql: ${TABLE}.Deactivated_ENTAR ;;
  }

  dimension_group: deletion_date_liqdt {
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
    sql: ${TABLE}.DeletionDate_LIQDT ;;
  }

  dimension: division_spart {
    type: string
    sql: ${TABLE}.Division_SPART ;;
  }

  dimension: document_change_number_without_document_management_system_aeszn {
    type: string
    sql: ${TABLE}.DocumentChangeNumber_WithoutDocumentManagementSystem_AESZN ;;
  }

  dimension: document_number_without_document_management_system_zeinr {
    type: string
    sql: ${TABLE}.DocumentNumber_WithoutDocumentManagementSystem_ZEINR ;;
  }

  dimension: document_type_without_document_management_system_zeiar {
    type: string
    sql: ${TABLE}.DocumentType_WithoutDocumentManagementSystem_ZEIAR ;;
  }

  dimension: document_version_without_document_management_system_zeivr {
    type: string
    sql: ${TABLE}.DocumentVersion_WithoutDocumentManagementSystem_ZEIVR ;;
  }

  dimension: empties_bill_of_material_mlgut {
    type: string
    sql: ${TABLE}.EmptiesBillOfMaterial_MLGUT ;;
  }

  dimension: environmentally_relevant_kzumw {
    type: string
    sql: ${TABLE}.EnvironmentallyRelevant_KZUMW ;;
  }

  dimension: european_article_number_eannr {
    type: string
    sql: ${TABLE}.EuropeanArticleNumber_EANNR ;;
  }

  dimension: ewm_catch_weight_tolerance_group_for_ewm_cwqtolgr {
    type: string
    sql: ${TABLE}.EwmCatchWeightToleranceGroupForEwm_CWQTOLGR ;;
  }

  dimension: ewm_cw_catch_weight_profile_for_entering_cw_quantity_cwqproc {
    type: string
    sql: ${TABLE}.EwmCw_CatchWeightProfileForEnteringCwQuantity_CWQPROC ;;
  }

  dimension: ewm_cw_logistics_unit_of_measure_logunit {
    type: string
    sql: ${TABLE}.EwmCw_LogisticsUnitOfMeasure_LOGUNIT ;;
  }

  dimension: ewm_cw_material_is_acatch_weight_material_cwqrel {
    type: string
    sql: ${TABLE}.EwmCw_MaterialIsACatchWeightMaterial_CWQREL ;;
  }

  dimension: excess_volume_tolerance_of_the_handling_unit_volto {
    type: number
    sql: ${TABLE}.ExcessVolumeToleranceOfTheHandlingUnit_VOLTO ;;
  }

  dimension: excess_weight_tolerance_for_handling_unit_gewto {
    type: number
    sql: ${TABLE}.ExcessWeightToleranceForHandlingUnit_GEWTO ;;
  }

  dimension: expiration_date_sled_bbd {
    type: string
    sql: ${TABLE}.ExpirationDate_SLED_BBD ;;
  }

  dimension: external_material_group_extwg {
    type: string
    sql: ${TABLE}.ExternalMaterialGroup_EXTWG ;;
  }

  dimension: flag_material_for_deletion_at_client_level_lvorm {
    type: string
    sql: ${TABLE}.FlagMaterialForDeletionAtClientLevel_LVORM ;;
  }

  dimension: form_name_ps_smartform {
    type: string
    sql: ${TABLE}.FormName_PS_SMARTFORM ;;
  }

  dimension: general_item_category_group_mtpos_mara {
    type: string
    sql: ${TABLE}.GeneralItemCategoryGroup_MTPOS_MARA ;;
  }

  dimension: generic_material_with_logistical_variants_bflme {
    type: string
    sql: ${TABLE}.GenericMaterialWithLogisticalVariants_BFLME ;;
  }

  dimension: global_trade_item_number_variant_gtin_variant {
    type: string
    sql: ${TABLE}.GlobalTradeItemNumberVariant_GTIN_VARIANT ;;
  }

  dimension: gross_contents_inhbr {
    type: number
    sql: ${TABLE}.GrossContents_INHBR ;;
  }

  dimension: gross_weight_brgew {
    type: number
    sql: ${TABLE}.GrossWeight_BRGEW ;;
  }

  dimension: handling_indicator_hndlcode {
    type: string
    sql: ${TABLE}.HandlingIndicator_HNDLCODE ;;
  }

  dimension: handling_unit_type_hutyp {
    type: string
    sql: ${TABLE}.HandlingUnitType_HUTYP ;;
  }

  dimension: hazardous_material_number_stoff {
    type: string
    sql: ${TABLE}.HazardousMaterialNumber_STOFF ;;
  }

  dimension: height_hoehe {
    type: number
    sql: ${TABLE}.Height_HOEHE ;;
  }

  dimension: id_for_an_intellectual_property_crm_product_ipmipproduct {
    type: string
    sql: ${TABLE}.IdForAnIntellectualProperty_CrmProduct_IPMIPPRODUCT ;;
  }

  dimension: indicator_approved_batch_record_required_xgchp {
    type: string
    sql: ${TABLE}.Indicator_ApprovedBatchRecordRequired_XGCHP ;;
  }

  dimension: indicator_global_data_synchronization_relevant_gds_relevant {
    type: string
    sql: ${TABLE}.Indicator_GlobalDataSynchronizationRelevant_GDS_RELEVANT ;;
  }

  dimension: indicator_highly_viscous_ihivi {
    type: string
    sql: ${TABLE}.Indicator_HighlyViscous_IHIVI ;;
  }

  dimension: indicator_in_bulk_liquid_iloos {
    type: string
    sql: ${TABLE}.Indicator_InBulkLiquid_ILOOS ;;
  }

  dimension: indicator_material_can_be_co_product_kzkup {
    type: string
    sql: ${TABLE}.Indicator_MaterialCanBeCoProduct_KZKUP ;;
  }

  dimension: indicator_product_composition_printed_on_packaging_przus {
    type: string
    sql: ${TABLE}.Indicator_ProductCompositionPrintedOnPackaging_PRZUS ;;
  }

  dimension: indicator_the_material_has_afollow_up_material_kznfm {
    type: string
    sql: ${TABLE}.Indicator_TheMaterialHasAFollowUpMaterial_KZNFM ;;
  }

  dimension: industry_sector_mbrsh {
    type: string
    sql: ${TABLE}.IndustrySector_MBRSH ;;
  }

  dimension: industry_standard_description_such_as_ansi_or_iso_normt {
    type: string
    sql: ${TABLE}.IndustryStandardDescription_SuchAsAnsiOrIso_NORMT ;;
  }

  dimension: internal_object_number_cuobf {
    type: string
    sql: ${TABLE}.InternalObjectNumber_CUOBF ;;
  }

  dimension: international_article_number_eanupc_ean11 {
    type: string
    sql: ${TABLE}.InternationalArticleNumber_Eanupc_EAN11 ;;
  }

  dimension: label_form_etifo {
    type: string
    sql: ${TABLE}.LabelForm_ETIFO ;;
  }

  dimension: label_type_etiar {
    type: string
    sql: ${TABLE}.LabelType_ETIAR ;;
  }

  dimension: laboratory_design_office_labor {
    type: string
    sql: ${TABLE}.LaboratoryDesignOffice_LABOR ;;
  }

  dimension: language_spras {
    type: string
    sql: ${TABLE}.Language_SPRAS ;;
  }

  dimension: length_laeng {
    type: number
    sql: ${TABLE}.Length_LAENG ;;
  }

  dimension: level_of_explicitness_for_serial_number_serlv {
    type: string
    sql: ${TABLE}.LevelOfExplicitnessForSerialNumber_SERLV ;;
  }

  dimension: low_level_code_disst {
    type: string
    sql: ${TABLE}.LowLevelCode_DISST ;;
  }

  dimension: maintenance_status_of_complete_material_vpsta {
    type: string
    sql: ${TABLE}.MaintenanceStatusOfCompleteMaterial_VPSTA ;;
  }

  dimension: maintenance_status_pstat {
    type: string
    sql: ${TABLE}.MaintenanceStatus_PSTAT ;;
  }

  dimension: manufacturer_number_mfrnr {
    type: string
    sql: ${TABLE}.ManufacturerNumber_MFRNR ;;
  }

  dimension: manufacturer_part_number_mfrpn {
    type: string
    sql: ${TABLE}.ManufacturerPartNumber_MFRPN ;;
  }

  dimension: material_category_attyp {
    type: string
    sql: ${TABLE}.MaterialCategory_ATTYP ;;
  }

  dimension: material_completion_level_compl {
    type: string
    sql: ${TABLE}.MaterialCompletionLevel_COMPL ;;
  }

  dimension: material_freight_group_mfrgr {
    type: string
    sql: ${TABLE}.MaterialFreightGroup_MFRGR ;;
  }

  dimension: material_group_matkl {
    type: string
    sql: ${TABLE}.MaterialGroup_MATKL ;;
  }

  dimension: material_group_packaging_materials_magrv {
    type: string
    sql: ${TABLE}.MaterialGroup_PackagingMaterials_MAGRV ;;
  }

  dimension: material_is_locked_matfi {
    type: string
    sql: ${TABLE}.MaterialIsLocked_MATFI ;;
  }

  dimension: material_number_matnr {
    type: string
    sql: ${TABLE}.MaterialNumber_MATNR ;;
  }

  dimension: material_number_of_the_generic_material_in_prepack_materials_gennr {
    type: string
    sql: ${TABLE}.MaterialNumberOfTheGenericMaterialInPrepackMaterials_GENNR ;;
  }

  dimension: material_qualifies_for_discount_in_kind_nrfhg {
    type: string
    sql: ${TABLE}.MaterialQualifiesForDiscountInKind_NRFHG ;;
  }

  dimension: material_text_maktx {
    type: string
    sql: ${TABLE}.MaterialText_MAKTX ;;
    hidden: no
  }

  dimension: material_type_mtart {
    type: string
    sql: ${TABLE}.MaterialType_MTART ;;
  }

  dimension: maximum_allowed_capacity_of_packaging_material_maxc {
    type: number
    sql: ${TABLE}.MaximumAllowedCapacityOfPackagingMaterial_MAXC ;;
  }

  dimension: maximum_level_by_volume_fuelg {
    type: number
    sql: ${TABLE}.MaximumLevel_ByVolume_FUELG ;;
  }

  dimension: maximum_packing_height_of_packaging_material_maxh {
    type: number
    sql: ${TABLE}.MaximumPackingHeightOfPackagingMaterial_MAXH ;;
  }

  dimension: maximum_packing_length_of_packaging_material_maxl {
    type: number
    sql: ${TABLE}.MaximumPackingLengthOfPackagingMaterial_MAXL ;;
  }

  dimension: maximum_packing_width_of_packaging_material_maxb {
    type: number
    sql: ${TABLE}.MaximumPackingWidthOfPackagingMaterial_MAXB ;;
  }

  dimension: medium_medium {
    type: string
    sql: ${TABLE}.Medium_MEDIUM ;;
  }

  dimension: mfr_part_profile_mprof {
    type: string
    sql: ${TABLE}.MfrPartProfile_MPROF ;;
  }

  dimension: minimum_remaining_shelf_life_mhdrz {
    type: number
    sql: ${TABLE}.MinimumRemainingShelfLife_MHDRZ ;;
  }

  dimension: name_of_person_who_changed_object_aenam {
    type: string
    sql: ${TABLE}.NameOfPersonWhoChangedObject_AENAM ;;
  }

  dimension: name_of_person_who_created_the_object_ernam {
    type: string
    sql: ${TABLE}.NameOfPersonWhoCreatedTheObject_ERNAM ;;
  }

  dimension: net_contents_inhal {
    type: number
    sql: ${TABLE}.NetContents_INHAL ;;
  }

  dimension: net_weight_ntgew {
    type: number
    sql: ${TABLE}.NetWeight_NTGEW ;;
  }

  dimension: number_inventory_managed_material_bmatn {
    type: string
    sql: ${TABLE}.NumberInventoryManagedMaterial_BMATN ;;
  }

  dimension: number_of_sheets_without_document_management_system_blanz {
    type: string
    sql: ${TABLE}.NumberOfSheets_WithoutDocumentManagementSystem_BLANZ ;;
  }

  dimension: old_material_number_bismt {
    type: string
    sql: ${TABLE}.OldMaterialNumber_BISMT ;;
  }

  dimension: order_unit_bstme {
    type: string
    sql: ${TABLE}.OrderUnit_BSTME ;;
  }

  dimension: overcapacity_tolerance_of_the_handling_unit_maxc_tol {
    type: number
    sql: ${TABLE}.OvercapacityToleranceOfTheHandlingUnit_MAXC_TOL ;;
  }

  dimension: packaging_material_is_closed_packaging_kzgvh {
    type: string
    sql: ${TABLE}.PackagingMaterialIsClosedPackaging_KZGVH ;;
  }

  dimension: packaging_material_type_vhart {
    type: string
    sql: ${TABLE}.PackagingMaterialType_VHART ;;
  }

  dimension: page_format_of_document_without_document_management_system_zeifo {
    type: string
    sql: ${TABLE}.PageFormatOfDocument_WithoutDocumentManagementSystem_ZEIFO ;;
  }

  dimension: page_format_of_production_memo_formt {
    type: string
    sql: ${TABLE}.PageFormatOfProductionMemo_FORMT ;;
  }

  dimension: page_number_of_document_without_document_management_system_blatt {
    type: string
    sql: ${TABLE}.PageNumberOfDocument_WithoutDocumentManagementSystem_BLATT ;;
  }

  dimension: period_indicator_for_shelf_life_expiration_date_iprkz {
    type: string
    sql: ${TABLE}.PeriodIndicatorForShelfLifeExpirationDate_IPRKZ ;;
  }

  dimension: physical_commodity_commodity {
    type: string
    sql: ${TABLE}.PhysicalCommodity_COMMODITY ;;
  }

  dimension: pilferable_pilferable {
    type: string
    sql: ${TABLE}.Pilferable_PILFERABLE ;;
  }

  dimension: price_band_category_plgtp {
    type: string
    sql: ${TABLE}.PriceBandCategory_PLGTP ;;
  }

  dimension: pricing_profile_for_variants_sprof {
    type: string
    sql: ${TABLE}.PricingProfileForVariants_SPROF ;;
  }

  dimension: pricing_reference_material_pmata {
    type: string
    sql: ${TABLE}.PricingReferenceMaterial_PMATA ;;
  }

  dimension: procurement_rule_bwvor {
    type: string
    sql: ${TABLE}.ProcurementRule_BWVOR ;;
  }

  dimension: product_allocation_determination_procedure_kosch {
    type: string
    sql: ${TABLE}.ProductAllocationDeterminationProcedure_KOSCH ;;
  }

  dimension: product_hierarchy_prdha {
    type: string
    sql: ${TABLE}.ProductHierarchy_PRDHA ;;
  }

  dimension: productio_inspection_memo_ferth {
    type: string
    sql: ${TABLE}.ProductioInspectionMemo_FERTH ;;
  }

  dimension: purchasing_value_key_ekwsl {
    type: string
    sql: ${TABLE}.PurchasingValueKey_EKWSL ;;
  }

  dimension: qm_in_procurement_is_active_qmpur {
    type: string
    sql: ${TABLE}.QmInProcurementIsActive_QMPUR ;;
  }

  dimension: quality_inspection_group_qgrp {
    type: string
    sql: ${TABLE}.QualityInspectionGroup_QGRP ;;
  }

  dimension: quantity_conversion_method_cmeth {
    type: string
    sql: ${TABLE}.QuantityConversionMethod_CMETH ;;
  }

  dimension: quantity_number_of_grgi_slips_to_be_printed_wesch {
    type: number
    sql: ${TABLE}.Quantity_NumberOfGrgiSlipsToBePrinted_WESCH ;;
  }

  dimension: quarantine_period_qqtime {
    type: number
    sql: ${TABLE}.QuarantinePeriod_QQTIME ;;
  }

  dimension: reference_material_for_materials_packed_in_same_way_rmatp {
    type: string
    sql: ${TABLE}.ReferenceMaterialForMaterialsPackedInSameWay_RMATP ;;
  }

  dimension: relevant_for_configuration_management_cmrel {
    type: string
    sql: ${TABLE}.RelevantForConfigurationManagement_CMREL ;;
  }

  dimension: relevant_for_hazardous_substances_hazmat {
    type: string
    sql: ${TABLE}.RelevantForHazardousSubstances_HAZMAT ;;
  }

  dimension: revision_level_has_been_assigned_to_the_material_kzrev {
    type: string
    sql: ${TABLE}.RevisionLevelHasBeenAssignedToTheMaterial_KZREV ;;
  }

  dimension: rollout_in_aseason_saity {
    type: string
    sql: ${TABLE}.RolloutInASeason_SAITY ;;
  }

  dimension: rounding_rule_for_calculation_of_sled_rdmhd {
    type: string
    sql: ${TABLE}.RoundingRuleForCalculationOfSled_RDMHD ;;
  }

  dimension: season_category_saiso {
    type: string
    sql: ${TABLE}.SeasonCategory_SAISO ;;
  }

  dimension: season_year_saisj {
    type: string
    sql: ${TABLE}.SeasonYear_SAISJ ;;
  }

  dimension: serial_number_profile_serial {
    type: string
    sql: ${TABLE}.SerialNumberProfile_SERIAL ;;
  }

  dimension: size_dimensions_groes {
    type: string
    sql: ${TABLE}.SizeDimensions_GROES ;;
  }

  dimension: source_of_supply_bwscl {
    type: string
    sql: ${TABLE}.SourceOfSupply_BWSCL ;;
  }

  dimension: stacking_factor_stfak {
    type: number
    sql: ${TABLE}.StackingFactor_STFAK ;;
  }

  dimension: standard_hu_type_hutyp_dflt {
    type: string
    sql: ${TABLE}.StandardHuType_HUTYP_DFLT ;;
  }

  dimension: stock_transfer_net_change_costing_aeklk {
    type: string
    sql: ${TABLE}.StockTransferNetChangeCosting_AEKLK ;;
  }

  dimension: storage_conditions_raube {
    type: string
    sql: ${TABLE}.StorageConditions_RAUBE ;;
  }

  dimension: storage_percentage_mhdlp {
    type: number
    sql: ${TABLE}.StoragePercentage_MHDLP ;;
  }

  dimension: tax_classification_of_the_material_taklv {
    type: string
    sql: ${TABLE}.TaxClassificationOfTheMaterial_TAKLV ;;
  }

  dimension: temperature_conditions_indicator_tempb {
    type: string
    sql: ${TABLE}.TemperatureConditionsIndicator_TEMPB ;;
  }

  dimension: time_unit_for_quarantine_period_qqtimeuom {
    type: string
    sql: ${TABLE}.TimeUnitForQuarantinePeriod_QQTIMEUOM ;;
  }

  dimension: total_shelf_life_mhdhb {
    type: number
    sql: ${TABLE}.TotalShelfLife_MHDHB ;;
  }

  dimension: transportation_group_tragr {
    type: string
    sql: ${TABLE}.TransportationGroup_TRAGR ;;
  }

  dimension: unit_of_dimension_for_lengthwidthheight_meabm {
    type: string
    sql: ${TABLE}.UnitOfDimensionForLengthwidthheight_MEABM ;;
  }

  dimension: unit_of_measure_for_maximum_packing_lengthwidthheight_maxdim_uom {
    type: string
    sql: ${TABLE}.UnitOfMeasureForMaximumPackingLengthwidthheight_MAXDIM_UOM ;;
  }

  dimension: unit_of_weight_allowed_packaging_weight_ergei {
    type: string
    sql: ${TABLE}.UnitOfWeight_AllowedPackagingWeight_ERGEI ;;
  }

  dimension: units_of_measure_usage_kzwsm {
    type: string
    sql: ${TABLE}.UnitsOfMeasureUsage_KZWSM ;;
  }

  dimension_group: valid_from_date_datab {
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
    sql: ${TABLE}.ValidFromDate_DATAB ;;
  }

  dimension: variable_purchase_order_unit_active_vabme {
    type: string
    sql: ${TABLE}.VariablePurchaseOrderUnitActive_VABME ;;
  }

  dimension: variable_tare_weight_tare_var {
    type: string
    sql: ${TABLE}.VariableTareWeight_TARE_VAR ;;
  }

  dimension: variant_price_allowed_for_material_master_allow_pmat_igno {
    type: string
    sql: ${TABLE}.VariantPriceAllowed_ForMaterialMaster_ALLOW_PMAT_IGNO ;;
  }

  dimension: volume_unit_allowed_packaging_volume_ervoe {
    type: string
    sql: ${TABLE}.VolumeUnit_AllowedPackagingVolume_ERVOE ;;
  }

  dimension: volume_unit_voleh {
    type: string
    sql: ${TABLE}.VolumeUnit_VOLEH ;;
  }

  dimension: volume_volum {
    type: number
    sql: ${TABLE}.Volume_VOLUM ;;
  }

  dimension: warehouse_material_group_whmatgr {
    type: string
    sql: ${TABLE}.WarehouseMaterialGroup_WHMATGR ;;
  }

  dimension: warehouse_storage_condition_whstc {
    type: string
    sql: ${TABLE}.WarehouseStorageCondition_WHSTC ;;
  }

  dimension: weight_unit_gewei {
    type: string
    sql: ${TABLE}.WeightUnit_GEWEI ;;
  }

  dimension: width_breit {
    type: number
    sql: ${TABLE}.Width_BREIT ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
