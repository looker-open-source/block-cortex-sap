# The name of this view in Looker is "Divisions Md"
view: divisions_md {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.DivisionsMD`
    ;;

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client Mandt" in Explore.
  
  fields_hidden_by_default: yes
  
  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${division_spart},${language_key_spras});;
  }
  
  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: customizatio_of_sdinput_help_entries_hide {
    type: string
    sql: ${TABLE}.CustomizatioOfSDInputHelpEntries_HIDE ;;
  }

  dimension: division_name_vtext {
    type: string
    sql: ${TABLE}.DivisionName_VTEXT ;;
    hidden: no
  }

  dimension: division_spart {
    type: string
    sql: ${TABLE}.Division_SPART ;;
  }

  dimension: language_key_spras {
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
