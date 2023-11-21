- dashboard: sap_order_to_cash_o2c_03_order_detailsperformance_tuning
  title: "Sales Order Details"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: GapLOzfEPZDaXx7TLctbOL
  elements:
  - name: Order Details
    type: text
    title_text: Order Details
    subtitle_text: <font color="#c1c1c1">What is my Order Status ?</font>
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Blocked Orders
    name: Blocked Orders
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.count_blocked_orders]
    limit: 500
    dynamic_fields: [{measure: count_of_blocked_orders, based_on: sales_orders.blocked_orders,
        expression: '', label: Count of Blocked Orders, type: count_distinct, _kind_hint: measure,
        _type_hint: number, id: 1ByKKrkL0e}]
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
    hidden_fields: []
    y_axes: []
    listen:
      " Order Status": sales_orders.sales_order_status
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 8
    col: 0
    width: 6
    height: 4
  - title: Closed, Open and Canceled Orders
    name: Closed, Open and Canceled Orders
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_pie
    fields: [sales_orders.sales_order_status, count_of_sales_document_vbeln]
    sorts: [count_of_sales_document_vbeln desc]
    limit: 500
    dynamic_fields: [{measure: count_of_sales_document_vbeln, based_on: sales_orders.sales_document_vbeln,
        expression: '', label: Count of Sales Document Vbeln, type: count_distinct,
        _kind_hint: measure, _type_hint: number}]
    value_labels: labels
    label_type: labVal
    series_colors:
      Closed: "#FCCF41"
      Open: "#7CC8FA"
      Canceled: "#f56776"
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
      " Order Status": sales_orders.sales_order_status
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 4
    col: 6
    width: 18
    height: 8
  - title: Total Orders
    name: Total Orders
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.count_orders]
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
    single_value_title: Total Orders
    defaults_version: 1
    listen:
      " Order Status": sales_orders.sales_order_status
      Year: sales_orders.creation_date_erdat_date
      Division: divisions_md.division_name_vtext
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 4
    col: 0
    width: 6
    height: 4
  - title: Sales Order Quantity and Value
    name: Sales Order Quantity and Value
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_grid
    fields: [sales_orders.sales_document_vbeln, sales_orders.item_posnr, materials_md.material_text_maktx,
      sales_orders.sales_order_status, sales_orders.cumulative_order_quantity_kwmeng,
      sales_orders.base_unit_of_measure_meins, currency_conversion_new.ukurs, sales_orders.sales_order_value_line_item_source_currency,
      sales_orders.currency_waerk, sales_orders.sales_order_value_glob_curr, currency_conversion_new.tcurr,
      sales_orders.creation_date_erdat_date, deliveries.date__proof_of_delivery___podat_date,
      deliveries.delivery_date_lfdat_date, sales_orders.max_sold_to_party_name, sales_orders.max_ship_to_party_name,
      sales_orders.max_bill_to_party_name]
    filters: {}
    sorts: [sales_orders.creation_date_erdat_date desc]
    limit: 500
    column_limit: 50
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
    pinned_columns:
      "$$$_row_numbers_$$$": left
    column_order: ["$$$_row_numbers_$$$", sales_orders.sales_document_vbeln, sales_orders.item_posnr,
      materials_md.material_text_maktx, sales_orders.max_sold_to_party_name, sales_orders.max_ship_to_party_name,
      sales_orders.max_bill_to_party_name, sales_orders.creation_date_erdat_date,
      deliveries.delivery_date_lfdat_date, deliveries.date__proof_of_delivery___podat_date,
      sales_orders.sales_order_status, sales_orders.cumulative_order_quantity_kwmeng,
      sales_orders.base_unit_of_measure_meins, currency_conversion_new.ukurs, sales_orders.sales_order_value_line_item_source_currency,
      sales_orders.currency_waerk, sales_orders.sales_order_value_glob_curr, currency_conversion_new.tcurr]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      sales_orders.sales_document_vbeln: Sales Order
      sales_orders.item_posnr: Sales Order Line Item
      materials_md.material_text_maktx: Product
      customers_md.name1_name1: Sold to Party
      customers_md.name2_name2: Ship to Party
      customers_md.name3_name3: Bill to Party
      sales_orders.sales_order_status: Order Status
      sales_orders.cumulative_order_quantity_kwmeng: Sales Order Qty
      sales_orders.base_unit_of_measure_meins: Base UoM
      currency_conversion_new.ukurs: Exchange Rate
      sales_orders.sales_order_value_line_item_source_currency: Sales Order Value
        Local Currency
      sales_orders.currency_waerk: Local Currency Key
      sales_orders.sales_order_value_glob_curr: Sales Order Value Global Currency
      currency_conversion_new.tcurr: Global Currency
      sales_orders.creation_date_erdat_date: Creation Date
      deliveries.date__proof_of_delivery___podat_date: Actual Delivery Date
      deliveries.delivery_date_lfdat_date: Requested Delivery date
      sales_orders.max_sold_to_party_name: Sold to Party
      sales_orders.max_ship_to_party_name: Ship to Party
      sales_orders.max_bill_to_party_name: Bill to Party
    series_column_widths:
      sales_orders.sales_document_vbeln: 111.24000000000001
    series_cell_visualizations: {}
    series_types: {}
    defaults_version: 1
    listen:
      Year: sales_orders.creation_date_erdat_date
      " Order Status": sales_orders.sales_order_status
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Product: materials_md.material_text_maktx
    row: 12
    col: 0
    width: 24
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
      " Order Status": sales_orders.sales_order_status
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
  - name: " Order Status"
    title: " Order Status"
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
    field: sales_orders.sales_order_status
