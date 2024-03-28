#########################################################{
# Income Statement template which must be EXTENDED into another dashboard
#
# defines the following elements which can be shared across Income Statement-related dashboards:
#  - Visualization Elements:
#       Income Statement Summary visualization which appears at top of Income Statement dashboards
#       footnote chart which populates if one of the selected fiscal years or quarters and it's corresponding comparison timeframe is incomplete
#               else chart remains empty/blank
#       navigation chart with provides two html links for With Comparisons or Without Comparisons
#
#  - Filters including default values:
#       Hierarchy
#       Display Timeframe
#       Select Fiscal Timeframe
#       Combine Selected Timeframes?
#       Select Comparison Type
#       Global Currency
#       Company
#       Ledger Name
#       Top Hierarchy Level
#
# The Elements and their properties can be EXTENDED into other dashboards and modified further as necessary
#########################################################}

- dashboard: income_statement_template
  title: Income Statement Template
  description: "Common filters and tiles used by Income Statement dashboards"
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100
  extension: required

  elements:
  - name: Income Statement Summary
    title: Income Statement Summary
    explore: profit_and_loss
    type: single_value
    fields: [profit_and_loss_03_selected_fiscal_periods_sdt.title_income_statement]
    filters:
      profit_and_loss.gllevel_number: '2'
      profit_and_loss_03_selected_fiscal_periods_sdt.fiscal_reporting_group: Reporting
    show_single_value_title: false
    listen:
      Global Currency: profit_and_loss.target_currency_tcurr
      Select Fiscal Timeframe: profit_and_loss.filter_fiscal_timeframe
      Display Timeframe: profit_and_loss.parameter_display_time_dimension
      Select Comparison Type: profit_and_loss.parameter_compare_to
      Ledger Name: universal_ledgers_md.ledger_id_name
      Company Code: profit_and_loss.company_text
      Hierarchy: profit_and_loss.glhierarchy
    row: 2
    col: 0
    width: 24
    height: 3

  - name: footnote
    title: footnote
    explore: profit_and_loss
    type: single_value
    fields: [profit_and_loss_03_selected_fiscal_periods_sdt.footnote_partial_timeframe]
    show_single_value_title: false
    listen:
      Global Currency: profit_and_loss.target_currency_tcurr
      Select Fiscal Timeframe: profit_and_loss.filter_fiscal_timeframe
      Display Timeframe: profit_and_loss.parameter_display_time_dimension
      Select Comparison Type: profit_and_loss.parameter_compare_to
      Ledger Name: universal_ledgers_md.ledger_id_name
      Company Code: profit_and_loss.company_text
      Hierarchy: profit_and_loss.glhierarchy
      Combine Selected Timeframes?: profit_and_loss.parameter_aggregate
    row: 10
    col: 0
    width: 24
    height: 1

  - title: navigation
    name: navigation
    explore: profit_and_loss
    type: single_value
    fields: [profit_and_loss_navigation_ext.navigation]
    filters:
      profit_and_loss_navigation_ext.navigation_focus_page: '1'
      profit_and_loss_navigation_ext.navigation_style: 'small'
      profit_and_loss_navigation_ext.navigation_which_dashboard_style: 'subtotal'
    show_single_value_title: false
    show_comparison: false
    listen:
      Hierarchy: profit_and_loss_navigation_ext.filter1
      Display Timeframe: profit_and_loss_navigation_ext.filter2
      Select Fiscal Timeframe: profit_and_loss_navigation_ext.filter3
      Global Currency: profit_and_loss_navigation_ext.filter4
      Company Code: profit_and_loss_navigation_ext.filter5
      Ledger Name: profit_and_loss_navigation_ext.filter6
      Top Hierarchy Level: profit_and_loss_navigation_ext.filter7
      Combine Selected Timeframes?: profit_and_loss_navigation_ext.filter8
    row: 11
    col: 0
    width: 24
    height: 1



  filters:
  - name: Hierarchy
    title: Hierarchy
    type: field_filter
    default_value: FPA1
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: profit_and_loss
    field: profit_and_loss.glhierarchy

  - name: Display Timeframe
    title: Display Timeframe
    type: field_filter
    default_value: qtr
    allow_multiple_values: false
    required: false
    ui_config:
      type: button_toggles
      display: inline
    explore: profit_and_loss
    listens_to_filters: []
    field: profit_and_loss.parameter_display_time_dimension

  - name: Select Fiscal Timeframe
    title: Select Fiscal Timeframe
    type: field_filter
    # if using demo data default is 2023.Q4 else find current calendar quarter
    default_value: "{% if _user_attributes['sap_use_demo_data']=='Yes'%}{% assign qtr = '2023.Q4'%}{%else%}{% assign q = 'now' | date: '%m' | times: 1.0 | divided_by: 3 | ceil %}{% assign qtr = 'now' | date: '%Y' | append: '.Q' | append: q %}{%endif%}{{qtr}}"
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    explore: profit_and_loss
    listens_to_filters: [Display Timeframe]
    field: profit_and_loss.filter_fiscal_timeframe

  - name: Combine Selected Timeframes?
    title: Combine Selected Timeframes?
    type: field_filter
    default_value: "Yes"
    allow_multiple_values: false
    required: false
    ui_config:
      type: button_toggles
      display: inline
    explore: profit_and_loss
    field: profit_and_loss.parameter_aggregate

  - name: Select Comparison Type
    title: Select Comparison Type
    type: field_filter
    default_value: yoy
    allow_multiple_values: false
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    explore: profit_and_loss
    listens_to_filters: []
    field: profit_and_loss.parameter_compare_to

  - name: Global Currency
    title: Global Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: profit_and_loss
    listens_to_filters: []
    field: profit_and_loss.target_currency_tcurr

  - name: Company Code
    title: Company Code
    type: field_filter
    default_value: "%CENTRAL%"
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    explore: profit_and_loss
    listens_to_filters: []
    field: profit_and_loss.company_text

  - name: Ledger Name
    title: Ledger Name
    type: field_filter
    default_value: '%0L%'
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    explore: profit_and_loss
    listens_to_filters: [Hierarchy]
    field: universal_ledgers_md.ledger_id_name

  - name: Top Hierarchy Level
    title: Top Hierarchy Level
    type: field_filter
    default_value: '2'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    explore: profit_and_loss
    listens_to_filters: []
    field: profit_and_loss_hierarchy_selection_sdt.parameter_pick_start_level
