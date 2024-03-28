#########################################################{
# PURPOSE
# The Balance Sheet Explore supports the Balance Sheet dashboards
# and any adhoc querying of balance_sheet
#
# SOURCES
# See the "include: " statements below for specifc source
#
# REFERENCED BY
#   LookML dashboards:
#     balance_sheet_template
#     balance_sheet_mktplace_report_table
#     balance_sheet_subtotal3_table
#     balance_sheet_subtotal3_table_no_comparison
#
# KEYS TO USING
#   - always_filter on hierarchy_name, chart_of_accounts, company_text and target_currency_tcurr
#   - always_join to `language_map_sdt` so Explore automatically filters to user's locale setting (or English)
#   - sql_always_where to limit to single Client MANDT based on CLIENT constant set in manifest file
#   - For small views that only add a few fields to the Explore, set the view label to "Balance Sheet" in the "join:" property.
#########################################################}

include: "/views/balance_sheet_rfn.view"
include: "/views/language_map_sdt.view"
include: "/views/universal_ledgers_md_rfn.view"
include: "/views/balance_sheet_fiscal_periods_selected_sdt.view"
include: "/views/balance_sheet_hierarchy_selection_sdt.view"
include: "/views/balance_sheet_navigation_ext.view"

explore: balance_sheet {
  always_join: [language_map_sdt]

  always_filter: {filters:[balance_sheet.hierarchy_name: "",balance_sheet.chart_of_accounts: "",balance_sheet.company_text: "",balance_sheet.target_currency_tcurr: ""]}

  # always filter on:
  #   - Client as defined with constant
  sql_always_where: ${balance_sheet.client_mandt}='@{CLIENT}';;

  join: language_map_sdt {
    type: inner
    relationship: many_to_one
    sql_on: ${balance_sheet.language_key_spras} = ${language_map_sdt.language_spras} ;;
    fields: []
  }

  join: universal_ledgers_md {
    view_label: "Balance Sheet"
    type: left_outer
    relationship: many_to_one
    sql_on: ${balance_sheet.client_mandt} = ${universal_ledgers_md.client_mandt} AND
            ${balance_sheet.ledger_in_general_ledger_accounting} = ${universal_ledgers_md.ledger_rldnr} AND
            ${balance_sheet.language_key_spras} = ${universal_ledgers_md.language_langu};;
  }

  join: balance_sheet_fiscal_periods_selected_sdt {
    type: inner
    relationship: many_to_one
    sql_on: ${balance_sheet.hierarchy_name} = ${balance_sheet_fiscal_periods_selected_sdt.hierarchy_name} AND
            ${balance_sheet.company_code}= ${balance_sheet_fiscal_periods_selected_sdt.company_code} AND
            ${balance_sheet.fiscal_year} = ${balance_sheet_fiscal_periods_selected_sdt.fiscal_year} AND
             ${balance_sheet.fiscal_period} =  ${balance_sheet_fiscal_periods_selected_sdt.fiscal_period};;
  }

  join: balance_sheet_hierarchy_selection_sdt {
    view_label: "Balance Sheet"
    type: inner
    relationship: many_to_one
    sql_on: ${balance_sheet.client_mandt} = ${balance_sheet_hierarchy_selection_sdt.client_mandt} and
            ${balance_sheet.hierarchy_name} = ${balance_sheet_hierarchy_selection_sdt.hierarchy_name} and
            ${balance_sheet.chart_of_accounts} = ${balance_sheet_hierarchy_selection_sdt.chart_of_accounts} and
            ${balance_sheet.language_key_spras} = ${balance_sheet_hierarchy_selection_sdt.language_key_spras} and
            ${balance_sheet.node} = ${balance_sheet_hierarchy_selection_sdt.node};;
  }

  join: balance_sheet_navigation_ext {
    view_label: "🔍 Filters & 🛠 Tools"
    relationship: one_to_one
    sql:  ;;
}
}
