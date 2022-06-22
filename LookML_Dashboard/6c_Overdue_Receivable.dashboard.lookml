- dashboard: overdue_receivables
  title: "[SAP OTC AR] 06_c: Overdue Receivables"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Overdue Receivable by Company
    name: Overdue Receivable by Company
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_column
    fields: [data_intelligence_ar.Company_Name, data_intelligence_ar.Over_Due_Amount]
    filters: {}
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: Overdue Amount, orientation: left, series: [{axisId: data_intelligence_ar.Over_Due_Amount,
            id: data_intelligence_ar.Over_Due_Amount, name: Over Due Amount}], showLabels: true,
        showValues: true, valueFormat: '0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Company
    label_value_format: 0.00,"K"
    series_colors:
      data_intelligence_ar.Over_Due_Amount: "#ACE9F5"
    show_dropoff: false
    defaults_version: 1
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: data_intelligence_ar.Currency_Required
    row: 0
    col: 0
    width: 18
    height: 10
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ' <a href="/dashboards/cortex_sap_operational::accounts_receivable?">Home</a>'
    body_text: ''
    row: 21
    col: 0
    width: 24
    height: 2
  - title: Total Overdue Receivable
    name: Total Overdue Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.OverDue_Amount]
    filters: {}
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
    value_format: ''
    defaults_version: 1
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: data_intelligence_ar.Currency_Required
    row: 0
    col: 18
    width: 6
    height: 10
  - title: Overdue Receivable
    name: Overdue Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_grid
    fields: [data_intelligence_ar.Company_Code, data_intelligence_ar.Company_Name,
      data_intelligence_ar.Company_Country, data_intelligence_ar.Sold_to_Party_Number,
      data_intelligence_ar.Sold_to_Party_Name, data_intelligence_ar.Accounting_Document_Items,
      data_intelligence_ar.Posting_date, data_intelligence_ar.Past_Due_Interval, data_intelligence_ar.Local_Currency_Key,
      data_intelligence_ar.Open_and_Over_Due_Local_Currency, data_intelligence_ar.Global_Currency_Key,
      data_intelligence_ar.Open_and_Over_Due_Global_Currency]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: data_intelligence_ar.Currency_Required
    row: 10
    col: 0
    width: 24
    height: 11
  filters:
  - name: Company
    title: Company
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
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
  - name: Currency
    title: Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Currency_Required