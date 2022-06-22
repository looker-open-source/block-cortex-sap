- dashboard: doubtful_receivable
  title: "[SAP OTC AR] 06_b: Doubtful Receivable"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Doubtful Receivable by Company
    name: Doubtful Receivable by Company
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_column
    fields: [data_intelligence_ar.Company_Name, doubtful_amount]
    filters: {}
    sorts: [doubtful_amount desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Doubtful Amount, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_ar.Doubtful_Receivables_Global_Currency,
        _kind_hint: measure, measure: doubtful_amount, type: sum, _type_hint: sum}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: sum_of_doubtful_receivables_global_currency,
            id: sum_of_doubtful_receivables_global_currency, name: Sum of Doubtful
              Receivables Global Currency}], showLabels: true, showValues: true, valueFormat: '0.00,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    label_value_format: 0.00,"K"
    defaults_version: 1
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: data_intelligence_ar.Currency_Required
    row: 0
    col: 0
    width: 18
    height: 11
  - title: Total Doubtful Receivable
    name: Total Doubtful Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Sum_Doubtful_Receivables]
    filters: {}
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Doubtful Receivables,
        value_format: '0.00,"K"', value_format_name: !!null '', based_on: data_intelligence_ar.Doubtful_Receivables_Global_Currency,
        _kind_hint: measure, measure: doubtful_receivables, type: sum, _type_hint: sum}]
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
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: data_intelligence_ar.Currency_Required
    row: 0
    col: 18
    width: 6
    height: 11
  - title: Doubtful Receivable
    name: Doubtful Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_grid
    fields: [data_intelligence_ar.Company_Code, data_intelligence_ar.Company_Name,
      data_intelligence_ar.Sold_to_Party_Number, data_intelligence_ar.Sold_to_Party_Name,
      data_intelligence_ar.Accounting_Document, data_intelligence_ar.Accounting_Document_Items,
      data_intelligence_ar.Posting_date, data_intelligence_ar.Net_Due_date, data_intelligence_ar.Local_Currency_Key,
      data_intelligence_ar.Doubtful_Receivables_Local_Currency, data_intelligence_ar.Global_Currency_Key,
      data_intelligence_ar.Doubtful_Receivables_Global_Currency]
    filters:
      data_intelligence_ar.Doubtful_Receivables_Global_Currency: ">0"
    sorts: [data_intelligence_ar.Doubtful_Receivables_Global_Currency desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: data_intelligence_ar.Currency_Required
    row: 11
    col: 0
    width: 24
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ' <a href="/dashboards/cortex_sap_operational::accounts_receivable?">Home</a>'
    body_text: ''
    row: 19
    col: 0
    width: 24
    height: 2
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
      type: dropdown_menu
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