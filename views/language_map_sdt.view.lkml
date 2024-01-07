######################
# this sdt view filters Languages_T002 base on the `locale` user attribute value
#
# `locale` user attribute is used to Localize a LookML Model and impact
# language used for labels or number formatting
# the supported user-interface languages with the Looker Locale Code are found here:
#    https://cloud.google.com/looker/docs/supported-user-interface-languages#localizing_the_looker_user_interface
#
# if Looker has not been set up for Localization, admin will still need to add a user_attribute named `locale`
#  with default value of 'en' or 'EN'. And they will need to assign users or user groups values for either:
#    Looker Locale Code or
#    SAP LAISO code (two-character SAP language Code
#
# this view captures the user_attribute value and uses liquid to convert it to LAISO two-character value with logic:
#   - read user_attribute value (for this example, user_attribute = 'es_ES')
#   - create an array using split user attribute value by '_' and applying uppercase (see locale_key)
#   - if first value of array (locale_key[0]) = 'NB' set locale to 'NO'
#     - else set locale = to first value of array
#   - return the value for locale and inject into where clause
#        where = TwoCharacterSapLanguageCode_LAISO = 'ES'
#
#  use this view as inner join to BalanceSheet and others which require language_key_spras
######################


view: language_map_sdt {

  derived_table: {
    sql: select LanguageKey_SPRAS as Language_SPRAS
                ,TwoCharacterSapLanguageCode_LAISO
         from `@{GCP_PROJECT}.@{REPORTING_DATASET}.Languages_T002`
         where TwoCharacterSapLanguageCode_LAISO =
          {% assign locale_key = _user_attributes['locale'] | split:'_' %}
          {% if locale_key[0] == 'nb' %}{%assign locale = 'NO' %}{%else%}{%assign locale = locale_key[0] | upcase %}{% endif %}
          '{{locale}}';;
  }

  dimension: language_spras {
    primary_key: yes
    label: "Language Key SPRAS"
    type: string
    sql: ${TABLE}.Language_SPRAS ;;
  }

  dimension: two_character_sap_language_code_laiso {
    label: "Two Character SAP Language Code LAISO"
    type: string
    sql: ${TABLE}.TwoCharacterSapLanguageCode_LAISO ;;
  }

}
