view: language_map{
  derived_table: {
    sql: WITH temp as (
            SELECT 'CS' as TwoCharacterSapLanguageCode_LAISO, 'cs_CZ' as Looker_Locale UNION ALL
            SELECT 'DE' as TwoCharacterSapLanguageCode_LAISO, 'de_DE' as Looker_Locale UNION ALL
            SELECT 'EN' as TwoCharacterSapLanguageCode_LAISO, 'en' as Looker_Locale UNION ALL
            SELECT 'ES' as TwoCharacterSapLanguageCode_LAISO, 'es_ES' as Looker_Locale UNION ALL
            SELECT 'FR' as TwoCharacterSapLanguageCode_LAISO, 'fr_FR' as Looker_Locale UNION ALL
            SELECT 'HI' as TwoCharacterSapLanguageCode_LAISO, 'hi_IN' as Looker_Locale UNION ALL
            SELECT 'IT' as TwoCharacterSapLanguageCode_LAISO, 'it_IT' as Looker_Locale UNION ALL
            SELECT 'JA' as TwoCharacterSapLanguageCode_LAISO, 'ja_JP' as Looker_Locale UNION ALL
            SELECT 'KO' as TwoCharacterSapLanguageCode_LAISO, 'ko_KR' as Looker_Locale UNION ALL
            SELECT 'LT' as TwoCharacterSapLanguageCode_LAISO, 'lt_LT' as Looker_Locale UNION ALL
            SELECT 'NL' as TwoCharacterSapLanguageCode_LAISO, 'nl_NL' as Looker_Locale UNION ALL
            SELECT 'NO' as TwoCharacterSapLanguageCode_LAISO, 'nb_NO' as Looker_Locale UNION ALL
            SELECT 'PL' as TwoCharacterSapLanguageCode_LAISO, 'pl_PL' as Looker_Locale UNION ALL
            SELECT 'PT' as TwoCharacterSapLanguageCode_LAISO, 'pt_PT' as Looker_Locale UNION ALL
            SELECT 'PT' as TwoCharacterSapLanguageCode_LAISO, 'pt_BR' as Looker_Locale UNION ALL
            SELECT 'RU' as TwoCharacterSapLanguageCode_LAISO, 'ru_RU' as Looker_Locale UNION ALL
            SELECT 'SV' as TwoCharacterSapLanguageCode_LAISO, 'sv_SE' as Looker_Locale UNION ALL
            SELECT 'TH' as TwoCharacterSapLanguageCode_LAISO, 'th_TH' as Looker_Locale UNION ALL
            SELECT 'TR' as TwoCharacterSapLanguageCode_LAISO, 'tr_TR' as Looker_Locale UNION ALL
            SELECT 'UK' as TwoCharacterSapLanguageCode_LAISO, 'uk_UA' as Looker_Locale UNION ALL
            SELECT 'ZH' as TwoCharacterSapLanguageCode_LAISO, 'zh_CN' as Looker_Locale UNION ALL
            SELECT 'ZH' as TwoCharacterSapLanguageCode_LAISO, 'zh_TW' as Looker_Locale)

            SELECT t002.LanguageKey_SPRAS, temp.TwoCharacterSapLanguageCode_LAISO, temp.Looker_Locale
            FROM ${languages_t002.SQL_TABLE_NAME} as t002
            LEFT JOIN temp on temp.TwoCharacterSapLanguageCode_LAISO=t002.TwoCharacterSapLanguageCode_LAISO
       ;;
      sql_trigger_value: SELECT 1 ;;
  }

  dimension: language_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.LanguageKey_SPRAS ;;
  }

  dimension: two_character_sap_language_code {
    hidden: yes
    type: string
    sql: ${TABLE}.TwoCharacterSapLanguageCode_LAISO ;;
  }

  dimension: looker_locale {
    hidden: yes
    type: string
    sql: ${TABLE}.Looker_Locale ;;
  }
}
