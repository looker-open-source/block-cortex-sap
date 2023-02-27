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
          and ${currency_conversion_new.kurst} = "M";;
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


    join: currency_conversion_pricing {
      from: currency_conversion_new
      type: left_outer
      relationship: many_to_one
      sql_on: ${sales_order_pricing.client_mandt} = ${currency_conversion_pricing.mandt}
          AND ${sales_order_pricing.checkbox_kdatu_date} = ${currency_conversion_pricing.conv_date}
          AND ${sales_order_pricing.condition_value_currency_key_waers} = ${currency_conversion_pricing.fcurr}
          AND ${currency_conversion_pricing.kurst} = 'M';;
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
  sql_always_where: ${vendor_performance.client_mandt} = '{{ _user_attributes['client_id_rep'] }}';;
  always_filter: { filters: [material_types_md.language_key_spras: "E"]}
  join: language_map {
    fields: []
    type: left_outer
    sql_on: ${language_map.looker_locale}='{{ _user_attributes['locale'] }}' ;;
    relationship: many_to_one
  }
  join: materials_md {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vendor_performance.material_number}=${materials_md.material_number_matnr} and ${vendor_performance.client_mandt}=${materials_md.client_mandt} ;;
  }
  join: material_types_md {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vendor_performance.material_type}=${material_types_md.material_type_mtart} and ${vendor_performance.client_mandt}=${material_types_md.client_mandt} ;;
  }
  join: material_groups_md {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vendor_performance. material_group}=${material_groups_md. material_group_matkl} and ${vendor_performance.client_mandt}=${material_groups_md.client_mandt} ;;
  }

  join: material_valuation {
    type: left_outer
    relationship: many_to_one
    sql_on: ${material_valuation.client_mandt} = ${vendor_performance.client_mandt} and ${material_valuation.material_number_matnr} = ${vendor_performance.material_number} and ${vendor_performance.plant}= ${material_valuation.valuation_area_bwkey};;
  }

  join: currency_conversion_new {
    type: left_outer
    relationship: many_to_one
    sql_on: ${vendor_performance.client_mandt} = ${currency_conversion_new.mandt}
    and ${vendor_performance.currency_key_waers} = ${currency_conversion_new.fcurr}
    and ${vendor_performance.Invoice_date_date} = ${currency_conversion_new.conv_date}
    and ${currency_conversion_new.kurst} = "M" ;;
   }
  }

explore: accountspayable {
  sql_always_where: ${accountspayable.client_mandt} = '{{ _user_attributes['client_id_rep'] }}';;
  join: currency_conversion_new {
    type: left_outer
    relationship: many_to_one
    sql_on: ${accountspayable.client_mandt} = ${currency_conversion_new.mandt}
          and ${accountspayable.Currency} = ${currency_conversion_new.fcurr}
          and ${accountspayable.posting_date_in_the_document_budat} = ${currency_conversion_new.conv_date}
          and ${currency_conversion_new.kurst} = "M";;
  }
}

explore: accountspayable_apt {
  sql_always_where: ${accountspayable_apt.client_mandt} = '{{ _user_attributes['client_id_rep'] }}';;

  join: currency_conversion_new {
    type: left_outer
    relationship: many_to_one
    sql_on: ${accountspayable_apt.client_mandt} = ${currency_conversion_new.mandt}
          and ${accountspayable_apt.currency_key_waers} = ${currency_conversion_new.fcurr}
          and ${accountspayable_apt.posting_date_in_the_document_budat} = ${currency_conversion_new.conv_date}
          and ${currency_conversion_new.kurst} = "M";;
  }
}

explore: accountspayable_cdu {
  sql_always_where: ${accountspayable_cdu.client_mandt} = '{{ _user_attributes['client_id_rep'] }}';;

  join: currency_conversion_new {
    type: left_outer
    relationship: many_to_one
    sql_on: ${accountspayable_cdu.client_mandt} = ${currency_conversion_new.mandt}
          and ${accountspayable_cdu.currency_key_waers} = ${currency_conversion_new.fcurr}
          and ${accountspayable_cdu.posting_date_in_the_document_budat_date} = ${currency_conversion_new.conv_date}
          and ${currency_conversion_new.kurst} = "M";;
  }

}

explore: days_payable_outstanding {
  sql_always_where: ${days_payable_outstanding.client_mandt} = '{{ _user_attributes['client_id_rep'] }}';;
  join: accountspayable {
    type: left_outer
    relationship: one_to_many
    sql_on: ${accountspayable.client_mandt} = ${days_payable_outstanding.client_mandt} and
      ${accountspayable.company_code_bukrs} = ${days_payable_outstanding.company_code_bukrs};;
  }
  join: currency_conversion_new {
    type: left_outer
    relationship: one_to_many
    sql_on: ${days_payable_outstanding.client_mandt} = ${currency_conversion_new.mandt} ;;
  }
}

########################################### Finanace Dashboards End ########################################################################
