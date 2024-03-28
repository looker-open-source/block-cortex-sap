#########################################################{
# Balance Sheet financial report using Subtotals
# extends filters and title summary from balance_sheet_template
# customizations:
#   - Comparison Type filter options set to only yoy, prior or custom (none removed as option)
#   - Balance Sheet table based on looker_grid visualization type using derived amounts for
#     reporting and comparison periods including derived differences (amount and %)
#########################################################}

- dashboard: balance_sheet_subtotal3_table
  title: Financial Balance Sheet
  layout: newspaper
  preferred_viewer: dashboards-next
  description: Using standard table with subtotals, reports Fiscal Period Cumulative
    Amount in Global Currency for the selected hierarchy, chart
    of accounts, company, fiscal period and comparison period (if any).
  filters_location_top: false
  extends: balance_sheet_template

  elements:
  - title: Balance Sheet
    name: Balance Sheet
    explore: balance_sheet
    type: looker_grid
    fields: [balance_sheet_fiscal_periods_selected_sdt.reporting_period_amount_in_global_currency, balance_sheet_fiscal_periods_selected_sdt.comparison_period_amount_in_global_currency,
      balance_sheet_fiscal_periods_selected_sdt.difference_value, balance_sheet_fiscal_periods_selected_sdt.difference_percent, balance_sheet_hierarchy_selection_sdt.hier1_node_text,
      balance_sheet_hierarchy_selection_sdt.hier2_node_text, balance_sheet_hierarchy_selection_sdt.hier3_node_text]
    sorts: [balance_sheet_hierarchy_selection_sdt.hier1_node_text, balance_sheet_hierarchy_selection_sdt.hier2_node_text, balance_sheet_hierarchy_selection_sdt.hier3_node_text]
    subtotals: [balance_sheet_hierarchy_selection_sdt.hier1_node_text, balance_sheet_hierarchy_selection_sdt.hier2_node_text]
    total: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    title_hidden: true
    minimum_column_width: 100
    series_labels:
      balance_sheet_hierarchy_selection_sdt.hier1_node_text: ' '
      balance_sheet_hierarchy_selection_sdt.hier2_node_text: ' '
      balance_sheet_hierarchy_selection_sdt.hier3_node_text: ' '
    series_collapsed:
      balance_sheet_hierarchy_selection_sdt.hier1_node_text: false
      balance_sheet_hierarchy_selection_sdt.hier2_node_text: false
    align: left
    listen:
      Fiscal Period: balance_sheet.select_fiscal_period
      Comparison Type: balance_sheet.select_comparison_type
      Custom Comparison Period: balance_sheet.select_custom_comparison_period
      Hierarchy: balance_sheet.hierarchy_name
      Chart of Accounts: balance_sheet.chart_of_accounts
      Company Code: balance_sheet.company_text
      Global Currency: balance_sheet.target_currency_tcurr
      Ledger Name: universal_ledgers_md.ledger_id_name
      Top Hierarchy Level: balance_sheet_hierarchy_selection_sdt.parameter_pick_start_level
    row: 3
    col: 0
    width: 24
    height: 8

  - title: navigation
    name: navigation
    explore: balance_sheet
    type: single_value
    fields: [balance_sheet_navigation_ext.navigation]
    filters:
      balance_sheet_navigation_ext.navigation_focus_page: '1'
      balance_sheet_navigation_ext.navigation_style: 'small'
    show_single_value_title: false
    show_comparison: false
    listen:
      Fiscal Period: balance_sheet_navigation_ext.filter1
      Global Currency: balance_sheet_navigation_ext.filter2
      Hierarchy: balance_sheet_navigation_ext.filter3
      Chart of Accounts: balance_sheet_navigation_ext.filter4
      Company Code: balance_sheet_navigation_ext.filter5
      Ledger Name: balance_sheet_navigation_ext.filter6
      Top Hierarchy Level: balance_sheet_navigation_ext.filter7
    row: 11
    col: 0
    width: 24
    height: 1

  filters:
  - name: Comparison Type
    title: Comparison Type
    ui_config:
      type: dropdown_menu
      display: inline
      # remove none option to avoid display issues with comparison and variance columns
      options:
        - yoy
        - prior
        - custom