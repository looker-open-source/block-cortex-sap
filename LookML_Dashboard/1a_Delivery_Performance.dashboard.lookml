- dashboard: delivery_performance
  title: "[SAP OTC AR] 01_a: Delivery Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Delivery Performance
    name: Delivery Performance
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_grid
    fields: [data_intelligence_otc.delivery, data_intelligence_otc.delivery_line_item,
      data_intelligence_otc.product, data_intelligence_otc.req_delivery_date, data_intelligence_otc.actual_delivery_date,
      data_intelligence_otc.Sold_To_Party, data_intelligence_otc.Ship_To_Party, data_intelligence_otc.Bill_To_Party,
      data_intelligence_otc.sales_order, data_intelligence_otc.delivered_qty, data_intelligence_otc.Base_UoM,
      data_intelligence_otc.Exchange_Rate_of_Delivered_Value, data_intelligence_otc.delivered_value_Local_Currency,
      data_intelligence_otc.Local_Currency_Key, data_intelligence_otc.delivered_value_Global_Currency,
      data_intelligence_otc.Global_Currency, data_intelligence_otc.OnTime, data_intelligence_otc.InFull,
      data_intelligence_otc.OnTime_InFull, data_intelligence_otc.Late_Delivery]
    filters:
      data_intelligence_otc.delivery: "-NULL"
    sorts: [data_intelligence_otc.actual_delivery_date desc]
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
      data_intelligence_otc.delivery: 120
      data_intelligence_otc.delivery_line_item: 120
      data_intelligence_otc.product: 120
      data_intelligence_otc.delivery_date: 120
      data_intelligence_otc.act_delivery_date: 120
      data_intelligence_otc.Sold_To_Party: 120
      data_intelligence_otc.Ship_To_Party: 120
      data_intelligence_otc.Bill_To_Party: 120
      data_intelligence_otc.sales_order: 120
      data_intelligence_otc.delivered_qty: 120
      data_intelligence_otc.Base_UoM: 120
      data_intelligence_otc.delivered_value_Local_Currency: 120
      data_intelligence_otc.Local_Currency_Key: 120
      data_intelligence_otc.actual_delivery_date: 120
      data_intelligence_otc.req_delivery_date: 120
      data_intelligence_otc.Global_Currency: 120
      data_intelligence_otc.Exchange_Rate_of_Delivered_Value: 120
      data_intelligence_otc.delivered_value_Global_Currency: 120
      data_intelligence_otc.OnTime: 120
      data_intelligence_otc.InFull: 120
      data_intelligence_otc.OnTime_InFull: 120
      data_intelligence_otc.Late_Delivery: 120
    series_text_format:
      data_intelligence_otc.delivery:
        align: left
      data_intelligence_otc.delivery_line_item:
        align: left
      data_intelligence_otc.product:
        align: left
      data_intelligence_otc.delivery_date:
        align: left
      data_intelligence_otc.act_delivery_date:
        align: left
      data_intelligence_otc.Sold_To_Party:
        align: left
      data_intelligence_otc.Ship_To_Party:
        align: left
      data_intelligence_otc.Bill_To_Party:
        align: left
      data_intelligence_otc.sales_order:
        align: left
      data_intelligence_otc.delivered_qty:
        align: right
      data_intelligence_otc.Base_UoM:
        align: left
      data_intelligence_otc.delivered_value_Local_Currency:
        align: right
      data_intelligence_otc.Local_Currency_Key:
        align: left
      data_intelligence_otc.actual_delivery_date:
        align: left
      data_intelligence_otc.req_delivery_date:
        align: left
      data_intelligence_otc.Global_Currency:
        align: left
      data_intelligence_otc.Exchange_Rate_of_Delivered_Value:
        align: right
      data_intelligence_otc.Late_Delivery:
        align: right
      data_intelligence_otc.OnTime_InFull:
        align: right
      data_intelligence_otc.InFull:
        align: right
      data_intelligence_otc.OnTime:
        align: right
      data_intelligence_otc.delivered_value_Global_Currency:
        align: right
    series_types: {}
    defaults_version: 1
    listen:
      Year: data_intelligence_otc.creation_date_year
      Region: data_intelligence_otc.country
      Sales Org: data_intelligence_otc.sales_org
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Product: data_intelligence_otc.product
      Currency: data_intelligence_otc.Currency_Required
      Sold to Party: data_intelligence_otc.Sold_To_Party
    row: 0
    col: 0
    width: 24
    height: 12
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ' <a href="/dashboards/cortex_sap_operational::order_fulfillment?">Home</a>'
    body_text: ''
    row: 12
    col: 0
    width: 24
    height: 2
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
      type: checkboxes
      display: popover
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
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.Currency_Required
  - name: Sold to Party
    title: Sold to Party
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.Sold_To_Party