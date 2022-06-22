- dashboard: sales_performance
  title: "[SAP OTC AR] 04: Sales Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - name: Sales Performance
    type: text
    title_text: Sales Performance
    subtitle_text: "<font color=\"#c1c1c1\">How are my Sales performing ?\t</font>"
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
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
  - title: Sales Performance by Distribution Channel
    name: Sales Performance by Distribution Channel
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_pie
    fields: [data_intelligence_otc.distribution_channel, filtered_data_intelligence_otc_sum_sales_order_net_value_2]
    sorts: [filtered_data_intelligence_otc_sum_sales_order_net_value_2 desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_order_cycle_time_in_days, based_on: data_intelligence_otc.order_cycle_time_in_days,
        expression: '', label: Average of Order Cycle Time In Days, type: average,
        _kind_hint: measure, _type_hint: number}, {category: measure, expression: !!null '',
        label: Filtered Data Intelligence Otc - Sum Sales Order Net Value, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_otc.sum_sales_order_net_value,
        _kind_hint: measure, measure: filtered_data_intelligence_otc_sum_sales_order_net_value,
        type: sum, _type_hint: sum}, {category: measure, expression: !!null '', label: Filtered
          Data Intelligence Otc - Sum Sales Order Net Value 2, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_otc.sum_sales_order_net_value_2,
        _kind_hint: measure, measure: filtered_data_intelligence_otc_sum_sales_order_net_value_2,
        type: sum, _type_hint: sum}]
    value_labels: legend
    label_type: labVal
    inner_radius: 40
    start_angle: 18
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors:
      '10': "#ACE9F5"
      '20': "#FDEC85"
      '30': "#F29ED2"
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
    listen:
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 18
    col: 0
    width: 12
    height: 7
  - title: Sales Performance by Top 10 Products
    name: Sales Performance by Top 10 Products
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.product, filtered_data_intelligence_otc_sum_sales_order_net_value]
    filters: {}
    sorts: [filtered_data_intelligence_otc_sum_sales_order_net_value desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: !!null '', label: Filtered Data
          Intelligence Otc - Sum Sales Order Net Value, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_otc.sum_sales_order_net_value,
        _kind_hint: measure, measure: filtered_data_intelligence_otc_sum_sales_order_net_value,
        type: sum, _type_hint: sum}]
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
    y_axes: [{label: Sales Order Value, orientation: left, series: [{axisId: filtered_data_intelligence_otc_sum_sales_order_net_value,
            id: filtered_data_intelligence_otc_sum_sales_order_net_value, name: Filtered
              Data Intelligence Otc - Sum Sales Order Net Value}], showLabels: true,
        showValues: true, valueFormat: '0.0,,"M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Product
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      '10': "#FF8168"
      '20': "#079c98"
      sum_of_sales_order_net_price_1: "#C8A7F9"
      filtered_data_intelligence_otc_sum_sales_order_net_price: "#ACE9F5"
      filtered_data_intelligence_otc_sum_sales_order_net_value: "#FDEC85"
    x_axis_datetime_label: ''
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
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
    listen:
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 4
    col: 0
    width: 24
    height: 7
  - title: Sales Performance by Division
    name: Sales Performance by Division
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_pie
    fields: [data_intelligence_otc.division, filtered_data_intelligence_otc_sum_sales_order_net_value_3]
    filters: {}
    sorts: [data_intelligence_otc.division desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Filtered Data
          Intelligence Otc - Sum Sales Order Net Value, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_otc.sum_sales_order_net_value,
        _kind_hint: measure, measure: filtered_data_intelligence_otc_sum_sales_order_net_value,
        type: sum, _type_hint: sum}, {category: measure, expression: !!null '', label: Filtered
          Data Intelligence Otc - Sum Sales Order Net Value 3, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_otc.sum_sales_order_net_value_3,
        _kind_hint: measure, measure: filtered_data_intelligence_otc_sum_sales_order_net_value_3,
        type: sum, _type_hint: sum}]
    value_labels: legend
    label_type: labVal
    inner_radius: 40
    start_angle: 18
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors:
      '04': "#C8A7F9"
      '02': "#FDEC85"
      '03': "#ACE9F5"
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
    row: 18
    col: 12
    width: 12
    height: 7
  - title: Total Customers
    name: Total Customers
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [count_of_order_created_by]
    limit: 500
    dynamic_fields: [{measure: count_of_order_created_by, based_on: data_intelligence_otc.order_created_by,
        expression: '', label: Count of Order Created By, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
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
    listen:
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 25
    col: 0
    width: 4
    height: 8
  - title: Avg Sales of Top 10 Products
    name: Avg Sales of Top 10 Products
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.product, average_of_sales_order_net_price_global_currency]
    filters: {}
    sorts: [average_of_sales_order_net_price_global_currency desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Average of Sales Order
          Net Price Global Currency, value_format: '0.00,"K"', value_format_name: !!null '',
        based_on: data_intelligence_otc.sales_order_net_price_Global_Currency, _kind_hint: measure,
        measure: average_of_sales_order_net_price_global_currency, type: average,
        _type_hint: average}]
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
    y_axes: [{label: Average Sales, orientation: left, series: [{axisId: average_of_sales_order_net_price,
            id: average_of_sales_order_net_price, name: Average of Sales Order Net
              Price}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Product
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      average_of_sales_order_net_price: "#9E7FD0"
      average_of_sales_order_net_price_global_currency: "#F29ED2"
    show_null_points: true
    interpolation: linear
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
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
    row: 25
    col: 14
    width: 10
    height: 8
  - title: Avg Sales of Top 10 Customers
    name: Avg Sales of Top 10 Customers
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.customer_name1, average_of_sales_order_net_price_global_currency]
    filters:
      data_intelligence_otc.customer_name1: "-NULL"
    sorts: [average_of_sales_order_net_price_global_currency desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Average of Sales Order
          Net Price Global Currency, value_format: '0.00,"K"', value_format_name: !!null '',
        based_on: data_intelligence_otc.sales_order_net_price_Global_Currency, _kind_hint: measure,
        measure: average_of_sales_order_net_price_global_currency, type: average,
        _type_hint: average}]
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
    y_axes: [{label: Average Sales, orientation: left, series: [{axisId: average_of_sales_order_net_price,
            id: average_of_sales_order_net_price, name: Average of Sales Order Net
              Price}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Customer
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      average_of_sales_order_net_price: "#FD9577"
      average_of_sales_order_net_price_global_currency: "#ACE9F5"
    show_null_points: true
    interpolation: linear
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
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
    row: 25
    col: 4
    width: 10
    height: 8
  - title: Sales Performance by Top 5 Sales Org
    name: Sales Performance by Top 5 Sales Org
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.sales_org, filtered_data_intelligence_otc_sum_sales_order_net_value_1]
    filters: {}
    sorts: [filtered_data_intelligence_otc_sum_sales_order_net_value_1 desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Filtered Data
          Intelligence Otc - Sum Sales Order Net Value, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_otc.sum_sales_order_net_value,
        _kind_hint: measure, measure: filtered_data_intelligence_otc_sum_sales_order_net_value,
        type: sum, _type_hint: sum}, {category: measure, expression: !!null '', label: Filtered
          Data Intelligence Otc - Sum Sales Order Net Value 1, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_otc.sum_sales_order_net_value_1,
        _kind_hint: measure, measure: filtered_data_intelligence_otc_sum_sales_order_net_value_1,
        type: sum, _type_hint: sum}]
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
    y_axes: [{label: Sales Order Value, orientation: left, series: [{axisId: filtered_data_intelligence_otc_sum_sales_order_net_value_1,
            id: filtered_data_intelligence_otc_sum_sales_order_net_value_1, name: Filtered
              Data Intelligence Otc - Sum Sales Order Net Value 1}], showLabels: true,
        showValues: true, valueFormat: '0.0,,"M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Sales Org
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    series_types: {}
    series_colors:
      sum_of_sales_order_net_price: "#AEC8C1"
      data_intelligence_otc.sum_sales_order_net_price: "#AEC8C1"
      filtered_data_intelligence_otc_sum_sales_order_net_price: "#FDEC85"
      filtered_data_intelligence_otc_sum_sales_order_net_value: "#C8A7F9"
      filtered_data_intelligence_otc_sum_sales_order_net_value_1: "#A5EF55"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Year: data_intelligence_otc.creation_date_date
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      'Currency ': data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 11
    col: 0
    width: 24
    height: 7
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
    field: data_intelligence_otc.creation_date_date
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