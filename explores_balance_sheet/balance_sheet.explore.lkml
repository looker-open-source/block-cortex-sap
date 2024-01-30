include: "/views/balance_sheet_rfn.view"
include: "/views/language_map_sdt.view"
include: "/views/balance_sheet_hierarchy_selection_sdt.view"

explore: balance_sheet {
  always_join: [language_map_sdt]

  always_filter: {filters:[balance_sheet.hierarchy_name: "FPA1",balance_sheet.chart_of_accounts: "CA01",balance_sheet.company_text: "%CENTRAL%",balance_sheet.target_currency_tcurr: "USD"]}

  # always filter on:
  #   - Client as defined with constant
  #   - if parameter select_fiscal_period is in the query, keep only rows where fiscal_period_group (Reporting/Comparison) is not null
  sql_always_where: ${balance_sheet.client_mandt}='@{CLIENT}'
      {% if balance_sheet.select_fiscal_period._in_query %}
        and ${balance_sheet.fiscal_period_group} is not null
      {% endif %}
      ;;

  join: language_map_sdt {
    type: inner
    relationship: many_to_one
    sql_on: ${balance_sheet.language_key_spras} = ${language_map_sdt.language_spras} ;;
    fields: []
  }

  join: balance_sheet_hierarchy_selection_sdt {
    type: inner
    relationship: many_to_one
    sql_on: ${balance_sheet.client_mandt} = ${balance_sheet_hierarchy_selection_sdt.client_mandt} and
            ${balance_sheet.hierarchy_name} = ${balance_sheet_hierarchy_selection_sdt.hierarchy_name} and
            ${balance_sheet.chart_of_accounts} = ${balance_sheet_hierarchy_selection_sdt.chart_of_accounts} and
            ${balance_sheet.language_key_spras} = ${balance_sheet_hierarchy_selection_sdt.language_key_spras} and
            ${balance_sheet.node} = ${balance_sheet_hierarchy_selection_sdt.node};;

  }
}
