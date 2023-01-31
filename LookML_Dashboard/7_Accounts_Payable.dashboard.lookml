- dashboard: accounts_payable
  title: "[SAP ACCOUNTS PAYABLE] 07: Accounts Payable"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: nhlLU4j0Rs2GDrUOCCAh7H
  elements:
  - title: Total Due Amount
    name: Total Due Amount
    model: cortex_sap_operational
    explore: accountspayable
    type: single_value
    fields: [accountspayable.sum_overdue_amount_conv_drill]
    limit: 500
    dynamic_fields: [{measure: count_of_accounts_payable_turnover, based_on: accountspayable.accounts_payable_turnover,
        expression: '', label: Count of Accounts Payable Turnover, type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {measure: sum_of_overdue_amount,
        based_on: accountspayable.overdue_amount, expression: '', label: Sum of Overdue
          Amount, type: sum, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: ''
    value_format: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Total balance due to all vendors as of today in the target currency
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable.company_text_butxt
      Vendor Name: accountspayable.name1
    row: 2
    col: 0
    width: 8
    height: 2
  - title: Past Due Amount
    name: Past Due Amount
    model: cortex_sap_operational
    explore: accountspayable
    type: single_value
    fields: [accountspayable.sum_overdue_on_past_due_date_conv_drill]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Sum of Overdue on
          Past Due Date, based_on: accountspayable.overdue_on_past_due_date, _kind_hint: measure,
        measure: sum_of_overdue_on_past_due_date, type: sum, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Total balance due to all vendors that is overdue as of today in the
      target currency
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable.company_text_butxt
      Vendor Name: accountspayable.name1
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Accounts Payable by Vendor
    name: Accounts Payable by Vendor
    model: cortex_sap_operational
    explore: accountspayable
    type: looker_pie
    fields: [accountspayable.name1, accountspayable.sum_overdue_amount_2_conv_drill]
    filters: {}
    limit: 5
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Amount Due, orientation: bottom, series: [{axisId: accountspayable.sum_overdue_amount2,
            id: accountspayable.sum_overdue_amount2, name: Sum Overdue Amount2}],
        showLabels: true, showValues: true, valueFormat: '0, \K', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Vendor Name
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: '10'
    label_value_format: 0.0, \K
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    label_color: ["#80868B"]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Vendors with the highest balances due as of today
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable.company_text_butxt
      Vendor Name: accountspayable.name1
    row: 12
    col: 0
    width: 12
    height: 5
  - title: Upcoming Payments and Penalties
    name: Upcoming Payments and Penalties
    model: cortex_sap_operational
    explore: accountspayable
    type: looker_bar
    fields: [accountspayable.name1, accountspayable.sum_late_payments_conv_drill,
      accountspayable.sum_potential_penalty_payments_conv_drill, accountspayable.sum_upcoming_payments_conv_drill]
    filters: {}
    sorts: [accountspayable.sum_late_payments_conv_drill desc 0]
    limit: 5
    column_limit: 50
    dynamic_fields: [{measure: sum_of_upcoming_payments, based_on: accountspayable.upcoming_payments,
        expression: '', label: Sum of Upcoming Payments, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_potential_penalty, based_on: accountspayable.potential_penalty,
        expression: '', label: Sum of Potential Penalty, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_late_payments, based_on: accountspayable.late_payments,
        expression: '', label: Sum of Late Payments, type: sum, _kind_hint: measure,
        _type_hint: number}]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: accountspayable.sum_late_payments_conv_drill,
            id: accountspayable.sum_late_payments_conv_drill, name: Late Payments},
          {axisId: accountspayable.sum_potential_penalty_payments_conv_drill, id: accountspayable.sum_potential_penalty_payments_conv_drill,
            name: Potential Penalties}, {axisId: accountspayable.sum_upcoming_payments_conv_drill,
            id: accountspayable.sum_upcoming_payments_conv_drill, name: Upcoming Payments}],
        showLabels: true, showValues: true, maxValue: !!null '', minValue: !!null '',
        valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Vendor Name
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hidden_series: []
    hide_legend: false
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors:
      accountspayable.sum_late_payments_conv_drill: "#E52592"
      accountspayable.sum_upcoming_payments_conv_drill: "#1A73E8"
      accountspayable.sum_potential_penalty_payments_conv_drill: "#F9AB00"
    series_labels:
      sum_of_upcoming_payments: Upcoming Payments
      sum_of_potential_penalty: Potential Penalty
      sum_of_late_payments: Late Payments
      accountspayable.sum_upcoming_payments: Upcoming Payments
      accountspayable.Sum_late_payments: Late  Payments
      accountspayable.sum_potential_penalty_payments: Potential Penalties
      accountspayable.sum_late_payments_conv_drill: Late Payments
      accountspayable.sum_upcoming_payments_conv_drill: Upcoming Payments
      accountspayable.sum_potential_penalty_payments_conv_drill: Potential Penalties
    label_color: []
    x_axis_label_rotation_bar: 0
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    isStepped: false
    orientation: automatic
    labelPosition: left
    labelOverlap: false
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    show_null_points: true
    interpolation: linear
    show_dropoff: false
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map: usa
    map_projection: ''
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hidden_fields: []
    column_order: []
    value_labels: legend
    label_type: labPer
    note_state: collapsed
    note_display: hover
    note_text: Upcoming payments due within the next two weeks and late payments to
      which penalties may be applicable as of today in the target currency
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable.company_text_butxt
      Vendor Name: accountspayable.name1
    row: 12
    col: 12
    width: 12
    height: 5
  - title: Parked and Blocked Invoices
    name: Parked and Blocked Invoices
    model: cortex_sap_operational
    explore: accountspayable
    type: looker_grid
    fields: [accountspayable.company_text_butxt, accountspayable.blocked_invoice,
      accountspayable.blocked_invoice_amount, accountspayable.parked_invoice, accountspayable.parked_invoice_amount,
      accountspayable.blocked_invoice_amount_global_currency, accountspayable.parked_invoice_amount_global_currency,
      currency_conversion_new.fcurr, currency_conversion_new.tcurr, currency, global_currency]
    filters:
      accountspayable.blocked_invoice_amount: not 0
      accountspayable.parked_invoice_amount: not 0
    sorts: [accountspayable.blocked_invoice desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{measure: list_of_company_text_butxt, based_on: accountspayable.company_text_butxt,
        expression: '', label: List of Company Text Butxt, type: list, _kind_hint: measure,
        _type_hint: list}, {category: dimension, expression: "${accountspayable.Currency}",
        label: Currency, value_format: !!null '', value_format_name: !!null '', dimension: currency,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${currency_conversion_new.tcurr}",
        label: Global Currency, value_format: !!null '', value_format_name: !!null '',
        dimension: global_currency, _kind_hint: dimension, _type_hint: string}]
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
    pinned_columns:
      "$$$_row_numbers_$$$": left
    column_order: ["$$$_row_numbers_$$$", accountspayable.company_text_butxt, accountspayable.parked_invoice,
      accountspayable.parked_invoice_amount, currency, accountspayable.parked_invoice_amount_global_currency,
      global_currency, accountspayable.blocked_invoice, accountspayable.blocked_invoice_amount,
      currency_conversion_new.fcurr, accountspayable.blocked_invoice_amount_global_currency,
      currency_conversion_new.tcurr]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      accountspayable.company_text_butxt: Company Code
      accountspayable.blocked_invoice: Blocked Invoices
      accountspayable.blocked_invoice_amount: Blocked Invoice Amount
      accountspayable.parked_invoice: Parked Invoices
      accountspayable.parked_invoice_amount: Parked Invoice Amount
      currency_conversion_new.ukurs: Exchange Rate
      currency_conversion_new.tcurr: Global Currency
      currency_conversion_new.fcurr: Currency
    series_cell_visualizations:
      accountspayable.blocked_invoice:
        is_active: false
      accountspayable.blocked_invoice_amount:
        is_active: true
      accountspayable.parked_invoice_amount:
        is_active: true
      accountspayable.blocked_invoice_amount_global_currency:
        is_active: true
      accountspayable.parked_invoice_amount_global_currency:
        is_active: true
    series_value_format: {}
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    hidden_fields:
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: The number and amount of invoices created but not yet posted are parked
      and the number of invoices and amount of invoices that are blocked for payment
      as of today in the target currency
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable.company_text_butxt
      Vendor Name: accountspayable.name1
    row: 18
    col: 12
    width: 12
    height: 6
  - title: Accounts Payable Aging
    name: Accounts Payable Aging
    model: cortex_sap_operational
    explore: accountspayable
    type: looker_column
    fields: [accountspayable.Past_Due_Interval, accountspayable.sum_overdue_amount_1_conv_drill]
    pivots: [accountspayable.Past_Due_Interval]
    sorts: [accountspayable.Past_Due_Interval]
    limit: 500
    dynamic_fields: [{measure: sum_of_overdue_amount, based_on: accountspayable.overdue_amount,
        expression: '', label: Sum of Overdue Amount, type: sum, _kind_hint: measure,
        _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
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
    y_axes: [{label: Amount Due, orientation: left, series: [{axisId: accountspayable.sum_overdue_amount_1_conv_drill,
            id: aNot OverDue - accountspayable.sum_overdue_amount_1_conv_drill, name: aNot
              OverDue}, {axisId: accountspayable.sum_overdue_amount_1_conv_drill,
            id: b1- 30 Days - accountspayable.sum_overdue_amount_1_conv_drill, name: b1-
              30 Days}, {axisId: accountspayable.sum_overdue_amount_1_conv_drill,
            id: c31-60 Days - accountspayable.sum_overdue_amount_1_conv_drill, name: c31-60
              Days}, {axisId: accountspayable.sum_overdue_amount_1_conv_drill, id: d61-90
              Days - accountspayable.sum_overdue_amount_1_conv_drill, name: d61-90
              Days}, {axisId: accountspayable.sum_overdue_amount_1_conv_drill, id: e>
              90 Days - accountspayable.sum_overdue_amount_1_conv_drill, name: e>
              90 Days}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Age
    hidden_series: []
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors:
      aNot OverDue - accountspayable.sum_overdue_amount_1: "#1A73E8"
      aNot OverDue - accountspayable.sum_overdue_amount_1_conv_drill: "#1A73E8"
    series_labels:
      1- 30 Days - sum_of_overdue_amount: OverDue 1-30 Days
      31-60 Days - sum_of_overdue_amount: OverDue 31-60 Days
      61-90 Days - sum_of_overdue_amount: OverDue 61-90 Days
      "> 90 Days - sum_of_overdue_amount": OverDue 90 Days
      "> 90 Days - accountspayable.sum_overdue_amount_1": OverDue 90 Days
      aNot OverDue - accountspayable.sum_overdue_amount_1: Not Overdue
      b1- 30 Days - accountspayable.sum_overdue_amount_1: 1-30 Days
      c31-60 Days - accountspayable.sum_overdue_amount_1: 31-60 Days
      d61-90 Days - accountspayable.sum_overdue_amount_1: 61-90 Days
      e> 90 Days - accountspayable.sum_overdue_amount_1: ">90 Days"
      aNot OverDue - accountspayable.sum_overdue_amount_1_conv_drill: Not Overdue
      b1- 30 Days - accountspayable.sum_overdue_amount_1_conv_drill: 1-30 Days Overdue
      c31-60 Days - accountspayable.sum_overdue_amount_1_conv_drill: 31-60 Days Overdue
      d61-90 Days - accountspayable.sum_overdue_amount_1_conv_drill: 61-90 Days Overdue
      e> 90 Days - accountspayable.sum_overdue_amount_1_conv_drill: ">90 Days Overdue"
    label_color: ["#80868B"]
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Aging analysis of balances due and overdue to vendors as of today in
      the target currency
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable.company_text_butxt
      Vendor Name: accountspayable.name1
    row: 4
    col: 8
    width: 8
    height: 6
  - title: Cash Discount Utilization Trend
    name: Cash Discount Utilization Trend
    model: cortex_sap_operational
    explore: accountspayable_cdu
    type: looker_line
    fields: [accountspayable_cdu.Cash_Discount_Utilization, accountspayable_cdu.posting_date_in_the_document_budat_month]
    fill_fields: [accountspayable_cdu.posting_date_in_the_document_budat_month]
    filters:
      accountspayable_cdu.posting_date_in_the_document_budat_month: 12 months ago
        for 12 months
    sorts: [accountspayable_cdu.posting_date_in_the_document_budat_month]
    limit: 500
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: accountspayable_cdu.Cash_Discount_Utilization,
            id: accountspayable_cdu.Cash_Discount_Utilization, name: Cash Discount
              Utilization}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors:
      accountspayable_cdu.Cash_Discount_Utilization: "#e668a7"
    label_color: ["#80868B"]
    x_axis_datetime_label: "%Y/%m"
    x_axis_label_rotation: -50
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: The utilization efficiency achieved by taking cash discounts for early
      payments compared to all cash discounts available, whether taken or lost, over
      the last 12 months
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable_cdu.company_text_butxt
      Vendor Name: accountspayable_cdu.name1
    row: 18
    col: 0
    width: 12
    height: 6
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
    row: 10
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
  - title: Accounts Payable Turnover
    name: Accounts Payable Turnover
    model: cortex_sap_operational
    explore: accountspayable_apt
    type: single_value
    fields: [accountspayable_apt.doc_fiscal_period, accountspayable_apt.turnover]
    sorts: [accountspayable_apt.doc_fiscal_period desc]
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
    value_format: '#,##0.0 "days"'
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: How many times we paid off the average accounts payable amount in the
      previous fiscal period
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable_apt.company_text_butxt
      Vendor Name: accountspayable_apt.vendor_name
    row: 2
    col: 16
    width: 8
    height: 2
  - title: Accounts Payable Turnover Trend
    name: Accounts Payable Turnover Trend
    model: cortex_sap_operational
    explore: accountspayable_apt
    type: looker_line
    fields: [accountspayable_apt.turnover, accountspayable_apt.fiscal_period]
    sorts: [accountspayable_apt.fiscal_period]
    limit: 500
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
    limit_displayed_rows: true
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: []
    x_axis_label: Fiscal Period
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    label_value_format: ''
    series_colors:
      accountspayable_apt.turnover: "#ae77cc"
    series_labels:
      accountspayable_apt.turnover: Turnover (in days)
    x_axis_datetime_label: "%b-%y"
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: How many times per fiscal period the average accounts payable amount
      is paid off
    listen:
      Target Currency: currency_conversion_new.tcurr
      Company Code: accountspayable_apt.company_text_butxt
      Vendor Name: accountspayable_apt.vendor_name
    row: 4
    col: 16
    width: 8
    height: 6
  - title: DPO Trend
    name: DPO Trend
    model: cortex_sap_operational
    explore: days_payable_outstanding
    type: looker_line
    fields: [days_payable_outstanding.sum_days_payable_outstanding, days_payable_outstanding.Month_Year]
    sorts: [days_payable_outstanding.Month_Year]
    limit: 500
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
    limit_displayed_rows: true
    legend_position: center
    point_style: circle_outline
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
      days_payable_outstanding.sum_days_payable_outstanding: "#E52592"
    series_labels:
      days_payable_outstanding.sum_days_payable_outstanding: Days Payable Outstanding
        (in days)
    defaults_version: 1
    listen:
      Company Code: days_payable_outstanding.company_text_butxt
      Vendor Name: accountspayable.name1
    row: 4
    col: 0
    width: 8
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
      options: []
    model: cortex_sap_operational
    explore: accountspayable
    listens_to_filters: []
    field: currency_conversion_new.tcurr
  - name: Company Code
    title: Company Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: accountspayable
    listens_to_filters: []
    field: accountspayable.company_text_butxt
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
    explore: accountspayable
    listens_to_filters: []
    field: accountspayable.name1
