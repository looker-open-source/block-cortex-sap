- dashboard: order_status_snapshot
  title: "[SAP OTC AR] 02: Order Status Snapshot"
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
  - title: Return Orders
    name: Return Orders
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.Return_Order_Percentage]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{measure: count_of_delivery, based_on: data_intelligence_otc.delivery,
        expression: '', label: Count of Delivery, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: "${data_intelligence_otc.count_return_order}/${count_of_delivery}",
        label: Return Order %, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: return_order, _type_hint: number,
        is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.00%
    hidden_fields: []
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
    listen:
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 4
    col: 12
    width: 6
    height: 4
  - title: Cancelled Orders
    name: Cancelled Orders
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.Cancelled_Order_Percentage]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${data_intelligence_otc.count_canceled_order}/${data_intelligence_otc.count}",
        label: Cancelled Order %, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: cancelled_order, _type_hint: number,
        is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.00%
    defaults_version: 1
    listen:
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 4
    col: 18
    width: 6
    height: 4
  - title: Order Vs Delivery Efficiency (Top 10 Products)
    name: Order Vs Delivery Efficiency (Top 10 Products)
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.avg_order_line_items, data_intelligence_otc.product,
      data_intelligence_otc.average_deliveries_sales_orders]
    sorts: [data_intelligence_otc.avg_order_line_items desc]
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
    limit_displayed_rows: true
    legend_position: center
    point_style: circle_outline
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_label: Product
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      data_intelligence_otc.avg_order_line_items: "#ACE9F5"
    series_labels:
      data_intelligence_otc.average_deliveries_sales_orders: Average Delivery Items
      data_intelligence_otc.avg_order_line_items: Average Order Line Items
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    listen:
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 8
    col: 0
    width: 24
    height: 11
  - title: Avg Fill Rate%
    name: Avg Fill Rate%
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [filtered_data_intelligence_otc_average_fill_rate]
    limit: 5000
    dynamic_fields: [{category: measure, expression: !!null '', label: Filtered Data
          Intelligence Otc - Average Fill Rate, value_format: 0.00"%", value_format_name: !!null '',
        based_on: data_intelligence_otc.average_fill_rate, _kind_hint: measure, measure: filtered_data_intelligence_otc_average_fill_rate,
        type: average, _type_hint: average}]
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
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 4
    col: 6
    width: 6
    height: 4
  - name: Order Status Snapshot
    type: text
    title_text: Order Status Snapshot
    subtitle_text: <font color="#c1c1c1">How healthy is Order Fulfillment?</font>
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - title: One Touch Order
    name: One Touch Order
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.percentage_one_touch_order]
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
    value_format: 0"%"
    series_types: {}
    defaults_version: 1
    listen:
      Division: data_intelligence_otc.division
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Year: data_intelligence_otc.creation_date_year
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 4
    col: 0
    width: 6
    height: 4
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
    listens_to_filters: [Region]
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
    listens_to_filters: [Region, Sales Org]
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
    listens_to_filters: [Region, Sales Org, Distribution Channel]
    field: data_intelligence_otc.division
  - name: Product
    title: Product
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: [Region, Sales Org, Distribution Channel, Division]
    field: data_intelligence_otc.product
  - name: 'Currency '
    title: 'Currency '
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