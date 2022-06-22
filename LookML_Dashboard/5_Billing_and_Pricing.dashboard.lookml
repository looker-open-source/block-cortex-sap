- dashboard: billing_and_pricing
  title: "[SAP OTC AR] 05: Billing and Pricing"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Navigation Bar
    name: Navigation Bar
    model: cortex_sap_operational
    explore: Navigation_Bar
    type: single_value
    fields: [Navigation_Bar.dash_nav]
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
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Customer focused Price Variations
    type: text
    title_text: Customer focused Price Variations
    subtitle_text: <font color="#c1c1c1"> How can Customers benefit from Price Adjustments
      ?</font>
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - title: " Price Adjustments based on Product Availability"
    name: " Price Adjustments based on Product Availability"
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.product, data_intelligence_otc.average_list_price2,
      data_intelligence_otc.average_intercompany_price]
    filters: {}
    sorts: [data_intelligence_otc.average_list_price2 desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_intercompany_price_global_currency, based_on: data_intelligence_otc.intercompany_price_Global_currency,
        expression: '', label: Sum of Intercompany Price Global Currency, type: sum,
        _kind_hint: measure, _type_hint: number}, {measure: sum_of_discount_global_currency,
        based_on: data_intelligence_otc.discount_Global_currency, expression: '',
        label: Sum of Discount Global Currency, type: sum, _kind_hint: measure, _type_hint: number},
      {measure: average_of_intercompany_price_global_currency, based_on: data_intelligence_otc.intercompany_price_Global_currency,
        expression: '', label: Average of Intercompany Price Global Currency, type: average,
        _kind_hint: measure, _type_hint: number}, {measure: average_of_discount_global_currency,
        based_on: data_intelligence_otc.discount_Global_currency, expression: '',
        label: Average of Discount Global Currency, type: average, _kind_hint: measure,
        _type_hint: number}]
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
    plot_size_by_field: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    size_by_field: data_intelligence_otc.averaage_discount
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      sum_of_discount_global_currency: "#F29ED2"
    series_labels:
      data_intelligence_otc.average_list_price2: Average List Price
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    up_color: false
    down_color: false
    total_color: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Sales Org: data_intelligence_otc.sales_org
      Region: data_intelligence_otc.country
      Year: data_intelligence_otc.creation_date_year
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Currency: data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 15
    col: 0
    width: 24
    height: 10
  - name: Product focused Price Variations
    type: text
    title_text: Product focused Price Variations
    subtitle_text: <font color="#c1c1c1"> How Product Availability can trigger an
      Intercompany Price ?</font>
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 2
  - title: Price Adjustments based on Customer Profiling
    name: Price Adjustments based on Customer Profiling
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.customer_name1, data_intelligence_otc.average_list_price1,
      data_intelligence_otc.average_adjusted_price]
    filters:
      data_intelligence_otc.customer_name1: "-NULL"
      data_intelligence_otc.Currency_Required: USD
    sorts: [data_intelligence_otc.average_list_price1 desc]
    limit: 500
    dynamic_fields: [{measure: min_of_adjusted_price_global_currency, based_on: data_intelligence_otc.adjusted_price_Global_currency,
        expression: '', label: Min of Adjusted Price Global Currency, type: min, _kind_hint: measure,
        _type_hint: number}, {measure: average_of_adjusted_price_global_currency,
        based_on: data_intelligence_otc.adjusted_price_Global_currency, expression: '',
        label: Average of Adjusted Price Global Currency, type: average, _kind_hint: measure,
        _type_hint: number}, {measure: average_of_list_price_global_currency, based_on: data_intelligence_otc.list_price_Global_currency,
        expression: '', label: Average of List Price Global Currency, type: average,
        _kind_hint: measure, _type_hint: number}]
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
    x_axis_label: Customer
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      average_of_list_price_global_currency: "#F29ED2"
      data_intelligence_otc.average_list_price1: "#F29ED2"
      data_intelligence_otc.average_adjusted_price: "#A5EF55"
    series_labels:
      data_intelligence_otc.average_list_price1: Average List Price
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 4
    col: 0
    width: 24
    height: 9
  filters:
  - name: Year
    title: Year
    type: field_filter
    default_value: 2022/01/01 to 2022/03/29
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.creation_date_year
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.country
  - name: Sales Org
    title: Sales Org
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.sales_org
  - name: Distribution Channel
    title: Distribution Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.distribution_channel
  - name: Division
    title: Division
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.division
  - name: Product
    title: Product
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.product
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
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.Currency_Required