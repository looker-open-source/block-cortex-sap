# The name of this view in Looker is "Currency Conversion"
view: currency_conversion_new {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.CurrencyConversion`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  # parameter: Currency_Required{
  #   type: string
  #   allowed_value: {
  #     label: "USD"
  #     value: "USD"
  #   }
  #   allowed_value: {
  #     label: "EUR"
  #     value: "EUR"
  #   }
  #   allowed_value: {
  #     label: "CAD"
  #     value: "CAD"
  #   }
  #   allowed_value: {
  #     label: "JPY"
  #     value: "JPY"
  #   }
  # }
  fields_hidden_by_default: yes
  dimension_group: conv {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ConvDate ;;
    hidden: no
  }

  dimension: conv_date_1 {
    type: date
    sql: ${conv_date} ;;
    primary_key: yes
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndDate ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Fcurr" in Explore.

  dimension: fcurr {
    type: string
    sql: ${TABLE}.FromCurrency_FCURR ;;
    primary_key: yes
  }

  dimension: kurst {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  dimension: mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
    primary_key: yes
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.StartDate ;;
  }

  dimension: tcurr {
    type: string
    sql: ${TABLE}.ToCurrency_TCURR ;;
    primary_key: yes
    hidden: no
  }

  dimension: ukurs {
    type: number
    sql: ${TABLE}.ExchangeRate_UKURS ;;
    hidden: no
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: average_ukurs {
    type: average
    sql: ${ukurs} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
