- dashboard: sap_finance_ap_07_a_accounts_payable_aging
  title: "Accounts Payable Aging"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 0TvCQ2pIHHnORtR4zHqUkD
  elements:
  - title: Accounts Payable Aging
    name: Accounts Payable Aging
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: looker_column
    fields: [accounts_payable_v2.sum_past_overdue_not_overdue, accounts_payable_v2.sum_past_overdue_1_to_30days,
      accounts_payable_v2.sum_past_overdue_31_to_60days, accounts_payable_v2.sum_past_overdue_61_to_90days,
      accounts_payable_v2.sum_past_overdue_greater_than_90days]
    filters:
      accounts_payable_v2.account_type_koart: K
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: f0077e50-e03c-4a7e-930c-7321b2267283
      options:
        steps: 5
    y_axes: [{label: Amount Due, orientation: left, series: [{axisId: accounts_payable_v2.sum_past_overdue_amount_conv_drill,
            id: aNot OverDue - accounts_payable_v2.sum_past_overdue_amount_conv_drill,
            name: aNot OverDue}, {axisId: accounts_payable_v2.sum_past_overdue_amount_conv_drill,
            id: e> 90 Days - accounts_payable_v2.sum_past_overdue_amount_conv_drill,
            name: e> 90 Days}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Age
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    series_types: {}
    series_colors:
      e> 90 Days - accounts_payable_v2.sum_past_overdue_amount_conv_drill: "#E52592"
      e> 90 Days - accounts_payable_v2.sum_overdue_amount_conv_drill_1: "#E52592"
      accounts_payable_v2.sum_past_overdue_not_overdue: "#1A73E8"
    series_labels:
      aNot OverDue - accounts_payable_v2.sum_overdue_amount_conv_drill_1: Not Overdue
      e> 90 Days - accounts_payable_v2.sum_overdue_amount_conv_drill_1: "> 90 Days"
      c31-60 Days - accounts_payable_v2.sum_overdue_amount_conv_drill_1: 31-60 Days
      d61-90 Days - accounts_payable_v2.sum_overdue_amount_conv_drill_1: 61-90 Days
      accounts_payable_v2.sum_past_overdue_not_overdue_drill: Not Overdue
      accounts_payable_v2.sum_past_overdue_1_to_30days_conv_drill: 1 to 30 Days
      accounts_payable_v2.sum_past_overdue_31_to_60days_conv_drill: 31 to 60 Days
      accounts_payable_v2.sum_past_overdue_61_to_90days_conv_drill: 61 to 90 Days
      accounts_payable_v2.sum_past_overdue_greater_than_90days_conv_drill: "> 90 Days"
      accounts_payable_v2.sum_past_overdue_not_overdue: Not Overdue
      accounts_payable_v2.sum_past_overdue_1_to_30days: 1 to 30 Days
      accounts_payable_v2.sum_past_overdue_31_to_60days: 31 to 60 Days
      accounts_payable_v2.sum_past_overdue_61_to_90days: 61 to 90 Days
      accounts_payable_v2.sum_past_overdue_greater_than_90days: "> 90 Days"
    label_color: ["#80868B"]
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Aging analysis of balances due and overdue to vendors as of today in
      the target currency
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Vendor Number: accounts_payable_v2.account_number_of_vendor_or_creditor_lifnr
      Company Name: accounts_payable_v2.company_text_butxt
    row: 0
    col: 0
    width: 12
    height: 7
  - title: Accounts Payable Aging by Vendor
    name: Accounts Payable Aging by Vendor
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: looker_bar
    fields: [accounts_payable_v2.name1, accounts_payable_v2.total_due, accounts_payable_v2.sum_past_overdue_not_overdue,
      accounts_payable_v2.sum_past_overdue_1_to_30days, accounts_payable_v2.sum_past_overdue_31_to_60days,
      accounts_payable_v2.sum_past_overdue_61_to_90days, accounts_payable_v2.sum_past_overdue_greater_than_90days]
    filters:
      accounts_payable_v2.account_type_koart: K
    sorts: [accounts_payable_v2.total_due desc]
    limit: 5
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: f0077e50-e03c-4a7e-930c-7321b2267283
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: accounts_payable_v2.outstanding_but_not_overdue_1_conv_drill,
            id: accounts_payable_v2.outstanding_but_not_overdue_1_conv_drill, name: Not
              Overdue}, {axisId: accounts_payable_v2.sum_past_overdue_1_to_30days_conv_drill,
            id: accounts_payable_v2.sum_past_overdue_1_to_30days_conv_drill, name: 1-30
              Days Overdue}, {axisId: accounts_payable_v2.sum_past_overdue_31_to_60days_conv_drill,
            id: accounts_payable_v2.sum_past_overdue_31_to_60days_conv_drill, name: 31-60
              Days Overdue}, {axisId: accounts_payable_v2.sum_past_overdue_61_to_90days_conv_drill,
            id: accounts_payable_v2.sum_past_overdue_61_to_90days_conv_drill, name: 61-90
              Days Overdue}, {axisId: accounts_payable_v2.sum_past_overdue_greater_than_90days_conv_drill,
            id: accounts_payable_v2.sum_past_overdue_greater_than_90days_conv_drill,
            name: "&gt;90 Days Overdue"}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 9, type: linear}]
    x_axis_label: Vendor Name
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    series_types: {}
    series_colors:
      accounts_payable_v2.sum_past_overdue_not_overdue: "#1A73E8"
    series_labels:
      accounts_payable_v2.outstanding_but_not_overdue_1_conv_drill: Not Overdue
      accounts_payable_v2.sum_past_overdue_1_to_30days_conv_drill: 1 to 30 Days
      accounts_payable_v2.sum_past_overdue_greater_than_90days_conv_drill: "> 90 Days"
      accounts_payable_v2.sum_past_overdue_31_to_60days_conv_drill: 31 to 60 Days
      accounts_payable_v2.sum_past_overdue_61_to_90days_conv_drill: 61 to 90 Days
      accounts_payable_v2.sum_past_overdue_not_overdue: Not Overdue
      accounts_payable_v2.sum_past_overdue_1_to_30days: 1 to 30 Days
      accounts_payable_v2.sum_past_overdue_31_to_60days: 31 to 60 Days
      accounts_payable_v2.sum_past_overdue_61_to_90days: 61 to 90 Days
      accounts_payable_v2.sum_past_overdue_greater_than_90days: "> 90 Days"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [accounts_payable_v2.total_due]
    note_state: collapsed
    note_display: hover
    note_text: Aging analysis of highest balances due and overdue to vendors as of
      today in the target currency
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Vendor Number: accounts_payable_v2.account_number_of_vendor_or_creditor_lifnr
      Company Name: accounts_payable_v2.company_text_butxt
    row: 0
    col: 12
    width: 12
    height: 7
  - title: Accounts Payable Aging Detailed Report
    name: Accounts Payable Aging Detailed Report
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: looker_grid
    fields: [accounts_payable_v2.company_text_butxt, accounts_payable_v2.name1, accounts_payable_v2.account_number_of_vendor_or_creditor_lifnr,
      accounts_payable_v2.accounting_document_number_belnr, accounts_payable_v2.number_of_line_item_within_accounting_document_buzei,
      accounts_payable_v2.posting_date_in_the_document_budat_date, accounts_payable_v2.currency_key_waers,
      accounts_payable_v2.overdue_amount_in_source_currency, accounts_payable_v2.outstanding_but_not_overdue_in_source_currency,
      accounts_payable_v2.source_past_overdue_but_not_overdue, accounts_payable_v2.source_past_overdue_1_to_30day,
      accounts_payable_v2.source_past_overdue_31_to_60day, accounts_payable_v2.source_past_overdue_61_to_90day,
      accounts_payable_v2.source_past_overdue_greater_than_90day, accounts_payable_v2.target_currency_tcurr,
      accounts_payable_v2.overdue_amount_in_target_currency, accounts_payable_v2.outstanding_but_not_overdue_in_target_currency,
      accounts_payable_v2.past_overdue_1_to_30day, accounts_payable_v2.past_overdue_but_not_overdue,
      accounts_payable_v2.past_overdue_31_to_60day, accounts_payable_v2.past_overdue_61_to_90day,
      accounts_payable_v2.past_overdue_greater_than_90day, accounts_payable_v2.exchange_rate_ukurs,
      accounts_payable_v2.company_code_bukrs]
    filters:
      accounts_payable_v2.number_of_line_item_within_accounting_document_buzei: '001'
      accounts_payable_v2.account_type_koart: K
    sorts: [accounts_payable_v2.company_code_bukrs desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", accounts_payable_v2.company_text_butxt,
      accounts_payable_v2.name1, accounts_payable_v2.account_number_of_vendor_or_creditor_lifnr,
      accounts_payable_v2.accounting_document_number_belnr, accounts_payable_v2.number_of_line_item_within_accounting_document_buzei,
      accounts_payable_v2.posting_date_in_the_document_budat_date, accounts_payable_v2.currency_key_waers,
      accounts_payable_v2.overdue_amount_in_source_currency, accounts_payable_v2.outstanding_but_not_overdue_in_source_currency,
      accounts_payable_v2.source_past_overdue_but_not_overdue, accounts_payable_v2.source_past_overdue_1_to_30day,
      accounts_payable_v2.source_past_overdue_31_to_60day, accounts_payable_v2.source_past_overdue_61_to_90day,
      accounts_payable_v2.source_past_overdue_greater_than_90day, accounts_payable_v2.target_currency_tcurr,
      accounts_payable_v2.overdue_amount_in_target_currency, accounts_payable_v2.outstanding_but_not_overdue_in_target_currency,
      accounts_payable_v2.past_overdue_but_not_overdue, accounts_payable_v2.past_overdue_1_to_30day,
      accounts_payable_v2.past_overdue_61_to_90day, accounts_payable_v2.past_overdue_31_to_60day,
      accounts_payable_v2.past_overdue_greater_than_90day, accounts_payable_v2.exchange_rate_ukurs]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      accounts_payable_v2.company_text_butxt: Company Code
      accounts_payable_v2.name1: Vendor Name
      accounts_payable_v2.account_number_of_vendor_or_creditor_lifnr: Vendor Number
      accounts_payable_v2.exchange_rate_ukurs: Exchange Rate
      accounts_payable_v2.accounting_document_number_belnr: Accounting Document Number
      accounts_payable_v2.number_of_line_item_within_accounting_document_buzei: Document
        Line Item
      accounts_payable_v2.currency_key_waers: Invoice Currency
      accounts_payable_v2.posting_date_in_the_document_budat_date: Invoice Date
      accounts_payable_v2.outstanding_but_not_overdue_in_source_currency: Outstanding
        Amount
      accounts_payable_v2.outstanding_but_not_overdue_in_target_currency: Outstanding
        Amount (TC)
      accounts_payable_v2.overdue_amount_in_source_currency: Due Amount
      accounts_payable_v2.overdue_amount_in_target_currency: Due Amount (TC)
      accounts_payable_v2.past_overdue_1_to_30day: Overdue 1-30 days (TC)
      accounts_payable_v2.past_overdue_31_to_60day: Overdue 31-60 days (TC)
      accounts_payable_v2.past_overdue_61_to_90day: Overdue 61-90 days (TC)
      accounts_payable_v2.past_overdue_but_not_overdue: Outstanding but Not Overdue
        (TC)
      accounts_payable_v2.past_overdue_greater_than_90day: Overdue > 90 days (TC)
      accounts_payable_v2.source_past_overdue_1_to_30day: Overdue 1-30 days
      accounts_payable_v2.source_past_overdue_31_to_60day: Overdue 31-60 days
      accounts_payable_v2.source_past_overdue_61_to_90day: Overdue 61-90 days
      accounts_payable_v2.source_past_overdue_greater_than_90day: Overdue > 90 days
      accounts_payable_v2.source_past_overdue_but_not_overdue: Outstanding but Not
        Overdue
      accounts_payable_v2.target_currency_tcurr: Target Currency (TC)
    series_value_format:
      accounts_payable_v2.past_overdue_greater_than_90day: "#,##0.00"
      accounts_payable_v2.past_overdue_61_to_90day: "#,##0.00"
      accounts_payable_v2.past_overdue_31_to_60day: "#,##0.00"
      accounts_payable_v2.past_overdue_but_not_overdue: "#,##0.00"
      accounts_payable_v2.past_overdue_1_to_30day: "#,##0.00"
      accounts_payable_v2.outstanding_but_not_overdue_in_target_currency: "#,##0.00"
      accounts_payable_v2.overdue_amount_in_target_currency: "#,##0.00"
      accounts_payable_v2.source_past_overdue_greater_than_90day: "#,##0.00"
      accounts_payable_v2.source_past_overdue_61_to_90day: "#,##0.00"
      accounts_payable_v2.source_past_overdue_31_to_60day: "#,##0.00"
      accounts_payable_v2.source_past_overdue_1_to_30day: "#,##0.00"
      accounts_payable_v2.source_past_overdue_but_not_overdue: "#,##0.00"
      accounts_payable_v2.outstanding_but_not_overdue_in_source_currency: "#,##0.00"
      accounts_payable_v2.overdue_amount_in_source_currency: "#,##0.00"
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
    series_types: {}
    hidden_fields: [accounts_payable_v2.company_code_bukrs]
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Vendor Number: accounts_payable_v2.account_number_of_vendor_or_creditor_lifnr
      Company Name: accounts_payable_v2.company_text_butxt
    row: 7
    col: 0
    width: 24
    height: 6
  filters:
  - name: Target Currency
    title: Target Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: cortex_sap_operational
    explore: accounts_payable_v2
    listens_to_filters: []
    field: accounts_payable_v2.target_currency_tcurr
  - name: Company Name
    title: Company Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: accounts_payable_v2
    listens_to_filters: [Vendor Name, Vendor Number]
    field: accounts_payable_v2.company_text_butxt
  - name: Vendor Name
    title: Vendor Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: accounts_payable_v2
    listens_to_filters: [Company Name, Vendor Number]
    field: accounts_payable_v2.name1
  - name: Vendor Number
    title: Vendor Number
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: accounts_payable_v2
    listens_to_filters: [Company Name, Vendor Name]
    field: accounts_payable_v2.account_number_of_vendor_or_creditor_lifnr
