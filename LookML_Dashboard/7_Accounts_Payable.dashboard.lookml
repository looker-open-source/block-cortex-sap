- dashboard: sap_finance_ap_07_accounts_payable
  title: "Accounts Payable"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: zW4D9AhK2n0Ufdpf6iXd9X
  elements:
  - name: Key Accounts Payable Indicators
    type: text
    title_text: Key Accounts Payable Indicators
    subtitle_text: <font color="#c1c1c1">How much do we owe?</font>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: <font color="#c1c1c1">How much are we overdue and how quickly do
      we typically take to pay?</font>
    body_text: ''
    row: 4
    col: 0
    width: 24
    height: 1
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: <font color="#c1c1c1">To which vendors do we owe the most and which
      ones need timely payment?</font>
    body_text: ''
    row: 11
    col: 0
    width: 24
    height: 1
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: <font color="#c1c1c1">How efficiently are cash discounts for early
      payments being utilized and how efficient is our invoice clearing process?</font>
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 1
  - title: Total Due Amount
    name: Total Due Amount
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: single_value
    fields: [accounts_payable_v2.total_due]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Total balance due to all vendors as of today in the target currency
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Company Name: accounts_payable_v2.company_text_butxt
    row: 2
    col: 0
    width: 8
    height: 2
  - title: Past Due Amount
    name: Past Due Amount
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: single_value
    fields: [accounts_payable_v2.sum_past_overdue_amount_conv_drill]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total balance due to all vendors that is overdue as of today in the
      target currency
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Company Name: accounts_payable_v2.company_text_butxt
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Accounts Payable by Vendor
    name: Accounts Payable by Vendor
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: looker_pie
    fields: [accounts_payable_v2.sum_overdue_amount_conv_drill_2, accounts_payable_v2.name1]
    filters: {}
    sorts: [accounts_payable_v2.sum_overdue_amount_conv_drill_2 desc 0]
    limit: 5
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    series_types: {}
    show_value_labels: true
    font_size: 12
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Vendors with the highest balances due as of today
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Company Name: accounts_payable_v2.company_text_butxt
    row: 12
    col: 0
    width: 12
    height: 5
  - title: Upcoming Payments and Penalties
    name: Upcoming Payments and Penalties
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: looker_bar
    fields: [accounts_payable_v2.name1, accounts_payable_v2.sum_late_payments_in_target_currency,
      accounts_payable_v2.sum_potential_penalty_in_target_currency, accounts_payable_v2.sum_upcoming_payments_in_target_currency]
    filters:
      accounts_payable_v2.is_null_name1: 'No'
    sorts: [accounts_payable_v2.sum_late_payments_in_target_currency desc]
    limit: 5
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    series_types: {}
    series_colors:
      accounts_payable_v2.sum_potential_penalty_in_target_currency: "#E8710A"
      accounts_payable_v2.sum_late_payments_in_target_currency: "#E52592"
      accounts_payable_v2.sum_upcoming_payments_in_target_currency: "#1A73E8"
    series_labels:
      accounts_payable_v2.sum_late_payments_in_target_currency: Late Payments
      accounts_payable_v2.sum_potential_penalty_in_target_currency: Potential Penalties
      accounts_payable_v2.sum_upcoming_payments_in_target_currency: Upcoming Payments
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Upcoming payments due within the next two weeks and late payments to
      which penalties may be applicable as of today in the target currency
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Company Name: accounts_payable_v2.company_text_butxt
    row: 12
    col: 12
    width: 12
    height: 5
  - title: Parked and Blocked Invoices
    name: Parked and Blocked Invoices
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: looker_grid
    fields: [accounts_payable_v2.company_text_butxt, accounts_payable_v2.blocked_invoice_amount_global_currency,
      accounts_payable_v2.parked_invoice_amount_global_currency, accounts_payable_v2.blocked_invoice,
      accounts_payable_v2.parked_invoice]
    filters:
      accounts_payable_v2.blocked_invoice_amount: not 0
      accounts_payable_v2.parked_invoice_amount: not 0
    sorts: [accounts_payable_v2.blocked_invoice desc]
    limit: 500
    column_limit: 50
    total: true
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
      accounts_payable_v2.parked_invoice, accounts_payable_v2.parked_invoice_amount_global_currency,
      accounts_payable_v2.blocked_invoice, accounts_payable_v2.blocked_invoice_amount_global_currency]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      accounts_payable_v2.company_text_butxt: Company Code
      accounts_payable_v2.blocked_invoice_amount_global_currency: Blocked Invoice
        Amount
      accounts_payable_v2.parked_invoice_amount_global_currency: Parked Invoice Amount
      accounts_payable_v2.blocked_invoice: Blocked Invoices
      accounts_payable_v2.parked_invoice: Parked Invoices
    series_cell_visualizations:
      accounts_payable_v2.blocked_invoice_amount_global_currency:
        is_active: true
      accounts_payable_v2.parked_invoice:
        is_active: false
      accounts_payable_v2.parked_invoice_amount_global_currency:
        is_active: true
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The number and amount of invoices created but not yet posted are parked
      and the number of invoices and amount of invoices that are blocked for payment
      as of today in the target currency
    listen:
      Target Currency: accounts_payable_v2.target_currency_tcurr
      Vendor Name: accounts_payable_v2.name1
      Company Name: accounts_payable_v2.company_text_butxt
    row: 18
    col: 12
    width: 12
    height: 6
  - title: Accounts Payable Aging
    name: Accounts Payable Aging
    model: cortex_sap_operational
    explore: accounts_payable_v2
    type: looker_column
    fields: [accounts_payable_v2.sum_past_overdue_not_overdue_drill, accounts_payable_v2.sum_past_overdue_1_to_30days_conv_drill,
      accounts_payable_v2.sum_past_overdue_31_to_60days_conv_drill, accounts_payable_v2.sum_past_overdue_61_to_90days_conv_drill,
      accounts_payable_v2.sum_past_overdue_greater_than_90days_conv_drill]
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
      accounts_payable_v2.sum_past_overdue_not_overdue_drill: "#1A73E8"
    series_labels:
      aNot OverDue - accounts_payable_v2.sum_overdue_amount_conv_drill_1: Not Overdue
      e> 90 Days - accounts_payable_v2.sum_overdue_amount_conv_drill_1: ">90 Days\
        \ Overdue"
      accounts_payable_v2.sum_past_overdue_not_overdue_drill: Not Overdue
      accounts_payable_v2.sum_past_overdue_1_to_30days_conv_drill: 1 to 30 Days
      accounts_payable_v2.sum_past_overdue_31_to_60days_conv_drill: 31 to 60 Days
      accounts_payable_v2.sum_past_overdue_61_to_90days_conv_drill: 61 to 90 Days
      accounts_payable_v2.sum_past_overdue_greater_than_90days_conv_drill: "> 90 Days"
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
      Company Name: accounts_payable_v2.company_text_butxt
    row: 5
    col: 8
    width: 8
    height: 6
  - title: Accounts Payable Turnover
    name: Accounts Payable Turnover
    model: cortex_sap_operational
    explore: accounts_payable_turnover_v2
    type: single_value
    fields: [accounts_payable_turnover_v2.turnover_in_days, accounts_payable_turnover_v2.fiscal_period_month]
    filters: {}
    sorts: [accounts_payable_turnover_v2.fiscal_period_month desc]
    limit: 1
    column_limit: 50
    dynamic_fields: [{measure: average_of_accounts_payable_turnover_in_target_currency,
        based_on: accounts_payable_turnover_v2.accounts_payable_turnover_in_target_currency,
        expression: '', label: Average of Accounts Payable Turnover In Target Currency,
        type: average, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '#,##0.0 "days"'
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_pivots: {}
    defaults_version: 1
    series_types: {}
    hidden_fields: [accounts_payable_turnover_v2.fiscal_period_month]
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: How many times we paid off the average accounts payable amount in the
      previous fiscal period
    listen:
      Target Currency: accounts_payable_turnover_v2.target_currency_tcurr
      Vendor Name: accounts_payable_turnover_v2.name1
      Company Name: accounts_payable_turnover_v2.company_text_butxt
    row: 2
    col: 16
    width: 8
    height: 2
  - title: Accounts Payable Turnover Trend
    name: Accounts Payable Turnover Trend
    model: cortex_sap_operational
    explore: accounts_payable_turnover_v2
    type: looker_line
    fields: [accounts_payable_turnover_v2.turnover_in_days, accounts_payable_turnover_v2.fiscal_period_month]
    fill_fields: [accounts_payable_turnover_v2.fiscal_period_month]
    filters:
      accounts_payable_turnover_v2.fiscal_period_month: 12 months ago for 12 months
    sorts: [accounts_payable_turnover_v2.fiscal_period_month]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: accounts_payable_turnover_v2.turnover,
            id: accounts_payable_turnover_v2.turnover, name: Turnover (in days)}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    series_colors:
      accounts_payable_turnover_v2.turnover: "#9334E6"
      accounts_payable_turnover_v2.turnover_in_days: "#9334E6"
    series_labels:
      accounts_payable_turnover_v2.turnover: Turnover
    x_axis_datetime_label: "%Y/%m"
    x_axis_label_rotation: -50
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: How many times per fiscal period the average accounts payable amount
      is paid off
    listen:
      Target Currency: accounts_payable_turnover_v2.target_currency_tcurr
      Vendor Name: accounts_payable_turnover_v2.name1
      Company Name: accounts_payable_turnover_v2.company_text_butxt
    row: 5
    col: 16
    width: 8
    height: 6
  - title: Days Payable Outstanding
    name: Days Payable Outstanding
    model: cortex_sap_operational
    explore: days_payable_outstanding_v2
    type: looker_line
    fields: [sum_of_days_payable_outstanding_in_target_currency, days_payable_outstanding_v2.fiscal_date_month]
    fill_fields: [days_payable_outstanding_v2.fiscal_date_month]
    filters:
      days_payable_outstanding_v2.fiscal_date_month: 12 months ago for 12 months
    sorts: [days_payable_outstanding_v2.fiscal_date_month]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: sum_of_days_payable_outstanding_in_target_currency,
        based_on: days_payable_outstanding_v2.days_payable_outstanding_in_target_currency,
        expression: '', label: Sum of Days Payable Outstanding In Target Currency,
        type: sum, _kind_hint: measure, _type_hint: number}]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    series_types: {}
    series_colors:
      sum_of_days_payable_outstanding_in_target_currency: "#FF8168"
    series_labels:
      sum_of_days_payable_outstanding_in_target_currency: Days Payable Outstanding
    x_axis_datetime_label: "%Y/%m"
    x_axis_label_rotation: -50
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: 'Average number of days taken to pay vendors by fiscal period of the
      settlement date

      '
    listen:
      Target Currency: days_payable_outstanding_v2.target_currency_tcurr
      Company Name: days_payable_outstanding_v2.company_text_butxt
    row: 5
    col: 0
    width: 8
    height: 6
  - title: Cash Discount Utilization Trend
    name: Cash Discount Utilization Trend
    model: cortex_sap_operational
    explore: cash_discount_utilization
    type: looker_line
    fields: [cash_discount_utilization.posting_date_in_the_document_budat_month, cash_discount_utilization.Cash_Discount_Utilization]
    fill_fields: [cash_discount_utilization.posting_date_in_the_document_budat_month]
    filters:
      cash_discount_utilization.posting_date_in_the_document_budat_month: 12 months
        ago for 12 months
    sorts: [cash_discount_utilization.posting_date_in_the_document_budat_month]
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    series_types: {}
    series_colors:
      cash_discount_utilization.Cash_Discount_Utilization: "#E52592"
    label_color: ["#80868B"]
    x_axis_datetime_label: "%Y/%m"
    x_axis_label_rotation: -50
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: The utilization efficiency achieved by taking cash discounts for early
      payments compared to all cash discounts available, whether taken or lost, over
      the last 12 months
    listen:
      Target Currency: cash_discount_utilization.target_currency_tcurr
      Vendor Name: cash_discount_utilization.name1
      Company Name: cash_discount_utilization.company_text_butxt
    row: 18
    col: 0
    width: 12
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
    listens_to_filters: [Vendor Name]
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
    listens_to_filters: [Company Name]
    field: accounts_payable_v2.name1
