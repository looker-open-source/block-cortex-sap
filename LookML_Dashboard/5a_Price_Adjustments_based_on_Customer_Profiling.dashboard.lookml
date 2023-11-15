- dashboard: sap_order_to_cash_o2c_05_a_price_adjustments_based_on_customer_profilingperformance_tuning
  title: "Sales Price Adjustments based on Customer Profiling"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: Z94oNLtpcjeajqE04BcyYs
  elements:
  - title: Price Adjustments based on Customer Profiling
    name: Price Adjustments based on Customer Profiling
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_grid
    fields: [customers_md.name1_name1, sales_orders.sales_document_vbeln, sales_orders.item_posnr,
      materials_md.material_text_maktx, sales_orders.variation_of_listprice_and_adjustedprice,
      sales_orders.cumulative_order_quantity_kwmeng, sales_orders.list_price_glob_curr,
      sales_orders.adjusted_price_glob_curr, sales_orders.sales_order_netvalue_glob_curr_1]
    sorts: [customers_md.name1_name1]
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
    column_order: ["$$$_row_numbers_$$$", customers_md.name1_name1, sales_orders.sales_document_vbeln,
      sales_orders.item_posnr, sales_orders.cumulative_order_quantity_kwmeng, sales_orders.sales_order_netvalue_glob_curr_1,
      materials_md.material_text_maktx, sales_orders.list_price_glob_curr, sales_orders.adjusted_price_glob_curr,
      sales_orders.variation_of_listprice_and_adjustedprice]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      customers_md.name1_name1: Sold to Party
      sales_orders.sales_document_vbeln: Sales Order
      sales_orders.item_posnr: Sales Order Line Item
      materials_md.material_text_maktx: Product
      sales_orders.variation_of_listprice_and_adjustedprice: Variation Listprice and
        Adjustedprice
      sales_orders.sales_order_net_price_global_currency: Sales Order Net Value Global
        Currency
      sales_orders.list_price_global_currency: List Price Global Currency
      sales_orders.adjusted_price_global_currency: Adjusted Price Global Currency
      sales_orders.cumulative_order_quantity_kwmeng: Sales Order Qty
      sales_orders.sales_order_netvalue_glob_curr: Sales Order Net Value Global Currency
      sales_orders.list_price_glob_curr: List Price Global Currency
      sales_orders.adjusted_price_glob_curr: Adjusted Price Global Currency
      sales_orders.sales_order_netvalue_global_currency_product: Sales Order Net  Value
        Global Currency
      sales_orders.sales_order_netvalue_glob_curr_1: Sales Order Net Value Global
        Currency
    series_cell_visualizations:
      sales_orders.sales_order_net_price_global_currency:
        is_active: false
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Region: countries_md.country_name_landx
      Product: materials_md.material_text_maktx
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Year: sales_orders.creation_date_erdat_date
    row: 0
    col: 0
    width: 24
    height: 12
  - title: Untitled
    name: Untitled
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.billing_and_pricing]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: false
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
      Region: countries_md.country_name_landx
      Product: materials_md.material_text_maktx
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Division: divisions_md.division_name_vtext
      Currency: currency_conversion_new.tcurr
      Year: sales_orders.creation_date_erdat_date
    row: 12
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
  - name: Sales Order Net Value
    title: Sales Order Net Value
    type: field_filter
    default_value: "[0,2000]"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
      options:
        min: 0
        max: 2000
    model: cortex_sap_operational
    explore: sales_orders
    listens_to_filters: []
    field: sales_orders.sales_order_netvalue_global_currency_product
