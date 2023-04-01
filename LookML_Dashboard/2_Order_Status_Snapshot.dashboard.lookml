- dashboard: sap_order_to_cash_o2c_02_order_status_snapshot
  title: "Sales Order Status Snapshot"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 7yeTGw3NJb448nhSCCGtGE
  elements:
  - name: Order Status Snapshot
    type: text
    title_text: Order Status Snapshot
    subtitle_text: <font color="#c1c1c1">How healthy is Order Fulfillment?</font>
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Avg Fill Rate %
    name: Avg Fill Rate %
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.fill_rate]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_fill_rate, based_on: sales_orders.fill_rate,
        expression: '', label: Average of Fill Rate, type: average, _kind_hint: measure,
        _type_hint: number, id: MHtgohgUyM}]
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
    hidden_fields: []
    y_axes: []
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 4
    col: 6
    width: 6
    height: 4
  - title: Cancelled Orders
    name: Cancelled Orders
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.canceled_order_percentage]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.00"%"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 4
    col: 18
    width: 6
    height: 4
  - title: Return Order
    name: Return Order
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.Return_Order_Percentage]
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
    value_format: 0.00"%"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 4
    col: 12
    width: 6
    height: 4
  - title: Order Vs Delivery Efficiency (Top 10 Products)
    name: Order Vs Delivery Efficiency (Top 10 Products)
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_column
    fields: [materials_md.material_text_maktx, sales_orders.count_sales_orders_line_item,
      deliveries.count_delivery_item_posnr]
    sorts: [sales_orders.count_sales_orders_line_item desc 0]
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
    x_axis_label: Product
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_colors:
      sales_orders.count_sales_orders_line_item: "#ACE9F5"
      deliveries.count_delivery_item_posnr: "#7CC8FA"
    series_labels:
      sales_orders.count_sales_orders_line_item: Total Sales Order Line Item
      deliveries.count_delivery_item_posnr: Total Delivery Line Item
    defaults_version: 1
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 8
    col: 0
    width: 24
    height: 8
  - title: One Touch Order
    name: One Touch Order
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.one_touch_order_percentage, sales_orders.count_one_touch_order,
      sales_orders.count_total_orders]
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
    value_format: 0.00"%"
    series_types: {}
    defaults_version: 1
    hidden_fields: [sales_orders.count_one_touch_order, sales_orders.count_total_orders]
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 4
    col: 0
    width: 6
    height: 4
  - title: New Tile
    name: New Tile
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.dash_nav]
    filters: {}
    limit: 500
    column_limit: 50
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
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Year
    title: Year
    type: field_filter
    default_value: 2022/01/01 to 2022/04/22
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: sales_orders.creation_date_erdat_date
  - name: Currency
    title: Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: currency_conversion_new.tcurr
  - name: Region
    title: Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: countries_md.country_name_landx
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
    explore: sales_orders
    listens_to_filters: []
    field: sales_organizations_md.sales_org_name_vtext
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
    explore: sales_orders
    listens_to_filters: []
    field: distribution_channels_md.distribution_channel_name_vtext
  - name: Division
    title: Division
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: divisions_md.division_name_vtext
  - name: Product
    title: Product
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: materials_md.material_text_maktx
