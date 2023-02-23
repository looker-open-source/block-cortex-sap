- dashboard: sap_finance_ar_06_a_days_sales_outstanding
  title: "[SAP FINANCE] AR 06_a: Days Sales Outstanding"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: HIqTur1Hcb6x8EWPRQJQ3L
  elements:
  - title: 'Day Sales Outstanding by Company '
    name: 'Day Sales Outstanding by Company '
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_column
    fields: [data_intelligence_ar.Company_Name, data_intelligence_ar.DSO]
    filters: {}
    sorts: [data_intelligence_ar.Company_Name desc]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: []
    x_axis_label: Company
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    series_colors:
      data_intelligence_ar.DSO: "#FF8168"
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
    defaults_version: 1
    hidden_fields: []
    listen:
      Day Sales Outstanding: data_intelligence_ar.Day_Sales_Outstanding
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: currency_conversion_new.tcurr
    row: 0
    col: 0
    width: 19
    height: 10
  - title: Day Sales Outstanding by Customer
    name: Day Sales Outstanding by Customer
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_grid
    fields: [data_intelligence_ar.Company_Code, data_intelligence_ar.Company_Name,
      data_intelligence_ar.Sold_to_Party_Number, data_intelligence_ar.Sold_to_Party_Name,
      data_intelligence_ar.DSO]
    filters:
      data_intelligence_ar.Currency_Required: USD
      data_intelligence_ar.Sold_to_Party_Number: "-0001000004"
    sorts: [data_intelligence_ar.DSO desc]
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: data_intelligence_ar.DSO,
            id: data_intelligence_ar.DSO, name: DSO}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Customers
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Day Sales Outstanding: data_intelligence_ar.Day_Sales_Outstanding
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: currency_conversion_new.tcurr
    row: 10
    col: 0
    width: 24
    height: 13
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ' <a href="/dashboards/cortex_sap_operational::sap_finance_ar_06_accounts_receivable?">Home</a>'
    body_text: ''
    row: 23
    col: 0
    width: 24
    height: 2
  - title: Avg Day Sales Outstanding
    name: Avg Day Sales Outstanding
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Total_DSO]
    filters: {}
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
    listen:
      Day Sales Outstanding: data_intelligence_ar.Day_Sales_Outstanding
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Company: data_intelligence_ar.Company_Name
      Currency: currency_conversion_new.tcurr
    row: 0
    col: 19
    width: 5
    height: 10
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
      type: dropdown_menu
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Sold_to_Party_Name
  - name: Day Sales Outstanding
    title: Day Sales Outstanding
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Day_Sales_Outstanding
