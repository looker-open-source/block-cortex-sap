#########################################################{
# Income Statement financial report using Table visualization with Subtotals
# EXTENDS filters and title summary from income_statement_template
# EXTENDS Income Statement Table visualization from income_statement_subtotal_table
# customizations:
#   - filter Select Comparison Type options and default set to None
#   - Removed comparison-related fields from Income Statement table from fields: property and set size_to_fit: property to false
#   - Navigation viz filter focus_page set to '2' and filter which_dashboard_style set to 'subtotal'
#########################################################}

- dashboard: income_statement_subtotal_table_no_comparison
  title: Financial Income Statement
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Shows a company's financial performance over a specific period (e.g., a month, quarter, or year). This report summarizes Revenues, Expenses and/or Net Income (Loss) at specified hierarchy level."
  filters_location_top: false
  extends: [income_statement_template, income_statement_subtotal_table]

  elements:
  - title: income statement table
    name: income statement table
    fields: [profit_and_loss_hierarchy_selection_sdt.hier1_node_text, profit_and_loss_hierarchy_selection_sdt.hier2_node_text,
      profit_and_loss_hierarchy_selection_sdt.hier3_node_text, profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator,
      profit_and_loss_03_selected_fiscal_periods_sdt.reporting_amount]
    size_to_fit: false


  - title: navigation
    name: navigation
    filters:
      profit_and_loss_navigation_ext.navigation_focus_page: '2'
      profit_and_loss_navigation_ext.navigation_which_dashboard_style: 'subtotal'

  filters:
  - name: Select Comparison Type
    title: Select Comparison Type
    type: field_filter
    default_value: "none"
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - none
    explore: profit_and_loss
    listens_to_filters: []
    field: profit_and_loss.parameter_compare_to
