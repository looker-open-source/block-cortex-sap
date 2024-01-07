- dashboard: balance_sheet_subtotal_table
  title: Balance Sheet Subtotals Report
  layout: newspaper
  preferred_viewer: dashboards-next
  filters_location_top: false
  description: "Using standard table with subtotals, reports Fiscal Period Cumulative Amount in Global Currency for Levels 2, 3, and 4 of the selected hierarchy, chart of accounts, company, fiscal period and comparison period (if any)."

  elements:
  - title: Summary Title
    name: Summary Title
    explore: balance_sheet
    type: single_value
    fields: [balance_sheet.title_balance_sheet]
    filters:
      balance_sheet.level_number: '3,4'
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    listen:
      Global Currency: balance_sheet.target_currency_tcurr
      Chart of Accounts: balance_sheet.chart_of_accounts
      Company: balance_sheet.company_text
      Fiscal Period: balance_sheet.select_fiscal_period
      Hierarchy: balance_sheet.hierarchy_name
    row: 0
    col: 0
    width: 22
    height: 2

  - title: Balance Sheet
    name: Balance Sheet
    explore: balance_sheet
    type: looker_grid
    fields: [balance_sheet.parent_text, balance_sheet.node_text,balance_sheet.comparison_period_amount_in_global_currency, balance_sheet.reporting_period_amount_in_global_currency,
       balance_sheet.difference_value,balance_sheet.difference_percent]
    filters:
      balance_sheet.level_number: '2,3,4'
    sorts: [balance_sheet.parent_text, balance_sheet.reporting_period_amount_in_global_currency
      desc]
    subtotals: [balance_sheet.parent_text]
    limit: 500
    column_limit: 50
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
    minimum_column_width: 100
    series_labels:
      balance_sheet.parent_text: Parent
      balance_sheet.node_text: Node
    series_column_widths:
      balance_sheet.node_text: 200
    align: left
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Fiscal Period: balance_sheet.select_fiscal_period
      Comparison Type: balance_sheet.select_comparison_type
      Custom Comparison (Optional): balance_sheet.select_custom_comparison_period
      Hierarchy: balance_sheet.hierarchy_name
      Chart of Accounts: balance_sheet.chart_of_accounts
      Company: balance_sheet.company_text
      Global Currency: balance_sheet.target_currency_tcurr

    row: 2
    col: 0
    width: 22
    height: 13



  filters:
  - name: Fiscal Period
    title: Fiscal Period
    type: field_filter
    # default_value: '2023.11'
    # assumes as 12 month fiscal period that aligns with calendar. Will find last month and select period with same value
    default_value: "{% assign current_month = \"today\" | date: '%m' %}{% assign current_year = \"today\" | date: '%Y' %}{% if current_month == '01' %}{% assign last_month = '12' %}{% assign last_month_year = current_year | times: 1 | minus: 1 %}{% else %}{% assign last_month = current_month | times: 1 | minus: 1 | prepend: '00' | slice: -2, 2 %}{% assign last_month_year = current_year %}{% endif %}{% assign last_period = last_month_year | append: '.' | append: last_month  %}{{last_period | strip}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    field: balance_sheet.select_fiscal_period

  - name: Comparison Type
    title: Comparison Type
    type: field_filter
    default_value: yoy
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    field: balance_sheet.select_comparison_type

  - name: Custom Comparison (Optional)
    title: Custom Comparison (Optional)
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    field: balance_sheet.select_custom_comparison_period

  - name: Global Currency
    title: Global Currency
    type: field_filter
    default_value: USD
    # default_value: "{% assign dc = _user_attributes['sap_default_global_currency %}{{dc}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    field: balance_sheet.target_currency_tcurr

  - name: Hierarchy
    title: Hierarchy
    type: field_filter
    default_value: FPA1
    # default_value: "{% assign dh = _user_attributes['sap_balance_sheet_default_hierarchy']%}{{dh}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    field: balance_sheet.hierarchy_name

  - name: Chart of Accounts
    title: Chart of Accounts
    type: field_filter
    default_value: CA01
    # default_value: "{% assign dca = _user_attributes['sap_balance_sheet_default_chart_of_accounts']%}{{dca}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    field: balance_sheet.chart_of_accounts

  - name: Company
    title: Company
    type: field_filter
    default_value: "%CENTRAL%"
    # default_value: "{% assign dco = _user_attributes['sap_balance_sheet_default_company']%}{{dco}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    explore: balance_sheet
    field: balance_sheet.company_text
