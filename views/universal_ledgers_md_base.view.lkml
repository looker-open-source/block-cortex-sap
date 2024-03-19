view: universal_ledgers_md {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.UniversalLedgersMD` ;;

  dimension: cash_ledger_indicator_xcash_ledger {
    type: string
    sql: ${TABLE}.CashLedgerIndicator_XCASH_LEDGER ;;
  }
  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }
  dimension: corporate_accounting_principle_acc_principle {
    type: string
    sql: ${TABLE}.CorporateAccountingPrinciple_ACC_PRINCIPLE ;;
  }
  dimension: extension_ledger_type_ext_ledger_type {
    type: string
    sql: ${TABLE}.ExtensionLedgerType_EXT_LEDGER_TYPE ;;
  }
  dimension: fallback_ledger_fallback_ledger {
    type: string
    sql: ${TABLE}.FallbackLedger_FALLBACK_LEDGER ;;
  }
  dimension: language_langu {
    type: string
    sql: ${TABLE}.Language_LANGU ;;
  }
  dimension: leading_ledger_indicator_xleading {
    type: string
    sql: ${TABLE}.LeadingLedgerIndicator_XLEADING ;;
  }
  dimension: ledger_of_extension_ledger_core {
    type: string
    sql: ${TABLE}.LedgerOfExtensionLedger_CORE ;;
  }
  dimension: ledger_rldnr {
    type: string
    sql: ${TABLE}.Ledger_RLDNR ;;
  }
  dimension: ledger_type {
    type: string
    sql: ${TABLE}.LedgerType ;;
  }
  dimension: manual_postings_not_allowed_man_post_not_allwd {
    type: string
    sql: ${TABLE}.ManualPostingsNotAllowed_MAN_POST_NOT_ALLWD ;;
  }
  dimension: name_name {
    type: string
    sql: ${TABLE}.Name_NAME ;;
  }
  dimension: owner_application_appl {
    type: string
    sql: ${TABLE}.OwnerApplication_APPL ;;
  }
  dimension: sub_application_subappl {
    type: string
    sql: ${TABLE}.SubApplication_SUBAPPL ;;
  }
  dimension: technical_ledger_tech_ledger {
    type: string
    sql: ${TABLE}.TechnicalLedger_TECH_LEDGER ;;
  }
  dimension: valuation_view_subtype_valusubtyp {
    type: string
    sql: ${TABLE}.ValuationViewSubtype_VALUSUBTYP ;;
  }
  dimension: valuation_view_valutyp {
    type: string
    sql: ${TABLE}.ValuationView_VALUTYP ;;
  }
  measure: count {
    type: count
    drill_fields: [name_name]
  }
}
