- dashboard: sap_order_to_cash_o2c_04_c_sales_performance_by_productperformance_tuning
  title: "[SAP ORDER TO CASH] O2C 04_c: Sales Performance by Product"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: IHja91oLgL82jKraEZcMlL
  elements:
  - title: Sales Performance by Product
    name: Sales Performance by Product
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_grid
    fields: [materials_md.material_text_maktx, sales_orders.sales_document_vbeln,
      sales_orders.item_posnr, sales_organizations_md.sales_org_name_vtext, distribution_channels_md.distribution_channel_name_vtext,
      divisions_md.division_name_vtext, sales_orders.cumulative_order_quantity_kwmeng,
      sales_orders.base_unit_of_measure_meins, currency_conversion_new.ukurs, sales_orders.sales_order_value_line_item_source_currency,
      sales_orders.currency_waerk, sales_orders.sales_order_value_glob_curr, currency_conversion_new.tcurr,
      sales_orders.max_sold_to_party_name, sales_orders.max_ship_to_party_name, sales_orders.max_bill_to_party_name]
    filters:
      sales_orders.division_spart: ''
    sorts: [materials_md.material_text_maktx]
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
    column_order: ["$$$_row_numbers_$$$", materials_md.material_text_maktx, sales_orders.sales_document_vbeln,
      sales_orders.item_posnr, sales_orders.max_sold_to_party_name, sales_orders.max_ship_to_party_name,
      sales_orders.max_bill_to_party_name, sales_organizations_md.sales_org_name_vtext,
      distribution_channels_md.distribution_channel_name_vtext, divisions_md.division_name_vtext,
      sales_orders.cumulative_order_quantity_kwmeng, sales_orders.base_unit_of_measure_meins,
      currency_conversion_new.ukurs, sales_orders.sales_order_value_line_item_source_currency,
      sales_orders.currency_waerk, sales_orders.sales_order_value_glob_curr, currency_conversion_new.tcurr]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      materials_md.material_text_maktx: Product
      sales_orders.sales_document_vbeln: Sales Order
      sales_orders.item_posnr: Sales Order Line Item
      customers_md.name1_name1: Sold to Party
      customers_md.name2_pson2: Ship to Party
      customers_md.name3_pson3: Bill to Party
      sales_organizations_md.sales_org_name_vtext: Sales Org
      distribution_channels_md.distribution_channel_name_vtext: Distribution Channel
      sales_orders.division_spart: Division
      sales_orders.cumulative_order_quantity_kwmeng: Sales Order Qty
      sales_orders.base_unit_of_measure_for_product_group_prbme: Base UoM
      currency_conversion_new.tcurr: Global Currency
      sales_orders.sales_order_value_glob_curr: Sales Order Value Global Currency
      sales_orders.currency_waerk: Local Currency Key
      sales_orders.sales_order_value_line_item_source_currency: Sales Order Value
        Local Currency
      currency_conversion_new.ukurs: Exchange Rate
      sales_orders.base_unit_of_measure_meins: Base UoM
      divisions_md.division_name_vtext: Division
      sales_orders.max_sold_to_party_name: Sold To Party
      sales_orders.max_ship_to_party_name: Ship To Party
      sales_orders.max_bill_to_party_name: Bill To Party
    series_column_widths: {}
    series_cell_visualizations: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Year: sales_orders.creation_date_erdat_date
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Division: divisions_md.division_name_vtext
      Product: materials_md.material_text_maktx
    row: 0
    col: 0
    width: 24
    height: 10
  - title: Home
    name: Home
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.Sales_performance]
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
      Year: sales_orders.creation_date_erdat_date
      Currency: currency_conversion_new.tcurr
      Region: countries_md.country_name_landx
      Sales Org: sales_organizations_md.sales_org_name_vtext
      Distribution Channel: distribution_channels_md.distribution_channel_name_vtext
      Division: divisions_md.division_name_vtext
      Product: materials_md.material_text_maktx
    row: 10
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
