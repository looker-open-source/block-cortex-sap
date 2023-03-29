- dashboard: sap_order_to_cash_o2c_01_a_delivery_performance_performance_tuning
  title: "Sales Order Delivery Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 9XW5FidZo6dLdTLY0OJADx
  elements:
  - title: Delivery Performance
    name: Delivery Performance
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_grid
    fields: [deliveries.delivery_vbeln, deliveries.delivery_item_posnr, materials_md.material_text_maktx,
      deliveries.delivery_date_lfdat_date, deliveries.date__proof_of_delivery___podat_date,
      sales_orders.sales_document_vbeln, deliveries.actual_quantity_delivered_in_sales_units_lfimg,
      sales_orders.base_unit_of_measure_meins, deliveries.delivered_value, sales_orders.currency_waerk,
      deliveries.OnTime, deliveries.InFull, deliveries.Late_Delivery, currency_conversion_new.ukurs,
      currency_conversion_new.tcurr, delivered_value_global_currency_1, sales_orders.max_sold_to_party_name,
      sales_orders.max_ship_to_party_name, sales_orders.max_bill_to_party_name]
    filters:
      deliveries.Delivery: 'Yes'
    sorts: [deliveries.date__proof_of_delivery___podat_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'if(${deliveries.OnTime}=yes
          AND ${deliveries.InFull}=yes,yes,no)', label: OTIF, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: otif,
        _type_hint: yesno, id: PcvLOnUP9J}, {category: dimension, expression: "${deliveries.delivered_value}*${currency_conversion_new.ukurs}",
        label: Delivered Value Global Currency, value_format: !!null '', value_format_name: decimal_2,
        dimension: delivered_value_global_currency_1, _kind_hint: dimension, _type_hint: number,
        id: wmVCayXyDz}]
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
      sales_orders.max_bill_to_party_name: left
      sales_orders.max_ship_to_party_name: left
      sales_orders.max_sold_to_party_name: left
    column_order: ["$$$_row_numbers_$$$", sales_orders.max_bill_to_party_name, sales_orders.max_ship_to_party_name,
      sales_orders.max_sold_to_party_name, deliveries.delivery_vbeln, deliveries.delivery_item_posnr,
      materials_md.material_text_maktx, deliveries.delivery_date_lfdat_date, deliveries.date__proof_of_delivery___podat_date,
      customers_md.name2_name2, sales_orders.sales_document_vbeln, deliveries.actual_quantity_delivered_in_sales_units_lfimg,
      sales_orders.base_unit_of_measure_meins, currency_conversion_new.ukurs, deliveries.delivered_value,
      sales_orders.currency_waerk, currency_conversion_new.tcurr, delivered_value_global_currency_1,
      deliveries.OnTime, deliveries.InFull, deliveries.Late_Delivery, otif]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      deliveries.delivery_vbeln: Delivery
      deliveries.delivery_item_posnr: Delivery line item
      materials_md.material_text_maktx: Product
      deliveries.delivery_date_lfdat_date: Req Delivery Date
      deliveries.date__proof_of_delivery___podat_date: Actual Delivery Date
      sales_orders.sold_to_party_kunnr: Sold to party
      deliveries.ship_to_party_kunnr: Ship to party
      sales_orders.sales_document_vbeln: Sales Order
      deliveries.actual_quantity_delivered_in_sales_units_lfimg: Delivered Qty
      sales_orders.base_unit_of_measure_meins: Base UoM
      deliveries.delivered_value: Delivered Value Local currency
      sales_orders.currency_waerk: Local Currency Key
      otif: OTIF(yes/no)
      customers_md.name1_name1: Sold to Party
      customers_md.name2_name2: Ship to Party
      customers_md.name3_name3: Bill toParty
      currency_conversion_new.ukurs: Exchange Rate
      currency_conversion_new.tcurr: Global Currency
      sales_orders.max_sold_to_party_name: Sold To Party
      sales_orders.max_ship_to_party_name: Ship To Party
      sales_orders.max_bill_to_party_name: Bill To Party
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
      Division: sales_orders.division_spart
      Product: materials_md.material_text_maktx
      Sold to Party: customers_md.name1_name1
    row: 0
    col: 0
    width: 24
    height: 11
  - title: Untitled
    name: Untitled
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [sales_orders.Order_fulfillment]
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
      Sold to Party: customers_md.name1_name1
    row: 11
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
      options: []
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
  - name: Sold to Party
    title: Sold to Party
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
    field: customers_md.name1_name1
