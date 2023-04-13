- dashboard: sap_order_to_cash_o2c_05_billing_and_pricing
  title: "[SAP ORDER TO CASH] O2C 05: Billing and Pricing"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: VMRXJW8ou8ax9tT9Eiuyof
  elements:
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
    explore: sales_orders
    type: looker_column
    fields: [customers_md.name1_name1, sales_orders.avg_list_price_global_currency_customer,
      sales_orders.avg_adjusted_price_global_currency]
    filters:
      customers_md.name1_name1: "-NULL"
      sales_order_pricing.avg_variation_in_listingprice_and_adjustedprice: NOT NULL
      sales_orders.avg_variation_of_listprice_and_adjustedprice: NOT NULL
    sorts: [sales_orders.avg_list_price_global_currency_customer desc]
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
    series_colors:
      sales_orders.avg_list_price_global_currency: "#F29ED2"
      sales_orders.avg_adjusted_price_global_currency: "#A5EF55"
      sales_orders.avg_list_price_global_currency_customer: "#F29ED2"
    series_labels:
      sales_orders.avg_list_price_global_currency: Average List Price
      sales_orders.avg_adjusted_price_global_currency: Avg Adjusted Price
      sales_orders.avg_list_price_global_currency_customer: Avg List Price
    defaults_version: 1
    listen:
      Year: sales_order_pricing.checkbox_kdatu_date
      Division: divisions_md.division_name_vtext
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
      Currency: currency_conversion_pricing.tcurr
    row: 4
    col: 0
    width: 24
    height: 9
  - title: Price Adjustments based on Product Availability
    name: Price Adjustments based on Product Availability
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_column
    fields: [materials_md.material_text_maktx, sales_orders.avg_list_price_global_currency_customer,
      sales_orders.avg_intercompany_price_global_currency]
    filters:
      sales_orders.avg_intercompany_price_global_currency: NOT NULL
    sorts: [sales_orders.avg_intercompany_price_global_currency desc]
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
    x_axis_label: Product
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_colors:
      sales_orders.avg_list_price_global_currency: "#FCCF41"
      sales_orders.avg_adjusted_price_global_currency: "#A5EF55"
    series_labels:
      sales_orders.avg_list_price_global_currency: Average List Price
      sales_orders.avg_adjusted_price_global_currency: Average Adjusted Price
      sales_orders.avg_intercompany_price_global_currency: Avg Intercompany Price
      sales_orders.avg_list_price_global_currency_customer: Avg List Price
    defaults_version: 1
    listen:
      Year: sales_order_pricing.checkbox_kdatu_date
      Division: divisions_md.division_name_vtext
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
      Currency: currency_conversion_pricing.tcurr
    row: 15
    col: 0
    width: 24
    height: 9
  - title: New Tile
    name: New Tile
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.dash_nav]
    filters:
      sales_orders.creation_date_erdat_date: 2022/01/01 to 2022/04/22
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
      Division: divisions_md.division_name_vtext
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
      Currency: currency_conversion_new.tcurr
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
      type: relative_timeframes
      display: inline
      options: []
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: sales_order_pricing.checkbox_kdatu_date
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
    field: currency_conversion_pricing.tcurr
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
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: materials_md.material_text_maktx
