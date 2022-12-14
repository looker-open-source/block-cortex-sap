- dashboard: sap_order_to_cash_o2c_04_sales_performanceperformance_tuning
  title: "[SAP ORDER TO CASH] O2C 04: Sales Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: FM7SdAo1feuXPacg2v6aZh
  elements:
  - name: Sales Performance
    type: text
    title_text: Sales Performance
    subtitle_text: "<font color=\"#c1c1c1\">How are my Sales performing ?\t</font>"
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 1
  - title: Sales Performance by Top 10 Products
    name: Sales Performance by Top 10 Products
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_column
    fields: [materials_md.material_text_maktx, sales_orders.sales_order_netvalue_global_currency_product]
    sorts: [sales_orders.sales_order_netvalue_global_currency_product desc]
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
    y_axes: [{label: Sales Order Net Value, orientation: left, series: [{axisId: sales_orders.sales_order_netvalue_global_currency,
            id: sales_orders.sales_order_netvalue_global_currency, name: Sales Order
              Netvalue Global Currency}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Product
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hide_legend: false
    series_colors:
      sales_orders.sales_order_netvalue_global_currency: "#FDEC85"
      sales_orders.sales_order_netvalue_global_currency_product: "#FDEC85"
    defaults_version: 1
    hidden_fields: []
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 3
    col: 0
    width: 24
    height: 6
  - title: Sales Performance by Top 5 Sales Org
    name: Sales Performance by Top 5 Sales Org
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_column
    fields: [sales_organizations_md.sales_org_name_vtext, sales_orders.sales_order_netvalue_global_currency_sales_org]
    filters: {}
    sorts: [sales_orders.sales_order_netvalue_global_currency_sales_org desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Sales Order Net Value, orientation: left, series: [{axisId: sales_orders.sales_order_netvalue_global_currency,
            id: sales_orders.sales_order_netvalue_global_currency, name: Sales Order
              Netvalue Global Currency}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Sales Org
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: 0
    series_colors:
      filtered_data_intelligence_otc_sum_sales_order_net_value_1: "#A5EF55"
      sales_orders.sales_order_netvalue_global_currency: "#A5EF55"
      sales_orders.sales_order_netvalue_global_currency_sales_org: "#A5EF55"
    defaults_version: 1
    hidden_fields: []
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 9
    col: 0
    width: 24
    height: 6
  - title: Sales Performance by Distribution Channel
    name: Sales Performance by Distribution Channel
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_pie
    fields: [distribution_channels_md.distribution_channel_name_vtext, sales_orders.sales_order_netvalue_global_currency_dist_channel]
    filters: {}
    sorts: [sales_orders.sales_order_netvalue_global_currency_dist_channel desc]
    limit: 500
    dynamic_fields: [{measure: sum_of_sales_order_netvalue_local_currency, based_on: sales_orders.sales_order_netvalue_local_currency,
        expression: '', label: Sum of Sales Order Netvalue Local Currency, type: sum,
        _kind_hint: measure, _type_hint: number}, {measure: sum_of_sales_order_netvalue_local_currency_2,
        based_on: sales_orders.sales_order_netvalue_local_currency, expression: '',
        label: Sum of Sales Order Netvalue Local Currency, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_sales_order_net_price_local_currency,
        based_on: sales_orders.sales_order_net_price_local_currency, expression: '',
        label: Sum of Sales Order Net Price Local Currency, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_sales_order_netvalue_local_currency_3,
        based_on: sales_orders.sales_order_netvalue_local_currency, expression: '',
        label: Sum of Sales Order Netvalue Local Currency, type: sum, _kind_hint: measure,
        _type_hint: number}, {measure: sum_of_sales_order_netvalue_local_currency_4,
        based_on: sales_orders.sales_order_netvalue_local_currency, expression: '',
        label: Sum of Sales Order Netvalue Local Currency, type: sum, _kind_hint: measure,
        _type_hint: number}]
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    series_colors:
      Wholesale Sales: "#FCCF41"
      Digital Sales: "#7CC8FA"
      Retail Sales: "#f56776"
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
    label_value_format: ''
    series_types: {}
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
    row: 15
    col: 0
    width: 12
    height: 6
  - title: Sales Performance by Division
    name: Sales Performance by Division
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_pie
    fields: [sales_orders.sales_order_netvalue_global_currency_division, divisions_md.division_name_vtext]
    filters: {}
    sorts: [sales_orders.sales_order_netvalue_global_currency_division desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    start_angle: 18
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors:
      '04': "#C8A7F9"
      '03': "#F29ED2"
      '02': "#ACE9F5"
      'null': "#FDEC85"
      Electronics: "#ACE9F5"
      Perishables: "#C8A7F9"
      Packaged Goods: "#AEC8C1"
    series_types: {}
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
    row: 15
    col: 12
    width: 12
    height: 6
  - title: Total Customers
    name: Total Customers
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [count_of_customer_number_kunnr_2]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_customer_number_kunnr, based_on: customers_md.customer_number_kunnr,
        expression: '', label: Count of Customer Number Kunnr, type: count_distinct,
        _kind_hint: measure, _type_hint: number, id: P6OqIto7kp}, {measure: count_of_customer_number_kunnr_2,
        based_on: customers_md.customer_number_kunnr, expression: '', label: Count
          of Customer Number Kunnr, type: count_distinct, _kind_hint: measure, _type_hint: number}]
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
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 21
    col: 0
    width: 4
    height: 7
  - title: Avg Sales of Top 10 Customers
    name: Avg Sales of Top 10 Customers
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_column
    fields: [customers_md.name1_name1, sales_orders.sales_order_net_price_global_currency]
    sorts: [sales_orders.sales_order_net_price_global_currency desc 0]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Average Sales, orientation: left, series: [{axisId: sales_orders.sales_order_netvalue_global_currency_1,
            id: sales_orders.sales_order_netvalue_global_currency_1, name: Sales Order
              Netvalue Global Currency 1}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Customer
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: ''
    series_types: {}
    series_colors:
      sales_orders.sales_order_netvalue_global_currency_1: "#ACE9F5"
      sales_orders.sales_order_net_price_global_currency: "#ACE9F5"
    defaults_version: 1
    hidden_fields: []
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 21
    col: 4
    width: 10
    height: 7
  - title: Avg Sales of Top 10 Products
    name: Avg Sales of Top 10 Products
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_column
    fields: [materials_md.material_text_maktx, sales_orders.sales_order_net_price_global_currency]
    sorts: [sales_orders.sales_order_net_price_global_currency desc 0]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Average Sales, orientation: left, series: [{axisId: sales_orders.sales_order_net_price_global_currency,
            id: sales_orders.sales_order_net_price_global_currency, name: Sales Order
              Net Price Global Currency}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Product
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      sales_orders.sales_order_net_price_global_currency: "#F29ED2"
    defaults_version: 1
    listen:
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 21
    col: 14
    width: 10
    height: 7
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
