#########################################################{
# Balance Sheet template which must be EXTENDED into another dashboard
#
# defines the following elements which can be shared across Balance Sheet-related dashboards:
#  - Summary Title visualization which appears at top of Balance Sheet dashboards
#  - Filters including default values:
#       Fiscal Period
#       Comparison Type
#       Custom Comparison Period
#       Global Currency
#       Hierarchy
#       Chart of Accounts
#       Company
#       Ledger Name
#       Top Hierarchy Level
#
# The Elements and their properties can be EXTENDED into other dashboards and modified further as necessary
#########################################################}

- dashboard: balance_sheet_template
  title: Balance Sheet Template
  description: "Template of filters and other shared elements between Balance Sheet dashboards. Must be extended into another dashboard."
  layout: newspaper
  preferred_viewer: dashboards-next
  extension: required

  elements:
  - title: Summary Title
    name: Summary Title
    explore: balance_sheet
    type: single_value
    fields: [balance_sheet.title_balance_sheet]
    filters:
      balance_sheet.level_number: '3,4'
      balance_sheet_fiscal_periods_selected_sdt.fiscal_period_group: 'Reporting'
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    listen:
      Global Currency: balance_sheet.target_currency_tcurr
      Chart of Accounts: balance_sheet.chart_of_accounts
      Company Code: balance_sheet.company_text
      Fiscal Period: balance_sheet.select_fiscal_period
      Hierarchy: balance_sheet.hierarchy_name
      Ledger Name: universal_ledgers_md.ledger_id_name
    row: 0
    col: 0
    width: 24
    height: 3

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

  - name: Global Currency
    title: Global Currency
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
    default_value: "{% if _user_attributes['sap_sql_flavor']=='S4' %}{% assign coa = 'YCOA'%}{%elsif _user_attributes['sap_sql_flavor']=='ECC'%}{% assign coa = 'CA01' %}{%else%}{%assign coa = 'something else'%}{% endif %}{{coa}}"
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: balance_sheet
    field: balance_sheet.chart_of_accounts

  - name: Company Code
    title: Company Code
    type: field_filter
    default_value: "%CENTRAL%"
    allow_multiple_values: false
    required: false
    ui_config:
      type: tag_list
      display: inline
    explore: balance_sheet
    field: balance_sheet.company_text

  - name: Ledger Name
    title: Ledger Name
    type: field_filter
    default_value: "%0L%"
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    explore: balance_sheet
    field: universal_ledgers_md.ledger_id_name

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
