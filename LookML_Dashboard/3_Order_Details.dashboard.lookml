- dashboard: order_details
  title: "[SAP OTC AR] 03: Order Details"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Sales Order Metrics
    name: Sales Order Metrics
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Total Orders
    name: Total Orders
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.count_incoming_order]
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
    listen:
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Currency: data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 4
    col: 0
    width: 6
    height: 5
  - title: Blocked Orders
    name: Blocked Orders
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.count_blocked_order]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_blocked_order, based_on: data_intelligence_otc.blocked_order,
        expression: '', label: Count of Blocked Order, type: count_distinct, _kind_hint: measure,
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
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Currency: data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 9
    col: 0
    width: 6
    height: 5
  - title: Sales Order Quantity and Value
    name: Sales Order Quantity and Value
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_grid
    fields: [data_intelligence_otc.sales_order, data_intelligence_otc.sales_order_line_item,
      data_intelligence_otc.product, data_intelligence_otc.Sold_To_Party, data_intelligence_otc.Ship_To_Party,
      data_intelligence_otc.Bill_To_Party, data_intelligence_otc.order_status, data_intelligence_otc.sales_order_qty,
      data_intelligence_otc.Base_UoM, data_intelligence_otc.Exchange_Rate_Sales_Value,
      data_intelligence_otc.sales_order_value_Local_Currecny, data_intelligence_otc.Local_Currency_Key,
      data_intelligence_otc.Sales_Order_Value_Global_Currency, data_intelligence_otc.Global_Currency]
    sorts: [data_intelligence_otc.Exchange_Rate_Sales_Value desc]
    limit: 5000
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
    series_column_widths:
      data_intelligence_otc.sales_order: 120
      data_intelligence_otc.sales_order_line_items: 120
      data_intelligence_otc.product: 120
      data_intelligence_otc.Sold_To_Party: 120
      data_intelligence_otc.Ship_To_Party: 120
      data_intelligence_otc.Bill_To_Party: 120
      data_intelligence_otc.order_status: 120
      data_intelligence_otc.sales_order_qty: 120
      data_intelligence_otc.Base_UoM: 120
      data_intelligence_otc.sales_order_value_Local_Currecny: 120
      data_intelligence_otc.Local_Currency_Key: 120
      data_intelligence_otc.sales_order_line_item: 120
      data_intelligence_otc.Exchange_Rate_Sales_Value: 120
      data_intelligence_otc.Sales_Order_Value_Global_Currency: 120
      data_intelligence_otc.Global_Currency: 120
    series_text_format:
      data_intelligence_otc.sales_order:
        align: left
      data_intelligence_otc.sales_order_line_items:
        align: left
      data_intelligence_otc.product:
        align: left
      data_intelligence_otc.Sold_To_Party:
        align: left
      data_intelligence_otc.Ship_To_Party: {}
      data_intelligence_otc.Bill_To_Party:
        align: left
      data_intelligence_otc.order_status:
        align: left
      data_intelligence_otc.sales_order_qty:
        align: right
      data_intelligence_otc.Base_UoM:
        align: left
      data_intelligence_otc.sales_order_value_Local_Currecny:
        align: right
      data_intelligence_otc.Local_Currency_Key:
        align: left
      data_intelligence_otc.sales_order_line_item:
        align: left
      data_intelligence_otc.Exchange_Rate_Sales_Value:
        align: right
      data_intelligence_otc.Sales_Order_Value_Global_Currency:
        align: right
      data_intelligence_otc.Global_Currency:
        align: left
    series_types: {}
    defaults_version: 1
    listen:
      Region: data_intelligence_otc.country
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Currency: data_intelligence_otc.Currency_Required
      Product: data_intelligence_otc.product
    row: 14
    col: 0
    width: 24
    height: 11
  - name: Order Details
    type: text
    title_text: Order Details
    subtitle_text: <font color="#c1c1c1">What is my Order Status ?</font>
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - title: Closed, Open and Canceled Orders
    name: Closed, Open and Canceled Orders
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_pie
    fields: [data_intelligence_otc.order_status, data_intelligence_otc.count]
    sorts: [data_intelligence_otc.count desc]
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labVal
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    show_view_names: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 4
    col: 6
    width: 18
    height: 10
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