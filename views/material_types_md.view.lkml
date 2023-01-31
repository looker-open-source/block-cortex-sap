
view: material_types_md {

  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.MaterialTypesMD`;;
  fields_hidden_by_default: yes



  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: description_of_material_type_mtbez {
    type: string
    sql: ${TABLE}.DescriptionOfMaterialType_MTBEZ ;;
    hidden: no
  }

  dimension: language_key_spras {
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
  }

  dimension: material_type_mtart {
    type: string
    sql: ${TABLE}.MaterialType_MTART ;;
  }

  dimension: reference_material_type_mtref {
    type: string
    sql: ${TABLE}.ReferenceMaterialType_MTREF ;;
  }

  dimension: screen_reference_depending_on_the_material_type_mbref {
    type: string
    sql: ${TABLE}.ScreenReferenceDependingOnTheMaterialType_MBREF ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
