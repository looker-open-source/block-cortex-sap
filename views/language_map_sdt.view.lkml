#########################################################{
# Filters Languages_T002 to single row based on the `locale` user attribute value.
# If user does not have a locale value or if the user's locale is not one of the
# Languages used for Balance Sheet or Profit and Loss,
#
# The `locale` user attribute is used to Localize a LookML Model and impacts
# language used for User Interface, labels and/or number formatting.
# The supported user-interface languages with the Looker Locale Code are found here:
#    https://cloud.google.com/looker/docs/supported-user-interface-languages#localizing_the_looker_user_interface
#
# If Looker has not been configured for Localization, admin will need to add
# a user_attribute named `locale` with default value of 'en' or 'EN'.
# And admin will need to assign users or user groups values using:
#    Looker Locale Code or
#    SAP LAISO code (two-character SAP language Code)
#
# Steps in the dynamic generation of SQL based on user's locale
# (for this example, user's locale = 'es_ES'):
#   1. Capture user's value in locale user attribute and:
#       - replace 'nb' with 'no' (so Norweign locale string parse correctly to SAP LAISO code)
#       - convert to UPPER case
#       - split into array on '_' (first value of array will be used in SQL)
#   2. Generate WHERE clause using first value of locale array:
#         WHERE TwoCharacterSapLanguageCode_LAISO = 'ES'
#   3. If the languague_map_sdt view used in either Balance Sheet or Profit and Loss Explores,
#      add another condition to WHERE clause:
#         AND LanguagueKey_SPRAS in (select distinct languageKey_SPRAS FROM BalanceSheet (or ProfitAndLoss))
#   4. To ensure English is used if locale value does not match SAP LAISO code or not part of
#      Balance Sheet or Profit and Loss data, add UNION ALL to always include English as a row
#         UNION ALL SELECT 'E' as LanguageKey_SPRAS
#   5. Limit to only 1 row, keeping a valid locale value first and English second
#
# JOIN this view as inner join to materials_MD and others which require language_key_spras
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
