#########################################################{
# Income Statement financial report using Report Table visualization (available for free on Looker Marketplace)
# EXTENDS filters and title summary from income_statement_template
# customizations:
#   - Income Statement table based on marketplace_viz_report_table::report_table-marketplace
#   - filter Select Comparison Type options set to yoy and prior with yoy as default
#   - Navigation viz filter focus_page set to '1' and filter which_dashboard_style set to 'mktplace^_report'
#########################################################}

- dashboard: income_statement_mktplace_report_table
  title: Financial Income Statement
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Using the Report (Table) visualization available from Looker Marketplace, this report shows a company's financial performance over a specific period (e.g., a month, quarter, or year) compared to either preceding timeframe or same timeframe last year. This report summarizes Revenues, Expenses and/or Net Income (Loss) at specified hierarchy level."
  filters_location_top: false
  extends: income_statement_template

  elements:
  - title: income statement table
    name: income statement table
    explore: profit_and_loss
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [profit_and_loss_hierarchy_selection_sdt.hier1_node_text, profit_and_loss_hierarchy_selection_sdt.hier2_node_text,
      profit_and_loss_hierarchy_selection_sdt.hier3_node_text, profit_and_loss_03_selected_fiscal_periods_sdt.reporting_amount,
      profit_and_loss_03_selected_fiscal_periods_sdt.comparison_amount, profit_and_loss_03_selected_fiscal_periods_sdt.difference_value,
      profit_and_loss_03_selected_fiscal_periods_sdt.difference_percent, profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator]
    pivots: [profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator]
    sorts: [profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator, profit_and_loss_hierarchy_selection_sdt.hier1_node_text,
      profit_and_loss_hierarchy_selection_sdt.hier2_node_text, profit_and_loss_hierarchy_selection_sdt.hier3_node_text]
    show_view_names: false
    theme: contemporary
    layout: auto
    minWidthForIndexColumns: false
    headerFontSize: 12
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: true
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: pivots
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|profit_and_loss_hierarchy_selection_sdt.hier1_node_text: " "
    label|profit_and_loss_hierarchy_selection_sdt.hier2_node_text: " "
    label|profit_and_loss_hierarchy_selection_sdt.hier3_node_text: " "
    subtotalDepth: '1'
    style|profit_and_loss_03_selected_fiscal_periods_sdt.reporting_amount: black_red
    label|profit_and_loss_03_selected_fiscal_periods_sdt.comparison_amount:
    style|profit_and_loss_03_selected_fiscal_periods_sdt.comparison_amount: black_red
    style|profit_and_loss_03_selected_fiscal_periods_sdt.difference_value: black_red
    style|profit_and_loss_03_selected_fiscal_periods_sdt.difference_percent: black_red
    title_hidden: true
    listen:
      Global Currency: profit_and_loss.target_currency_tcurr
      Select Fiscal Timeframe: profit_and_loss.filter_fiscal_timeframe
      Display Timeframe: profit_and_loss.parameter_display_time_dimension
      Select Comparison Type: profit_and_loss.parameter_compare_to
      Ledger Name: universal_ledgers_md.ledger_id_name
      Company Code: profit_and_loss.company_text
      Hierarchy: profit_and_loss.glhierarchy
      Top Hierarchy Level: profit_and_loss_hierarchy_selection_sdt.parameter_pick_start_level
      Combine Selected Timeframes?: profit_and_loss.parameter_aggregate
    row: 3
    col: 0
    width: 24
    height: 8

  - title: navigation
    name: navigation
    filters:
      profit_and_loss_navigation_ext.navigation_focus_page: '1'
      profit_and_loss_navigation_ext.navigation_which_dashboard_style: 'mktplace^_report'

  filters:
  - name: Select Comparison Type
    title: Select Comparison Type
    type: field_filter
    default_value: "yoy"
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options:
        - yoy
        - prior
    explore: profit_and_loss
    listens_to_filters: []
    field: profit_and_loss.parameter_compare_to