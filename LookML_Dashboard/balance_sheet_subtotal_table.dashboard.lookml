- dashboard: balance_sheet_subtotal3_table
  title: Financial Statement - Balance Sheet
  layout: newspaper
  preferred_viewer: dashboards-next
  description: Using standard table with subtotals, reports Fiscal Period Cumulative
    Amount in Global Currency for the selected hierarchy, chart
    of accounts, company, fiscal period and comparison period (if any).
  filters_location_top: false

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
      Currency: balance_sheet.target_currency_tcurr
      Chart of Accounts: balance_sheet.chart_of_accounts
      Company: balance_sheet.company_text
      Fiscal Period: balance_sheet.select_fiscal_period
      Hierarchy: balance_sheet.hierarchy_name
      Ledger: balance_sheet.ledger_name
    row: 0
    col: 0
    width: 24
    height: 3

  - title: Balance Sheet
    name: Balance Sheet
    explore: balance_sheet
    type: looker_grid
    fields: [balance_sheet.reporting_period_amount_in_global_currency, balance_sheet.comparison_period_amount_in_global_currency,
      balance_sheet.difference_value, balance_sheet.difference_percent, balance_sheet_hierarchy_selection_sdt.hier1_node_text,
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

    # defaults_version: 1
    listen:
      Fiscal Period: balance_sheet.select_fiscal_period
      Comparison Type: balance_sheet.select_comparison_type
      Custom Comparison Period: balance_sheet.select_custom_comparison_period
      Hierarchy: balance_sheet.hierarchy_name
      Chart of Accounts: balance_sheet.chart_of_accounts
      Company: balance_sheet.company_text
      Currency: balance_sheet.target_currency_tcurr
      Ledger: balance_sheet.ledger_name
      Top Hierarchy Level: balance_sheet_hierarchy_selection_sdt.parameter_pick_start_level
    row: 3
    col: 0
    width: 24
    height: 13

  filters:
  - name: Fiscal Period
    title: Fiscal Period
    type: field_filter
    # default assumes as 12 month fiscal period that aligns with calendar. Will find last complete month and select period with same value
    default_value: "{% if _user_attributes['sap_use_demo_data']=='Yes'%}{% assign ym = '2023.011'%}{%else%}{% assign intervalDays = 31 %}{% assign intervalSeconds = intervalDays | times: 86400 %}{% assign daysMinus31 = 'now' | date: '%s' | minus: intervalSeconds %}{% assign m = daysMinus31 | date: '%m' | prepend: '00' | slice: -3,3 %}{% assign ym = daysMinus31 | date: '%Y' | append: '.' | append: m %}{%endif%}{{ym}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    listens_to_filters: []
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
    listens_to_filters: []
    field: balance_sheet.select_comparison_type

  - name: Custom Comparison Period
    title: Custom Comparison Period
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    listens_to_filters: []
    field: balance_sheet.select_custom_comparison_period

  - name: Currency
    title: Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    listens_to_filters: []
    field: balance_sheet.target_currency_tcurr

  - name: Hierarchy
    title: Hierarchy
    type: field_filter
    default_value: FPA1
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    listens_to_filters: []
    field: balance_sheet.hierarchy_name

  - name: Chart of Accounts
    title: Chart of Accounts
    type: field_filter
    # default_value: YCOA
    default_value: "{% if _user_attributes['sap_sql_flavor']=='S4' %}{% assign coa = 'YCOA'%}{%else%}{% assign coa = 'CA01' %}{% endif %}{{coa}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    listens_to_filters: []
    field: balance_sheet.chart_of_accounts

  - name: Company
    title: Company
    type: field_filter
    default_value: "%CENTRAL%"
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    explore: balance_sheet
    listens_to_filters: []
    field: balance_sheet.company_text

  - name: Ledger
    title: Ledger
    type: field_filter
    default_value: "0L - Leading Ledger"
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    explore: balance_sheet
    listens_to_filters: []
    field: balance_sheet.ledger_name

  - name: Top Hierarchy Level
    title: Top Hierarchy Level
    type: field_filter
    default_value: '2'
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    listens_to_filters: []
    field: balance_sheet_hierarchy_selection_sdt.parameter_pick_start_level
