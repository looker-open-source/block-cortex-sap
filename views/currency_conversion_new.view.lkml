view: currency_conversion_new {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.CurrencyConversion`
    ;;
  
  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${mandt},${kurst},${fcurr},${tcurr},${conv_date_1});;
  }
  
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
    #primary_key: yes
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

  dimension: fcurr {
    type: string
    sql: ${TABLE}.FromCurrency_FCURR ;;
    #primary_key: yes
  }

  dimension: kurst {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  dimension: mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
    #primary_key: yes
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
    #primary_key: yes
    hidden: no
  }

  dimension: ukurs {
    type: number
    sql: ${TABLE}.ExchangeRate_UKURS ;;
    hidden: no
  }

  measure: average_ukurs {
    type: average
    sql: ${ukurs} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
