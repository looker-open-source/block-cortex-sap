# This dashboard requires the Report Table visualization (available for free on Looker Marketplace) to be installed.

- dashboard: balance_sheet_mktplace_report_table
  title: Financial Statement - Balance Sheet
  layout: newspaper
  preferred_viewer: dashboards-next
  filters_location_top: false
  description: "Reports Fiscal Period Cumulative Amount in Global Currency for Levels 3 and 4 of the selected hierarchy, chart of accounts, company, fiscal period and comparison period (if any). Requires Report Table visualization to be downloaded from Looker Marketplace."

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
    width: 18
    height: 2

  - title: Balance Sheet
    name: Balance Sheet
    explore: balance_sheet
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [balance_sheet_hierarchy_selection_sdt.hier1_node_text, balance_sheet_hierarchy_selection_sdt.hier2_node_text,
      balance_sheet.total_cumulative_amount_in_global_currency, balance_sheet.fiscal_year_period,
      balance_sheet_hierarchy_selection_sdt.hier3_node_text]
    pivots: [balance_sheet.fiscal_year_period]
    filters: {}
    sorts: [balance_sheet.fiscal_year_period desc, balance_sheet_hierarchy_selection_sdt.hier1_node_text,
      balance_sheet_hierarchy_selection_sdt.hier2_node_text, balance_sheet_hierarchy_selection_sdt.hier3_node_text]
    total: true
    series_labels: {}
    show_view_names: false
    theme: contemporary
    customTheme: ''
    layout: auto
    minWidthForIndexColumns: true
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
    label|balance_sheet_hierarchy_selection_sdt.hier1_node_text: " "
    label|balance_sheet_hierarchy_selection_sdt.hier2_node_text: " "
    label|balance_sheet_hierarchy_selection_sdt.hier3_node_text: " "
    subtotalDepth: '1'
    label|balance_sheet.total_cumulative_amount_in_global_currency: Amount
    style|balance_sheet.total_cumulative_amount_in_global_currency: black_red
    reportIn|balance_sheet.total_cumulative_amount_in_global_currency: '1'
    comparison|balance_sheet.total_cumulative_amount_in_global_currency: balance_sheet.fiscal_year_period
    switch|balance_sheet.total_cumulative_amount_in_global_currency: false
    var_num|balance_sheet.total_cumulative_amount_in_global_currency: true
    var_pct|balance_sheet.total_cumulative_amount_in_global_currency: true
    title_hidden: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75

    listen:
      Fiscal Period: balance_sheet.select_fiscal_period
      Comparison Type: balance_sheet.select_comparison_type
      Custom Comparison Period: balance_sheet.select_custom_comparison_period
      Hierarchy: balance_sheet.hierarchy_name
      Chart of Accounts: balance_sheet.chart_of_accounts
      Company: balance_sheet.company_text
      Currency: balance_sheet.target_currency_tcurr
      Ledger: balance_sheet.ledger_name
      Top Hierarchy Level to Display: balance_sheet_hierarchy_selection_sdt.parameter_pick_start_level
    row: 2
    col: 0
    width: 18
    height: 13



  filters:
  - name: Fiscal Period
    title: Fiscal Period
    type: field_filter
    # assumes as 12 month fiscal period that aligns with calendar. Will find last complete month and select period with same value
    default_value: "{% if _user_attributes['sap_use_demo_data']=='Yes'%}{% assign ym = '2023.011'%}{%else%}{% assign intervalDays = 31 %}{% assign intervalSeconds = intervalDays | times: 86400 %}{% assign daysMinus31 = 'now' | date: '%s' | minus: intervalSeconds %}{% assign m = daysMinus31 | date: '%m' | prepend: '00' | slice: -3,3 %}{% assign ym = daysMinus31 | date: '%Y' | append: '.' | append: m %}{%endif%}{{ym}}"
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
    field: balance_sheet.hierarchy_name

  - name: Chart of Accounts
    title: Chart of Accounts
    type: field_filter
    default_value: "{% if _user_attributes['sap_sql_flavor']=='S4' %}{% assign coa = 'YCOA'%}{%else%}{% assign coa = 'CA01' %}{% endif %}{{coa}}"
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
    allow_multiple_values: false
    required: true
    ui_config:
      type: advanced
      display: popover
    explore: balance_sheet
    field: balance_sheet.company_text

  - name: Ledger
    title: Ledger
    type: field_filter
    default_value: "0L - Leading Ledger"
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    explore: balance_sheet
    field: balance_sheet.ledger_name

  - name: Top Hierarchy Level to Display
    title: Top Hierarchy Level to Display
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
