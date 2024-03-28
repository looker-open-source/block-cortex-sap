#########################################################{
# PURPOSE
# This SQL-derived Table (SDT) filters Languages_T002 to single row
# based on the `locale` user attribute value.
#
# ENGLISH IS DEFAULT
# English is used if the user's locale value does not match SAP locales.
# Additional checks are performed in Explores balance_sheet and profit_and_loss
# to match the user's locale with languagues in the underlying tables.
# If no match is found, English is used.
#
# SOURCE
# Table `@{GCP_PROJECT}.@{REPORTING_DATASET}.Languages_T002`
#
# REFERENCED BY
# Explore balance_sheet
# Explore profit_and_loss
#
# LOCALE USER ATTRIBUTE
# The `locale` user attribute localizes a LookML model, affecting UI language,
# labels and/or number formatting. Link to supported user-interface languages with
# Looker Locale Codes is below:
#    https://cloud.google.com/looker/docs/supported-user-interface-languages#localizing_the_looker_user_interface
#
# If Localization is not configured in Looker, an administrator needs to add a user
# attribute named `locale` with a default value of `en` or `EN`. Then the administrator
# should assign users or user groups values using the Looker Locale Code or
# SAP LAISO code (two-character SAP language code).
#
# PROCESS
# Below are the steps take to dynamically generate SQL base on user's locale.
# For this example, we'll assume the user's locale is 'es_ES'.
#   1) Capture user's value in locale user attribute and:
#       - replace 'nb' with 'no' (so Norweign locale string parse correctly to SAP LAISO code)
#       - convert to UPPER case
#       - split into array on '_' (first value of array will be used in SQL)
#   2) Generate WHERE clause using first value of locale array:
#         WHERE TwoCharacterSapLanguageCode_LAISO = 'ES'
#   3) If this View is used in either Balance Sheet or Profit and Loss Explores,
#      add another condition to WHERE clause:
#         AND LanguagueKey_SPRAS in (select distinct languageKey_SPRAS FROM BalanceSheet (or ProfitAndLoss))
#   4) To ensure English is used if locale value does not match SAP LAISO code or not part of
#      Balance Sheet or Profit and Loss data, add UNION ALL to always include English as a row
#         UNION ALL SELECT 'E' as LanguageKey_SPRAS
#   5) Apply 'LIMIT 1' to return 1 row, keeping a valid locale value first and English second
#
# HOW TO USE
# This View can be joined to balance_sheet or other views which require language_key_spras. When
# including this View in an Explore, recommend:
#   - using `always_join` so that language is automatically filtered for the use
#   - setting `fields:` property to [] so that no fields from language_map_sdt are
#     visible in the Explore
#
# For example:
#       explore: profit_and_loss {
#           always_join: [language_map_sdt]
#       join: language_map_sdt {
#         type: inner
#         relationship: many_to_one
#         sql_on: ${profit_and_loss.language_key_spras} = ${language_map_sdt.language_spras} ;;
#         fields: []
#       }}
#########################################################}

view: language_map_sdt {

  derived_table: {
    sql: {% assign locale = _user_attributes['locale'] | replace: 'nb','no' | upcase | split: '_' %}
         {% assign explore = _explore._name | replace: 'balance_sheet','BalanceSheet' | replace: 'profit_and_loss','ProfitAndLoss' %}
        SELECT LanguageKey_SPRAS AS Language_SPRAS,
               1 as rnk
        FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.Languages_T002`
        WHERE TwoCharacterSapLanguageCode_LAISO = '{{locale[0]}}'
        {% if explore == 'ProfitAndLoss' or explore == 'BalanceSheet' %}
        AND LanguageKey_SPRAS IN (
            SELECT DISTINCT languageKey_SPRAS
            FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.{{explore}}`)
        {% endif %}
        UNION ALL
        SELECT 'E' as LanguageKey_SPRAS, 2 as rnk
        ORDER BY rnk
        LIMIT 1
          ;;
  }

  dimension: language_spras {
    primary_key: yes
    label: "Language Key SPRAS"
    type: string
    sql: ${TABLE}.Language_SPRAS ;;
  }

}
