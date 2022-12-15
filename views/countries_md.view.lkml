# The name of this view in Looker is "Countries Md"
view: countries_md {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.CountriesMD`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alternative Country Key Landa" in Explore.
  fields_hidden_by_default: yes
  dimension: alternative_country_key_landa {
    type: string
    sql: ${TABLE}.AlternativeCountryKey_LANDA ;;
  }

  dimension: bank_account_number_length_lnbkn {
    type: string
    sql: ${TABLE}.BankAccountNumberLength_LNBKN ;;
  }

  dimension: bank_number_length_lnblz {
    type: string
    sql: ${TABLE}.BankNumberLength_LNBLZ ;;
  }

  dimension: chart_of_depreciaton_for_asset_valuation_afapl {
    type: string
    sql: ${TABLE}.ChartOfDepreciatonForAssetValuation_AFAPL ;;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: country_currency_waers {
    type: string
    sql: ${TABLE}.CountryCurrency_WAERS ;;
  }

  dimension: country_iso_code_intca {
    type: string
    sql: ${TABLE}.CountryIsoCode_INTCA ;;
  }

  dimension: country_key_land1 {
    type: string
    sql: ${TABLE}.CountryKey_LAND1 ;;
    primary_key: yes
  }

  dimension: country_language_spras {
    type: string
    sql: ${TABLE}.CountryLanguage_SPRAS ;;
  }

  dimension: country_name__max50_characters___landx50 {
    type: string
    sql: ${TABLE}.CountryName__max50Characters___LANDX50 ;;
  }

  dimension: country_name_landx {
    type: string
    sql: ${TABLE}.CountryName_LANDX ;;
    hidden: no
  }

  dimension: country_version_flag_xland {
    type: string
    sql: ${TABLE}.CountryVersionFlag_XLAND ;;
  }

  dimension: currency_key_of_the_hard_currency_curha {
    type: string
    sql: ${TABLE}.CurrencyKeyOfTheHardCurrency_CURHA ;;
  }

  dimension: currency_key_of_the_index_based_currency_curin {
    type: string
    sql: ${TABLE}.CurrencyKeyOfTheIndexBasedCurrency_CURIN ;;
  }

  dimension: date_format_datfm {
    type: string
    sql: ${TABLE}.DateFormat_DATFM ;;
  }

  dimension: decimal_point_format_xdezp {
    type: string
    sql: ${TABLE}.DecimalPointFormat_XDEZP ;;
  }

  dimension: duevo_nationality_landd {
    type: string
    sql: ${TABLE}.Duevo_Nationality_LANDD ;;
  }

  dimension: exchange_rate_type_for_translation_into_country_currency_kurst {
    type: string
    sql: ${TABLE}.ExchangeRateTypeForTranslationIntoCountryCurrency_KURST ;;
  }

  dimension: flag_city_file_address_check_xregs {
    type: string
    sql: ${TABLE}.Flag_CityFileAddressCheck_XREGS ;;
  }

  dimension: flag_po_box_postal_code_required_xplpf {
    type: string
    sql: ${TABLE}.Flag_PoBoxPostalCodeRequired_XPLPF ;;
  }

  dimension: flag_print_country_name_in_foreign_addresses_xaddr {
    type: string
    sql: ${TABLE}.Flag_PrintCountryNameInForeignAddresses_XADDR ;;
  }

  dimension: flag_street_address_postal_code_required_entry_xplzs {
    type: string
    sql: ${TABLE}.Flag_StreetAddressPostalCodeRequiredEntry_XPLZS ;;
  }

  dimension: flag_street_specific_postal_code__city_file___xplst {
    type: string
    sql: ${TABLE}.FlagStreetSpecificPostalCode__cityFile___XPLST ;;
  }

  dimension: formatting_routine_key_for_printing_addresses_addrs {
    type: string
    sql: ${TABLE}.FormattingRoutineKeyForPrintingAddresses_ADDRS ;;
  }

  dimension: indicator_base_amount_for_tax_is_net_of_discount_xmwsn {
    type: string
    sql: ${TABLE}.Indicator_BaseAmountForTaxIsNetOfDiscount_XMWSN ;;
  }

  dimension: indicator_discount_base_amount_is_the_net_value_xskfn {
    type: string
    sql: ${TABLE}.Indicator_DiscountBaseAmountIsTheNetValue_XSKFN ;;
  }

  dimension: indicator_display_capital_goods_indicator_xxinve {
    type: string
    sql: ${TABLE}.Indicator_DisplayCapitalGoodsIndicator_XXINVE ;;
  }

  dimension: indicator_european_union_member_xegld {
    type: string
    sql: ${TABLE}.Indicator_EuropeanUnionMember_XEGLD ;;
  }

  dimension: indicator_post_net_book_value_for_retirement_kzrbwb {
    type: string
    sql: ${TABLE}.IndicatorPostNetBookValueForRetirement_KZRBWB ;;
  }

  dimension: indicator_transfer_down_payments_from_previous_years_xanzum {
    type: string
    sql: ${TABLE}.IndicatorTransferDownPaymentsFromPreviousYears_XANZUM ;;
  }

  dimension: indicator_use_check_module_for_bank_fields_xprbk {
    type: string
    sql: ${TABLE}.Indicator_UseCheckModuleForBankFields_XPRBK ;;
  }

  dimension: indicator_use_check_module_for_tax_fields_etc_xprso {
    type: string
    sql: ${TABLE}.Indicator_UseCheckModuleForTaxFieldsEtc_XPRSO ;;
  }

  dimension: intrastat_code_intcn {
    type: string
    sql: ${TABLE}.IntrastatCode_INTCN ;;
  }

  dimension: iso_country_code3_char_intca3 {
    type: string
    sql: ${TABLE}.IsoCountryCode3Char_INTCA3 ;;
  }

  dimension: iso_country_code_numeric3_characters_intcn3 {
    type: string
    sql: ${TABLE}.IsoCountryCodeNumeric3Characters_INTCN3 ;;
  }

  dimension: language_spras {
    type: string
    sql: ${TABLE}.Language_SPRAS ;;
  }

  dimension: length_of_bank_key_lnbks {
    type: string
    sql: ${TABLE}.LengthOfBankKey_LNBKS ;;
  }

  dimension: maximum_low_value_asset_amount_gwgwrt {
    type: number
    sql: ${TABLE}.MaximumLowValueAssetAmount_GWGWRT ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_maximum_low_value_asset_amount_gwgwrt {
    type: sum
    sql: ${maximum_low_value_asset_amount_gwgwrt} ;;
  }

  measure: average_maximum_low_value_asset_amount_gwgwrt {
    type: average
    sql: ${maximum_low_value_asset_amount_gwgwrt} ;;
  }

  dimension: name_of_the_bank_key_bnkey {
    type: string
    sql: ${TABLE}.NameOfTheBankKey_BNKEY ;;
  }

  dimension: nationality__max50_characters___natio50 {
    type: string
    sql: ${TABLE}.Nationality__max50Characters___NATIO50 ;;
  }

  dimension: nationality_natio {
    type: string
    sql: ${TABLE}.Nationality_NATIO ;;
  }

  dimension: net_book_value_for_changeover_of_depreciation_method_umrwrt {
    type: number
    sql: ${TABLE}.NetBookValueForChangeoverOfDepreciationMethod_UMRWRT ;;
  }

  dimension: payment_period_for_bill_of_exchange_wechf {
    type: string
    sql: ${TABLE}.PaymentPeriodForBillOfExchange_WECHF ;;
  }

  dimension: permitted_input_length_for_tax_number2_lnst2 {
    type: string
    sql: ${TABLE}.PermittedInputLengthForTaxNumber2_LNST2 ;;
  }

  dimension: permitted_input_length_for_tax_number3_lnst3 {
    type: string
    sql: ${TABLE}.PermittedInputLengthForTaxNumber3_LNST3 ;;
  }

  dimension: permitted_input_length_for_tax_number4_lnst4 {
    type: string
    sql: ${TABLE}.PermittedInputLengthForTaxNumber4_LNST4 ;;
  }

  dimension: permitted_input_length_for_tax_number5_lnst5 {
    type: string
    sql: ${TABLE}.PermittedInputLengthForTaxNumber5_LNST5 ;;
  }

  dimension: permitted_input_length_for_tax_numbre1_lnst1 {
    type: string
    sql: ${TABLE}.PermittedInputLengthForTaxNumbre1_LNST1 ;;
  }

  dimension: post_office_bank_current_account_number_length_lnpsk {
    type: string
    sql: ${TABLE}.PostOfficeBankCurrentAccountNumberLength_LNPSK ;;
  }

  dimension: postal_code_length_lnplz {
    type: string
    sql: ${TABLE}.PostalCodeLength_LNPLZ ;;
  }

  dimension: procedure__pricing_kalsm {
    type: string
    sql: ${TABLE}.Procedure__pricing_KALSM ;;
  }

  dimension: rule_for_checking_bank_account_number_field_prbkn {
    type: string
    sql: ${TABLE}.RuleForCheckingBankAccountNumberField_PRBKN ;;
  }

  dimension: rule_for_checking_bank_key_field_prbks {
    type: string
    sql: ${TABLE}.RuleForCheckingBankKeyField_PRBKS ;;
  }

  dimension: rule_for_checking_bank_number_field_prblz {
    type: string
    sql: ${TABLE}.RuleForCheckingBankNumberField_PRBLZ ;;
  }

  dimension: rule_for_checking_postal_check_account_number_field_prpsk {
    type: string
    sql: ${TABLE}.RuleForCheckingPostalCheckAccountNumberField_PRPSK ;;
  }

  dimension: rule_for_checking_tax_code1_field_prst1 {
    type: string
    sql: ${TABLE}.RuleForCheckingTaxCode1Field_PRST1 ;;
  }

  dimension: rule_for_checking_tax_code2_field_prst2 {
    type: string
    sql: ${TABLE}.RuleForCheckingTaxCode2Field_PRST2 ;;
  }

  dimension: rule_for_checking_tax_code3_field_prst3 {
    type: string
    sql: ${TABLE}.RuleForCheckingTaxCode3Field_PRST3 ;;
  }

  dimension: rule_for_checking_tax_code4_field_prst4 {
    type: string
    sql: ${TABLE}.RuleForCheckingTaxCode4Field_PRST4 ;;
  }

  dimension: rule_for_checking_tax_code5_field_prst5 {
    type: string
    sql: ${TABLE}.RuleForCheckingTaxCode5Field_PRST5 ;;
  }

  dimension: rule_for_checking_vat_registration_number_field_pruin {
    type: string
    sql: ${TABLE}.RuleForCheckingVatRegistrationNumberField_PRUIN ;;
  }

  dimension: rule_for_the_postal_code_field_check_prplz {
    type: string
    sql: ${TABLE}.RuleForThePostalCodeFieldCheck_PRPLZ ;;
  }

  dimension: short_name_for_foreign_trade_statistics_lkvrz {
    type: string
    sql: ${TABLE}.ShortNameForForeignTradeStatistics_LKVRZ ;;
  }

  dimension: standard_name_format_nmfmt {
    type: string
    sql: ${TABLE}.StandardNameFormat_NMFMT ;;
  }

  dimension: super_region_per_country_sureg {
    type: string
    sql: ${TABLE}.SuperRegionPerCountry_SUREG ;;
  }

  dimension: super_region_per_country_text_prq_spregt {
    type: string
    sql: ${TABLE}.SuperRegionPerCountryText_PRQ_SPREGT ;;
  }

  dimension: taxes_at_individual_service_level_kzsrv {
    type: string
    sql: ${TABLE}.TaxesAtIndividualServiceLevel_KZSRV ;;
  }

  dimension: vat_registration_number_length_uinln {
    type: string
    sql: ${TABLE}.VatRegistrationNumberLength_UINLN ;;
  }

  dimension: vehicle_country_key_landk {
    type: string
    sql: ${TABLE}.VehicleCountryKey_LANDK ;;
  }

  dimension: withholding_tax_certificate_numbering_concepts_ctnconcept {
    type: string
    sql: ${TABLE}.WithholdingTaxCertificateNumbering_Concepts_CTNCONCEPT ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
