# The name of this view in Looker is "Sales Organizations Md"
view: sales_organizations_md {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.SalesOrganizationsMD`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Client Mandt" in Explore.
  fields_hidden_by_default: yes
  dimension: client_mandt {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: co_co_currency_waers {
    type: string
    sql: ${TABLE}.CoCoCurrency_WAERS ;;
  }

  dimension: company_butxt {
    type: string
    sql: ${TABLE}.Company_BUTXT ;;
  }

  dimension: company_code_bukrs {
    type: string
    sql: ${TABLE}.CompanyCode_BUKRS ;;
  }

  dimension: country_land1 {
    type: string
    sql: ${TABLE}.Country_LAND1 ;;
  }

  dimension: fiscal_yr_variant_periv {
    type: string
    sql: ${TABLE}.FiscalYrVariant_PERIV ;;
  }

  dimension: language_spras {
    type: string
    sql: ${TABLE}.Language_SPRAS ;;
  }

  dimension: sales_org_currency_waers {
    type: string
    sql: ${TABLE}.SalesOrgCurrency_WAERS ;;
  }

  dimension: sales_org_customer_kunnr {
    type: string
    sql: ${TABLE}.SalesOrgCustomer_KUNNR ;;
  }

  dimension: sales_org_name_vtext {
    type: string
    sql: ${TABLE}.SalesOrgName_VTEXT ;;
    hidden: no
  }

  dimension: sales_org_vkorg {
    type: string
    sql: ${TABLE}.SalesOrg_VKORG ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
