#########################################################{
# Income Statement financial report using Report Table visualization (available for free on Looker Marketplace)
#   but without Comparison to year ago, prior or custom fiscal periods
# EXTENDS filters and title summary from income_statement_template
# EXTENDS Income Statement Table visualization from income_statement_mktplace_report_table
# customizations:
#   - filter Select Comparison Type options and default set to None
#   - Removed comparison-related fields from Income Statement table from fields: property
#   - Navigation viz filter focus_page set to '2' and which_dashboard_style set to 'mktplace^_report'
#########################################################}

- dashboard: income_statement_mktplace_report_table_no_comparison
  title: Financial Income Statement
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Using the Report (Table) visualization available from Looker Marketplace, this report shows a company's financial performance over a specific period (e.g., a month, quarter, or year). This report summarizes Revenues, Expenses and/or Net Income (Loss) at specified hierarchy level."
  filters_location_top: false
  extends: [income_statement_template, income_statement_mktplace_report_table]

  elements:
  - title: income statement table
    name: income statement table
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [profit_and_loss_hierarchy_selection_sdt.hier1_node_text, profit_and_loss_hierarchy_selection_sdt.hier2_node_text,
      profit_and_loss_hierarchy_selection_sdt.hier3_node_text, profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator,
      profit_and_loss_03_selected_fiscal_periods_sdt.reporting_amount]

  - title: navigation
    name: navigation
    filters:
      profit_and_loss_navigation_ext.navigation_focus_page: '2'
      profit_and_loss_navigation_ext.navigation_which_dashboard_style: 'mktplace^_report'

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
