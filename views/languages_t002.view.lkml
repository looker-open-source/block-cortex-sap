# The name of this view in Looker is "Languages T002"
view: languages_t002 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.Languages_T002`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Degree of Translation of Language Lahq" in Explore.

  dimension: degree_of_translation_of_language_lahq {
    type: string
    sql: ${TABLE}.DegreeOfTranslationOfLanguage_LAHQ ;;
  }

  dimension: language_key_spras {
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
  }

  dimension: language_specifications_laspez {
    type: string
    sql: ${TABLE}.LanguageSpecifications_LASPEZ ;;
  }

  dimension: two_character_sap_language_code_laiso {
    type: string
    sql: ${TABLE}.TwoCharacterSapLanguageCode_LAISO ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
