#########################################################{
# Income Statement financial report using Table visualization with Subtotals
# EXTENDS filters and title summary from income_statement_template
# customizations:
#   - Income Statement table based on looker_grid visualization type
#   - filter Select Comparison Type options set to yoy and prior with yoy as default
#   - Navigation viz filter focus_page set to '1' and filter which_dashboard_style set to 'subtotal'
#########################################################}

- dashboard: income_statement_subtotal_table
  title: Financial Income Statement
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Shows a company's financial performance over a specific period (e.g., a month, quarter, or year) compared to either preceding timeframe or same timeframe last year. This report summarizes Revenues, Expenses and/or Net Income (Loss) at specified hierarchy level."
  filters_location_top: false
  extends: income_statement_template

  elements:
  - title: income statement table
    name: income statement table
    explore: profit_and_loss
    type: looker_grid
    fields: [profit_and_loss_hierarchy_selection_sdt.hier1_node_text, profit_and_loss_hierarchy_selection_sdt.hier2_node_text,
      profit_and_loss_hierarchy_selection_sdt.hier3_node_text, profit_and_loss_03_selected_fiscal_periods_sdt.reporting_amount,
      profit_and_loss_03_selected_fiscal_periods_sdt.comparison_amount, profit_and_loss_03_selected_fiscal_periods_sdt.difference_value,
      profit_and_loss_03_selected_fiscal_periods_sdt.difference_percent, profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator]
    pivots: [profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator]
    sorts: [profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator,
      profit_and_loss_hierarchy_selection_sdt.hier1_node_text, profit_and_loss_hierarchy_selection_sdt.hier2_node_text,profit_and_loss_hierarchy_selection_sdt.hier3_node_text]
    subtotals: [profit_and_loss_hierarchy_selection_sdt.hier1_node_text, profit_and_loss_hierarchy_selection_sdt.hier2_node_text]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
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
    minimum_column_width: 75
    series_labels:
      profit_and_loss_hierarchy_selection_sdt.hier1_node_text: " "
      profit_and_loss_hierarchy_selection_sdt.hier2_node_text: " "
      profit_and_loss_hierarchy_selection_sdt.hier3_node_text: " "
      profit_and_loss_03_selected_fiscal_periods_sdt.alignment_group_name_with_partial_indicator: " "
    series_collapsed:
      profit_and_loss_hierarchy_selection_sdt.hier2_node_text: false
    title_hidden: true
    listen:
      Global Currency: profit_and_loss.target_currency_tcurr
      Select Fiscal Timeframe: profit_and_loss.filter_fiscal_timeframe
      Combine Selected Timeframes?: profit_and_loss.parameter_aggregate
      Display Timeframe: profit_and_loss.parameter_display_time_dimension
      Select Comparison Type: profit_and_loss.parameter_compare_to
      Ledger Name: universal_ledgers_md.ledger_id_name
      Company Code: profit_and_loss.company_text
      Hierarchy: profit_and_loss.glhierarchy
      Top Hierarchy Level: profit_and_loss_hierarchy_selection_sdt.parameter_pick_start_level
    row: 3
    col: 0
    width: 24
    height: 8

  - title: navigation
    name: navigation
    filters:
      profit_and_loss_navigation_ext.navigation_focus_page: '1'
      profit_and_loss_navigation_ext.navigation_which_dashboard_style: 'subtotal'

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