- dashboard: sap_finance_ar_06_d_total_receivables
  title: "[SAP FINANCE] AR 06_d: Total Receivables"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: NArortOVshH6Vzf0voE2q9
  elements:
  - title: Account Receivable by Company
    name: Account Receivable by Company
    model: cortex_infosys
    explore: data_intelligence_ar
    type: looker_column
    fields: [data_intelligence_ar.Company_Name, data_intelligence_ar.Total_Receivables,
      data_intelligence_ar.Due_Amount]
    sorts: [data_intelligence_ar.Company_Name desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Total Receivable,
        based_on: data_intelligence_ar.Accounts_Receivable_Global_Currency, _kind_hint: measure,
        measure: total_receivable, type: sum, _type_hint: sum}]
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
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: total_receivable, id: total_receivable,
            name: Total Receivable}, {axisId: data_intelligence_ar.Due_Amount, id: data_intelligence_ar.Due_Amount,
            name: Due Amount}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    series_colors:
      data_intelligence_ar.Total_Receivables: "#12B5CB"
      data_intelligence_ar.Due_Amount: "#FF8168"
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
    width: 17
    height: 10
  - title: Accounts Receivable
    name: Accounts Receivable
    model: cortex_infosys
    explore: data_intelligence_ar
    type: looker_grid
    fields: [data_intelligence_ar.Company_Code, data_intelligence_ar.Company_Name,
      data_intelligence_ar.Fiscal_Year, data_intelligence_ar.Sold_to_Party_Name, data_intelligence_ar.Accounting_Document,
      data_intelligence_ar.Accounting_Document_Items, data_intelligence_ar.Posting_date,
      data_intelligence_ar.Local_Currency_Key, data_intelligence_ar.Accounts_Receivable_Local_Currency,
      currency_conversion_new.tcurr, data_intelligence_ar.Accounts_Receivable_Global_Currency,
      currency_conversion_new.ukurs]
    sorts: [data_intelligence_ar.Accounts_Receivable_Global_Currency desc]
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
      data_intelligence_ar.Accounts_Receivable_Global_Currency: Amount Receivable
        Global Currency
      data_intelligence_ar.Accounts_Receivable_Local_Currency: Amount Receivable Local
        Currency
      currency_conversion_new.tcurr: Global Currency Key
      currency_conversion_new.ukurs: Exchange Rate
    series_text_format:
      data_intelligence_ar.Accounts_Receivable_Local_Currency:
        align: right
      data_intelligence_ar.Accounts_Receivable_Global_Currency:
        align: right
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: currency_conversion_new.tcurr
    row: 10
    col: 0
    width: 24
    height: 10
  - title: Total Receivable
    name: Total Receivable
    model: cortex_infosys
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Sum_of_Receivables]
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    custom_color: "#4276BE"
    value_format: ''
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Company: data_intelligence_ar.Company_Name
      Sold to Party: data_intelligence_ar.Sold_to_Party_Name
      Currency: currency_conversion_new.tcurr
    row: 0
    col: 17
    width: 7
    height: 10
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ' <a href="/dashboards/cortex_infosys::sap_finance_ar_06_accounts_receivable?">Home</a>'
    body_text: ''
    row: 20
    col: 0
    width: 24
    height: 2
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
    model: cortex_infosys
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
    model: cortex_infosys
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
    model: cortex_infosys
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Sold_to_Party_Name
