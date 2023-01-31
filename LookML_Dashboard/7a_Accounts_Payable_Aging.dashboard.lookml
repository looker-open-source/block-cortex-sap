- dashboard: accounts_payable_aging
  title:  "[SAP ACCOUNTS PAYABLE] 07a: Accounts Payable Aging"
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: 7bfsq2eNyyTuJj3bd60oKZ
  elements:
  - title: Accounts Payable Aging Detailed Report
    name: Accounts Payable Aging Detailed Report
    model: cortex_sap_operational
    explore: accountspayable
    type: looker_grid
    fields: [accountspayable.company_code_bukrs, accountspayable.company_text_butxt,
      accountspayable.account_number_of_vendor_or_creditor_lifnr, accountspayable.name1,
      accountspayable.overdue_amount, accountspayable.outstanding_but_not_overdue,
      accountspayable.accounting_document_number_belnr, accountspayable.number_of_line_item_within_accounting_document_buzei,
      accountspayable.posting_date_in_the_document_budat, accountspayable.past_overdue_but_not_overdue,
      accountspayable.past_overdue_1_to_30day, accountspayable.past_overdue_31_to_60day,
      accountspayable.past_overdue_61_to_90day, accountspayable.past_overdue_greater_than_90day,
      accountspayable.Currency, currency, currency_1, currency_2, currency_3, currency_4,
      currency_5, global_currency, global_currency_1, global_currency_2, global_currency_3,
      global_currency_4, global_currency_5, currency_conversion_new.tcurr, currency_conversion_new.ukurs,
      accountspayable.overdue_amount_conv, accountspayable.outstanding_but_not_overdue_glob_curr,
      accountspayable.past_overdue_1_to_30day_glob_curr, accountspayable.past_overdue_31_to_60day_glob_curr,
      accountspayable.past_overdue_61_to_90day_glob_curr, accountspayable.past_overdue_greater_than_90day_glob_curr,
      accountspayable.past_overdue_but_not_overdue_glob_curr]
    filters:
      accountspayable.number_of_line_item_within_accounting_document_buzei: '001'
    sorts: [global_currency desc]
    limit: 500
    dynamic_fields: [{measure: count_of_net_due_date, based_on: accountspayable.net_due_date,
        expression: '', label: Count of Net Due Date, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_net_due_date_2, based_on: accountspayable.net_due_date,
        expression: '', label: Count of Net Due Date, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: dimension, expression: "${accountspayable.Currency}",
        label: Currency, value_format: !!null '', value_format_name: !!null '', dimension: currency,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${accountspayable.Currency}",
        label: Currency, value_format: !!null '', value_format_name: !!null '', dimension: currency_1,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${accountspayable.Currency}",
        label: Currency, value_format: !!null '', value_format_name: !!null '', dimension: currency_2,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${accountspayable.Currency}",
        label: Currency, value_format: !!null '', value_format_name: !!null '', dimension: currency_3,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${accountspayable.Currency}",
        label: Currency, value_format: !!null '', value_format_name: !!null '', dimension: currency_4,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${accountspayable.Currency}",
        label: Currency, value_format: !!null '', value_format_name: !!null '', dimension: currency_5,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${currency_conversion_new.tcurr}",
        label: Global Currency, value_format: !!null '', value_format_name: !!null '',
        dimension: global_currency, _kind_hint: dimension, _type_hint: string}, {
        category: dimension, expression: "${currency_conversion_new.tcurr}", label: Global
          Currency, value_format: !!null '', value_format_name: !!null '', dimension: global_currency_1,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${currency_conversion_new.tcurr}",
        label: Global Currency, value_format: !!null '', value_format_name: !!null '',
        dimension: global_currency_2, _kind_hint: dimension, _type_hint: string},
      {category: dimension, expression: "${currency_conversion_new.tcurr}", label: Global
          Currency, value_format: !!null '', value_format_name: !!null '', dimension: global_currency_3,
        _kind_hint: dimension, _type_hint: string}, {category: dimension, expression: "${currency_conversion_new.tcurr}",
        label: Global Currency, value_format: !!null '', value_format_name: !!null '',
        dimension: global_currency_4, _kind_hint: dimension, _type_hint: string},
      {category: dimension, expression: "${currency_conversion_new.tcurr}", label: Global
          Currency, value_format: !!null '', value_format_name: !!null '', dimension: global_currency_5,
        _kind_hint: dimension, _type_hint: string}]
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
    column_order: ["$$$_row_numbers_$$$", accountspayable.company_code_bukrs, accountspayable.company_text_butxt,
      accountspayable.account_number_of_vendor_or_creditor_lifnr, accountspayable.name1,
      accountspayable.accounting_document_number_belnr, accountspayable.number_of_line_item_within_accounting_document_buzei,
      accountspayable.posting_date_in_the_document_budat, accountspayable.overdue_amount,
      currency_2, accountspayable.overdue_amount_conv, global_currency, accountspayable.outstanding_but_not_overdue,
      currency_4, accountspayable.outstanding_but_not_overdue_glob_curr, currency_conversion_new.tcurr,
      accountspayable.past_overdue_but_not_overdue, currency_3, accountspayable.past_overdue_but_not_overdue_glob_curr,
      global_currency_1, accountspayable.past_overdue_1_to_30day, accountspayable.Currency,
      accountspayable.past_overdue_1_to_30day_glob_curr, global_currency_3, accountspayable.past_overdue_31_to_60day,
      currency_1, accountspayable.past_overdue_31_to_60day_glob_curr, global_currency_2,
      accountspayable.past_overdue_61_to_90day, currency, accountspayable.past_overdue_61_to_90day_glob_curr,
      global_currency_4, accountspayable.past_overdue_greater_than_90day, currency_5,
      accountspayable.past_overdue_greater_than_90day_glob_curr, global_currency_5,
      currency_conversion_new.ukurs]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      accountspayable.company_code_bukrs: Company Code
      accountspayable.name1: Vendor name
      accountspayable.account_number_of_vendor_or_creditor_lifnr: Vendor Number
      accountspayable.posting_date_budat: Invoice Date
      accountspayable.outstanding_but_not_overdue: Outstanding Amount
      accountspayable.company_text_butxt: Company Code Name
      accountspayable.past_overdue_1_to_30days: Overdue 1-30 Days
      accountspayable.past_overdue_31_to_60days: Overdue 31-60 Days
      accountspayable.past_overdue_61_to_90days: Overdue 61-90 Days
      accountspayable.past_overdue_greater_than_90days: Overdue > 90Days
      accountspayable.accounting_document_number_belnr: Accounting Document Number
      accountspayable.overdue_amount: Due Amount
      accountspayable.number_of_line_item_within_accounting_document_buzei: Document
        Line Item
      accountspayable.past_overdue_greater_than_90day: Overdue > 90 days
      accountspayable.past_overdue_61_to_90day: Overdue 61-90 days
      accountspayable.past_overdue_31_to_60day: Overdue 31-60 days
      accountspayable.past_overdue_1_to_30day: Overdue 1-30 days
      accountspayable.past_overdue_but_not_overdue: Outstanding but Not Overdue
      accountspayable.past_overdue_but_not_overdue_glob_curr: Outstanding but Not
        Overdue Global Currency
      accountspayable.past_overdue_greater_than_90day_glob_curr: Overdue > 90 days
        Global Currency
      accountspayable.past_overdue_61_to_90day_glob_curr: Overdue 61-90 days Global
        Currency
      accountspayable.past_overdue_31_to_60day_glob_curr: Overdue 31-60 days Global
        Currency
      accountspayable.past_overdue_1_to_30day_glob_curr: Overdue 1-30 days Global
        Currency
      accountspayable.outstanding_but_not_overdue_glob_curr: Outstanding Amount Global
        Currency
      accountspayable.overdue_amount_conv: Due Amount Global Currency
      currency_conversion_new.ukurs: Exchange Rate
      currency_conversion_new.tcurr: Global Currency
      accountspayable.posting_date_in_the_document_budat: Invoice Date
    series_column_widths: {}
    series_cell_visualizations:
      accountspayable.past_overdue_1_to_30days:
        is_active: false
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Vendor Number: accountspayable.account_number_of_vendor_or_creditor_lifnr
      Vendor Name: accountspayable.name1
      Company Code: accountspayable.company_text_butxt
      Target Currency: currency_conversion_new.tcurr
    row: 7
    col: 0
    width: 24
    height: 8
  - title: Accounts Payable Aging by Vendor
    name: Accounts Payable Aging by Vendor
    model: cortex_sap_operational
    explore: accountspayable
    type: looker_bar
    fields: [accountspayable.name1, accountspayable.outstanding_but_not_overdue_1_conv_drill,
      accountspayable.past_overdue_1_to_30days_conv_drill, accountspayable.past_overdue_31_to_60days_conv_drill,
      accountspayable.past_overdue_61_to_90days_conv_drill, accountspayable.past_overdue_greater_than_90days_conv_drill,
      accountspayable.sum_overdue_amount_conv_drill]
    filters: {}
    sorts: [accountspayable.sum_overdue_amount_conv_drill desc]
    limit: 5
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
    point_style: circle_outline
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: accountspayable.outstanding_but_not_overdue_1,
            id: accountspayable.outstanding_but_not_overdue_1, name: Not Overdue},
          {axisId: accountspayable.past_overdue_1_to_30days, id: accountspayable.past_overdue_1_to_30days,
            name: 1-30 Days}, {axisId: accountspayable.past_overdue_31_to_60days,
            id: accountspayable.past_overdue_31_to_60days, name: 31-60 Days}, {axisId: accountspayable.past_overdue_61_to_90days,
            id: accountspayable.past_overdue_61_to_90days, name: 61-90 Days}, {axisId: accountspayable.past_overdue_greater_than_90days,
            id: accountspayable.past_overdue_greater_than_90days, name: "&gt;90 Days"}],
        showLabels: true, showValues: true, maxValue: !!null '', valueFormat: "#,##0,\
          \ \\K", unpinAxis: false, tickDensity: custom, tickDensityCustom: 8, type: linear}]
    x_axis_label: Vendor Name
    hidden_series: []
    font_size: '10'
    label_value_format: "#,##0, \\K"
    series_types: {}
    series_colors:
      accountspayable.sum_overdue_amount_3: "#F57237"
      accountspayable.sum_overdue_on_past_due_date_1: "#3EB0D5"
      accountspayable.outstanding_but_not_overdue_1: "#1A73E8"
      accountspayable.past_overdue_1_to_30days: "#f9c9e4"
      accountspayable.past_overdue_greater_than_90days: "#E52592"
      accountspayable.past_overdue_31_to_60days: "#f292c9"
      accountspayable.past_overdue_61_to_90days: "#ec5cad"
      accountspayable.outstanding_but_not_overdue_1_conv_drill: "#1A73E8"
    series_labels:
      accountspayable.sum_overdue_amount_3: OverDue Amount
      accountspayable.sum_overdue_on_past_due_date_1: OverDue on Past DueDate
      accountspayable.outstanding_but_not_overdue_1: Not Overdue
      accountspayable.past_overdue_1_to_30days: 1-30 Days
      accountspayable.past_overdue_31_to_60days: 31-60 Days
      accountspayable.past_overdue_61_to_90days: 61-90 Days
      accountspayable.past_overdue_greater_than_90days: ">90 Days"
      accountspayable.past_overdue_greater_than_90days_conv_drill: ">90 Days Overdue"
      accountspayable.past_overdue_61_to_90days_conv_drill: 61-90 Days Overdue
      accountspayable.past_overdue_31_to_60days_conv_drill: 31-60 Days Overdue
      accountspayable.past_overdue_1_to_30days_conv_drill: 1-30 Days Overdue
      accountspayable.outstanding_but_not_overdue_1_conv_drill: Not Overdue
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    hidden_fields: [accountspayable.sum_overdue_amount_conv_drill]
    note_state: collapsed
    note_display: hover
    note_text: Aging analysis of highest balances due and overdue to vendors as of
      today
    listen:
      Vendor Number: accountspayable.account_number_of_vendor_or_creditor_lifnr
      Vendor Name: accountspayable.name1
      Company Code: accountspayable.company_text_butxt
      Target Currency: currency_conversion_new.tcurr
    row: 0
    col: 12
    width: 12
    height: 7
  - title: Accounts Payable Aging
    name: Accounts Payable Aging
    model: cortex_sap_operational
    explore: accountspayable
    type: looker_column
    fields: [accountspayable.Past_Due_Interval, accountspayable.sum_overdue_amount_1_conv_drill]
    pivots: [accountspayable.Past_Due_Interval]
    filters:
      accountspayable.company_code_bukrs: ''
    sorts: [accountspayable.Past_Due_Interval]
    limit: 500
    column_limit: 50
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
    y_axes: [{label: Amount Due, orientation: left, series: [{axisId: accountspayable.sum_overdue_amount_1,
            id: aNot OverDue - accountspayable.sum_overdue_amount_1, name: Not Overdue},
          {axisId: accountspayable.sum_overdue_amount_1, id: b1- 30 Days - accountspayable.sum_overdue_amount_1,
            name: 1-30 Days}, {axisId: accountspayable.sum_overdue_amount_1, id: c31-60
              Days - accountspayable.sum_overdue_amount_1, name: 31-60 Days}, {axisId: accountspayable.sum_overdue_amount_1,
            id: d61-90 Days - accountspayable.sum_overdue_amount_1, name: 61-90 Days},
          {axisId: accountspayable.sum_overdue_amount_1, id: e> 90 Days - accountspayable.sum_overdue_amount_1,
            name: "&gt;90 Days"}], showLabels: true, showValues: true, valueFormat: "#,##0,\
          \ \\K", unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Age
    hidden_series: []
    font_size: '10'
    label_value_format: "#,##0.0, \\K"
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
    note_text: Aging analysis of balances due and overdue to all vendors as of today
    listen:
      Vendor Number: accountspayable.account_number_of_vendor_or_creditor_lifnr
      Vendor Name: accountspayable.name1
      Company Code: accountspayable.company_text_butxt
      Target Currency: currency_conversion_new.tcurr
    row: 0
    col: 0
    width: 12
    height: 7
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
    explore: accountspayable
    listens_to_filters: []
    field: accountspayable.account_number_of_vendor_or_creditor_lifnr
