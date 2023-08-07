# The name of this view in Looker is "Distribution Channels Md"
view: distribution_channels_md {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.DistributionChannelsMD`
    ;;

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client Mandt" in Explore.
  
  fields_hidden_by_default: yes
  
  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt},${distribution_channel_vtweg},${language_spras});;
  }
  
  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: distribution_channel_name_vtext {
    type: string
    sql: ${TABLE}.DistributionChannelName_VTEXT ;;
    hidden: no
  }

  dimension: distribution_channel_vtweg {
    type: string
    sql: ${TABLE}.DistributionChannel_VTWEG ;;
    #primary_key: yes
  }

  dimension: language_spras {
    type: string
    sql: ${TABLE}.Language_SPRAS ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
