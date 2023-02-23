- dashboard: sap_finance_ar_06_c_overdue_receivables
  title: "[SAP FINANCE] AR 06_c: Overdue Receivables"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Rc0zEWNg5CTQ63ESOOPse9
  elements:
  - title: Over Due Receivable by Company
    name: Over Due Receivable by Company
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_column
    fields: [data_intelligence_ar.Company_Name, data_intelligence_ar.OverDue_Amount]
    sorts: [data_intelligence_ar.Company_Name]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Overdue Amount, value_format: '$
          0.00,"K"', value_format_name: !!null '', based_on: data_intelligence_ar.Open_and_Over_Due_Local_Currency,
        _kind_hint: measure, measure: overdue_amount, type: sum, _type_hint: sum}]
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
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Overdue Amount, orientation: left, series: [{axisId: data_intelligence_ar.Over_Due_Amount,
            id: data_intelligence_ar.Over_Due_Amount, name: Over Due Amount}], showLabels: true,
        showValues: true, valueFormat: '0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Company
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    series_colors:
      data_intelligence_ar.OverDue_Amount: "#12B5CB"
    show_dropoff: false
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: currency_conversion_new.tcurr
    row: 0
    col: 0
    width: 18
    height: 10
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ' <a href="/dashboards/cortex_sap_operational::sap_finance_ar_06_accounts_receivable?">Home</a>'
    body_text: ''
    row: 21
    col: 0
    width: 24
    height: 2
  - title: Total Over Due Receivable
    name: Total Over Due Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.OverDue_Amount]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Overdue Amount, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_ar.Open_and_Over_Due_Global_Currency,
        _kind_hint: measure, measure: overdue_amount, type: sum, _type_hint: sum}]
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color: "#4276BE"
    value_format: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: "#000000", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: equal to, value: !!null '',
        background_color: !!null '', font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: currency_conversion_new.tcurr
    row: 0
    col: 18
    width: 6
    height: 10
  - title: Over Due Receivable
    name: Over Due Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_grid
    fields: [data_intelligence_ar.Company_Code, data_intelligence_ar.Company_Name,
      data_intelligence_ar.Company_Country, data_intelligence_ar.Sold_to_Party_Number,
      data_intelligence_ar.Sold_to_Party_Name, data_intelligence_ar.Accounting_Document,
      data_intelligence_ar.Accounting_Document_Items, data_intelligence_ar.Posting_date,
      data_intelligence_ar.Net_Due_date, data_intelligence_ar.Past_Due_Interval, data_intelligence_ar.Local_Currency_Key,
      data_intelligence_ar.Open_and_Over_Due_Local_Currency, currency_conversion_new.tcurr,
      data_intelligence_ar.Open_and_Over_Due_Global_Currency, currency_conversion_new.ukurs]
    filters:
      data_intelligence_ar.Aging_Interval: '10'
      data_intelligence_ar.Key_Date: 2022/03/18
    sorts: [data_intelligence_ar.Open_and_Over_Due_Global_Currency desc]
    limit: 500
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      data_intelligence_ar.Accounting_Document_Items: Accounting Document Item
      currency_conversion_new.ukurs: Exchange Rate
      currency_conversion_new.tcurr: Global Currency Key
    series_text_format:
      data_intelligence_ar.Open_and_Over_Due_Global_Currency:
        align: right
      data_intelligence_ar.Open_and_Over_Due_Local_Currency:
        align: right
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    column_order: ["$$$_row_numbers_$$$", data_intelligence_ar.Company_Code, data_intelligence_ar.Company_Name,
      data_intelligence_ar.Company_Country, data_intelligence_ar.Sold_to_Party_Number,
      data_intelligence_ar.Sold_to_Party_Name, data_intelligence_ar.Accounting_Document,
      data_intelligence_ar.Accounting_Document_Items, data_intelligence_ar.Posting_date,
      data_intelligence_ar.Net_Due_date, data_intelligence_ar.Past_Due_Interval, data_intelligence_ar.Local_Currency_Key,
      data_intelligence_ar.Open_and_Over_Due_Local_Currency, currency_conversion_new.tcurr,
      data_intelligence_ar.Open_and_Over_Due_Global_Currency, currency_conversion_new.ukurs]
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: currency_conversion_new.tcurr
    row: 10
    col: 0
    width: 24
    height: 11
  filters:
  - name: Currency
    title: Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: currency_conversion_new.tcurr
  - name: Company
    title: Company
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Company_Name
  - name: Sold to Party
    title: Sold to Party
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Sold_to_Party_Name
