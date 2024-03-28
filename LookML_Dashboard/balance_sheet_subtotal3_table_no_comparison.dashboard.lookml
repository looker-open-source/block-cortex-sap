#########################################################{
# Balance Sheet financial report using Subtotals but without Comparison to year ago, prior or custom fiscal periods
# extends filters and title summary from balance_sheet_template
# also extends Balance Sheet Table visualization from balance_sheet_subtotal3_table
# customizations:
#   - Comparison Type filter options set to none
#   - Custom Comparison Period default value and options set to none
#   - Removed comparison-related fields from Balance Sheet table
#########################################################}

- dashboard: balance_sheet_subtotal3_table_no_comparison
  title: Financial Balance Sheet
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Using standard table with subtotals, reports Fiscal Period Cumulative Amount in Global Currency for the selected hierarchy, chart of accounts, company, and fiscal period."
  filters_location_top: false
  extends: [balance_sheet_template, balance_sheet_subtotal3_table]

  filters:
  - name: Comparison Type
    title: Comparison Type
    default_value: none
    ui_config:
      type: dropdown_menu
      display: inline
      # remove all options for comparisons
      options:
        - none

  - name: Custom Comparison Period
    title: Custom Comparison Period
    type: field_filter
    default_value: 'None'
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
        - None
    explore: balance_sheet
    field: balance_sheet.select_custom_comparison_period

  elements:
  - title: Balance Sheet
    name: Balance Sheet
    explore: balance_sheet
    type: looker_grid
    fields: [balance_sheet_fiscal_periods_selected_sdt.reporting_period_amount_in_global_currency,
      balance_sheet_hierarchy_selection_sdt.hier1_node_text,
      balance_sheet_hierarchy_selection_sdt.hier2_node_text, balance_sheet_hierarchy_selection_sdt.hier3_node_text]

  - title: navigation
    name: navigation
    filters:
      balance_sheet_navigation_ext.navigation_focus_page: '2'
