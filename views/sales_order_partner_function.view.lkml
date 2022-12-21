# The name of this view in Looker is "Sales Order Partner Function"
view: sales_order_partner_function {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.SalesOrderPartnerFunction`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address Adrnr" in Explore.

  dimension: address_adrnr {
    type: string
    sql: ${TABLE}.Address_ADRNR ;;
  }
  dimension: sold_to_party {
    type: string
    sql: if(${partner_function_parvw}='AG',${customer_kunnr},NULL) ;;
  }

  dimension:  ship_to_party {
    type: string
    sql: if(${partner_function_parvw}='WE',${customer_kunnr},NULL)  ;;
  }

  dimension: bill_to_party {
    type: string
    sql: if(${partner_function_parvw}='RE',${customer_kunnr},NULL) ;;
  }

  dimension: address_indicator_adrda {
    type: string
    sql: ${TABLE}.AddressIndicator_ADRDA ;;
  }

  dimension: assignment_to_hierarchy_hzuor {
    type: string
    sql: ${TABLE}.AssignmentToHierarchy_HZUOR ;;
  }

  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
    primary_key: yes
  }

  dimension: country_land1 {
    type: string
    sql: ${TABLE}.Country_LAND1 ;;
  }

  dimension: customer_description_of_partner_knref {
    type: string
    sql: ${TABLE}.CustomerDescriptionOfPartner_KNREF ;;
  }

  dimension: customer_hierarchy_type_hityp {
    type: string
    sql: ${TABLE}.CustomerHierarchyType_HITYP ;;
  }

  dimension: customer_kunnr {
    type: string
    sql: ${TABLE}.Customer_KUNNR ;;
    primary_key: yes
    hidden: no
  }

  dimension: data_filter_value_for_data_aging_dataaging {
    type: number
    sql: ${TABLE}.DataFilterValueForDataAging_DATAAGING ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_data_filter_value_for_data_aging_dataaging {
    type: sum
    sql: ${data_filter_value_for_data_aging_dataaging} ;;
  }

  measure: average_data_filter_value_for_data_aging_dataaging {
    type: average
    sql: ${data_filter_value_for_data_aging_dataaging} ;;
  }

  dimension: dummy_function_in_length1_dummy_sddocpartner_incl_eew_ps {
    type: number
    sql: ${TABLE}.DummyFunctionInLength1_DUMMY_SDDOCPARTNER_INCL_EEW_PS ;;
  }

  dimension: indicator_customer_to_receive_rebates_bokre {
    type: string
    sql: ${TABLE}.IndicatorCustomerToReceiveRebates_BOKRE ;;
  }

  dimension: indicator_further_partners_parvw_ff {
    type: string
    sql: ${TABLE}.IndicatorFurtherPartners_PARVW_FF ;;
  }

  dimension: indicator_one_time_account_xcpdk {
    type: string
    sql: ${TABLE}.IndicatorOneTimeAccount_XCPDK ;;
  }

  dimension: item_posnr {
    type: string
    sql: ${TABLE}.Item_POSNR ;;
    primary_key: yes
  }

  dimension: level_number_within_hierarchy_histunr {
    type: string
    sql: ${TABLE}.LevelNumberWithinHierarchy_HISTUNR ;;
  }

  dimension: maintain_appointments_in_calendar_kale {
    type: string
    sql: ${TABLE}.MaintainAppointmentsInCalendar_KALE ;;
  }

  dimension: number_of_contact_person_parnr {
    type: string
    sql: ${TABLE}.NumberOfContactPerson_PARNR ;;
  }

  dimension: partner_function_parvw {
    type: string
    sql: ${TABLE}.PartnerFunction_PARVW ;;
  }

  dimension: person_number_adrnp {
    type: string
    sql: ${TABLE}.PersonNumber_ADRNP ;;
  }

  dimension: personnel_number_pernr {
    type: string
    sql: ${TABLE}.PersonnelNumber_PERNR ;;
  }

  dimension: relevant_for_price_determination_id_prfre {
    type: string
    sql: ${TABLE}.RelevantForPriceDeterminationID_PRFRE ;;
  }

  dimension: sales_document_vbeln {
    type: string
    sql: ${TABLE}.SalesDocument_VBELN ;;
    primary_key: yes
  }

  dimension: transportation_zone_lzone {
    type: string
    sql: ${TABLE}.TransportationZone_LZONE ;;
  }

  dimension: unloading_point_ablad {
    type: string
    sql: ${TABLE}.UnloadingPoint_ABLAD ;;
  }

  dimension: vatregistration_number_stceg {
    type: string
    sql: ${TABLE}.VATRegistrationNumber_STCEG ;;
  }

  dimension: vendor_lifnr {
    type: string
    sql: ${TABLE}.Vendor_LIFNR ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
