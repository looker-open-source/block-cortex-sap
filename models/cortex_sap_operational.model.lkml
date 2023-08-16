# Define the database connection to be used for this model.
connection: "@{CONNECTION_NAME}"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: cortex_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cortex_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Cortex"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

include: "/LookML_Dashboard/*.dashboard.lookml"

named_value_format: Greek_Number_Format {
  value_format: "[>=1000000000]0.0,,,\"B\";[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0.0"
}

explore: data_intelligence_ar {
sql_always_where: ${Client_ID} = "@{CLIENT}" ;;
  join: currency_conversion_new {
    type: left_outer
    relationship: one_to_many
    sql_on: ${data_intelligence_ar.Client_ID}=${currency_conversion_new.mandt}
          and ${data_intelligence_ar.Local_Currency_Key}=${currency_conversion_new.fcurr}
          and ${data_intelligence_ar.Posting_date} = ${currency_conversion_new.conv_date}
          and ${currency_conversion_new.kurst} = "M"
          and ${currency_conversion_new.tcurr} = {% parameter data_intelligence_ar.Currency_Required %};;
    fields: [] #this view used for currency convesion only so no fields need to be included in the explore
  }
}

explore: sales_orders {

  join: language_map {
    fields: []
    type: left_outer
    sql_on: ${language_map.looker_locale}='{{ _user_attributes['locale'] }}' ;;
    relationship: many_to_one
  }

  join: deliveries{
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.sales_document_vbeln}=${deliveries.sales_order_number_vgbel}
          and ${sales_orders.item_posnr}=${deliveries.sales_order_item_vgpos}
          and ${sales_orders.client_mandt}=${deliveries.client_mandt};;
  }

  join: currency_conversion_new {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.client_mandt}=${currency_conversion_new.mandt}
          and ${sales_orders.currency_waerk}=${currency_conversion_new.fcurr}
          and ${sales_orders.creation_date_erdat_date} = ${currency_conversion_new.conv_date}
          and ${currency_conversion_new.kurst} = "M"
          and ${currency_conversion_new.tcurr} = {% parameter sales_orders.Currency_Required %};;
  }

  join: billing {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.sales_document_vbeln}=${billing.sales_document_aubel}
          and ${sales_orders.item_posnr}=${billing.sales_document_item_aupos}
          and ${sales_orders.client_mandt}=${billing.client_mandt} ;;
  }

  join: materials_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.material_number_matnr}=${materials_md.material_number_matnr}
          and ${sales_orders.client_mandt}=${materials_md.client_mandt} and
          ${materials_md.language_spras}=${language_map.language_key};;
  }

  join: customers_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.client_mandt}=${customers_md.client_mandt}
      and ${sales_orders.sold_to_party_kunnr} = ${customers_md.customer_number_kunnr};;
  }

  join: customers_md_partner_function {
    from: customers_md
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_orders.client_mandt}=${customers_md_partner_function.client_mandt}
      and ${sales_orders.customer_kunnr} = ${customers_md_partner_function.customer_number_kunnr};;
  }

  join: countries_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${customers_md.country_key_land1}=${countries_md.country_key_land1}
          and ${countries_md.client_mandt}=${sales_orders.client_mandt}
          and ${countries_md.language_spras}=${language_map.language_key} ;;
  }

  join: sales_organizations_md {
    type: left_outer
    relationship: one_to_many
    sql_on: ${sales_organizations_md.sales_org_vkorg}=${sales_orders.sales_organization_vkorg}
          and ${sales_organizations_md.client_mandt}=${sales_orders.client_mandt}
          and ${sales_organizations_md.language_spras}=${language_map.language_key} ;;
    }
    join: distribution_channels_md {
      type: left_outer
      relationship: one_to_many
      sql_on: ${distribution_channels_md.distribution_channel_vtweg}=${sales_orders.distribution_channel_vtweg}
            and  ${sales_orders.client_mandt}=${distribution_channels_md.client_mandt}
            and ${distribution_channels_md.language_spras}=${language_map.language_key};;
    }

    join: sales_order_pricing {
      type: left_outer
      relationship: one_to_many
      sql_on: ${sales_orders.client_mandt}=${sales_order_pricing.client_mandt}
            AND ${sales_orders.condition_number_knumv}=${sales_order_pricing.number_of_the_document_condition_knumv}
            AND ${sales_orders.item_posnr} = ${sales_order_pricing.condition_item_number_kposn};;
    }

    join: one_touch_order {
      type: left_outer
      relationship: one_to_many
      sql_on: ${sales_orders.client_mandt}=${one_touch_order.vbapclient_mandt}
            and  ${sales_orders.sales_document_vbeln}=${one_touch_order.vbapsales_document_vbeln}
            and ${sales_orders.item_posnr}=${one_touch_order.vbapsales_document_item_posnr};;
    }

    join: sales_order_schedule_line_dt{
      type: left_outer
      relationship: one_to_many
      sql_on:  ${sales_orders.client_mandt}=${sales_order_schedule_line_dt.sales_order_schedule_line_client_mandt}
            and  ${sales_orders.sales_document_vbeln}=${sales_order_schedule_line_dt.sales_order_schedule_line_sales_document_vbeln}
            and ${sales_orders.item_posnr}=${sales_order_schedule_line_dt.sales_order_schedule_line_sales_document_item_posnr};;
    }

    join: divisions_md {
      type: left_outer
      relationship: one_to_many
      sql_on: ${sales_orders.client_mandt}=${divisions_md.client_mandt}
            and ${sales_orders.division_spart}=${divisions_md.division_spart}
            and ${language_map.language_key}=${divisions_md.language_key_spras} ;;
    }

    join: sales_order_header_status {
      type: left_outer
      relationship: one_to_many
      sql_on: ${sales_orders.client_mandt}=${sales_order_header_status.client_mandt}
        and ${sales_orders.sales_document_vbeln}=${sales_order_header_status.sales_document_vbeln};;
    }

    join: sales_order_partner_function {
      type: left_outer
      relationship: one_to_many
      sql_on: ${sales_orders.client_mandt}=${sales_order_partner_function.client_mandt}
            and ${sales_orders.sales_document_vbeln}= ${sales_order_partner_function.sales_document_vbeln}
            and ${sales_orders.item_posnr} = ${sales_order_partner_function.item_posnr};;
    }

    join: sales_order_partner_function_header {
      from: sales_order_partner_function
      type: left_outer
      relationship: one_to_many
      sql_on: ${sales_orders.client_mandt}=${sales_order_partner_function_header.client_mandt}
          and ${sales_orders.sales_document_vbeln}= ${sales_order_partner_function_header.sales_document_vbeln}
          and (${sales_order_partner_function.item_posnr} is Null or ${sales_order_partner_function_header.item_posnr} = '000000');;
    }

    sql_always_where: ${client_mandt}='{{ _user_attributes['client_id_rep'] }}' ;;

  }

  ########################################### Finanace Dashboards ########################################################################

explore: vendor_performance {
  sql_always_where: ${vendor_performance.client_mandt} = '{{ _user_attributes['client_id_rep'] }}'
    and ${language_map.looker_locale}='{{ _user_attributes['locale'] }}'
    ;;

  join: language_map {
    fields: []
    type: left_outer
    sql_on: ${vendor_performance.language_key} = ${language_map.language_key} ;;
    relationship: many_to_one
  }

  join: materials_valuation_v2 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vendor_performance.client_mandt} = ${materials_valuation_v2.client_mandt}
    and ${vendor_performance.material_number} = ${materials_valuation_v2.material_number_matnr}
    and ${vendor_performance.plant} = ${materials_valuation_v2.valuation_area_bwkey}
    and ${vendor_performance.month_year} = ${materials_valuation_v2.month_year}
    and ${materials_valuation_v2.valuation_type_bwtar} = ''
    ;;
    }
}

explore: days_payable_outstanding_v2 {
  sql_always_where: ${client_mandt} = '{{ _user_attributes['client_id_rep'] }}' ;;
}


explore: accounts_payable_v2 {

  sql_always_where: ${accounts_payable_v2.client_mandt} =  '{{ _user_attributes['client_id_rep'] }}';;
}

explore: cash_discount_utilization {
  sql_always_where: ${client_mandt} = '{{ _user_attributes['client_id_rep'] }}';;
}


explore: accounts_payable_overview_v2 {

  sql_always_where: ${accounts_payable_overview_v2.client_mandt} =  '{{ _user_attributes['client_id_rep'] }}' ;;
}

explore: accounts_payable_turnover_v2 {

  sql_always_where: ${accounts_payable_turnover_v2.client_mandt} = '{{ _user_attributes['client_id_rep'] }}' ;;
}

explore: materials_valuation_v2 {
  sql_always_where: ${client_mandt} = '{{ _user_attributes['client_id_rep'] }}' ;;
}

########################################### Finanace Dashboards End ########################################################################

################################################ Supply Chain #######################################################


explore: inventory_metrics_overview {
  sql_always_where: ${inventory_metrics_overview.client_mandt} = '{{ _user_attributes['client_id_rep'] }}'
  and ${language_map.looker_locale}='{{ _user_attributes['locale'] }}';;

  join: inventory_by_plant {
    type: left_outer
    relationship: many_to_one
    fields: [inventory_by_plant.stock_characteristic]
    sql_on: ${inventory_by_plant.client_mandt} = ${inventory_metrics_overview.client_mandt}
      and ${inventory_by_plant.company_code_bukrs} = ${inventory_metrics_overview.company_code_bukrs}
    ;;
  }

  join: language_map {
    fields: []
    type: left_outer
    sql_on: ${inventory_metrics_overview.language_spras} = ${language_map.language_key} ;;
    relationship: many_to_one
  }
}

explore: inventory_by_plant {
    sql_always_where: ${inventory_by_plant.client_mandt} = '{{ _user_attributes['client_id_rep'] }}'
        and ${language_map.looker_locale}='{{ _user_attributes['locale'] }}'
    ;;

  join: language_map {
    fields: []
    type: left_outer
    sql_on: ${inventory_by_plant.language_spras} = ${language_map.language_key} ;;
    relationship: many_to_one
  }
}

################################################ End of Supply Chain #################################################
