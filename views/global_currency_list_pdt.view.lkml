######################
# this Persistent Derived Table view finds the distinct list of TCURR values found in CurrencyConversion
#
# recommend setting a data trigger based on how often the TCURR value is expected to change
# datagroup trigger set initially as Monthly on First day of month. To use a different trigger:
#     1. define datagroup in datagroups.lkml file found in components folder
#     2. replace datagroup_trigger: value below with name of datagroup
#
# this view is used in Explore Global Currency List to provide suggestions for Global/Target Currency filter values and Exchange Rate Type parameter values
#
######################

view: global_currency_list_pdt {
  derived_table: {
    datagroup_trigger: monthly_on_day_1

    sql: SELECT
            DISTINCT ExchangeRateType_KURST,
            ToCurrency_TCURR
         FROM
          `@{GCP_PROJECT}.@{REPORTING_DATASET}.CurrencyConversion` ;;
  }

  dimension: key {
    primary_key: yes
    sql: concat(${exchange_rate_type_kurst}, ${to_currency_tcurr}) ;;
  }

  dimension: exchange_rate_type_kurst {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  dimension: to_currency_tcurr {
    type: string
    sql: ${TABLE}.ToCurrency_TCURR ;;
  }

}
