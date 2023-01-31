- dashboard: spend_by_top_vendors
  title: "[SAP SPEND ANALYSIS] 08a: Spend By Top Vendors"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: xvgMbGq3Axh5UJcSs2OGLq
  elements:
  - title: Spend by Top Vendors Detailed Report
    name: Spend by Top Vendors Detailed Report
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_grid
    fields: [vendor_performance.company_text_butxt, vendor_performance.purchasing_organization_text_ekotx,
      vendor_performance.purchasing_group_text_eknam, vendor_performance.name1, vendor_performance.country_key_land1,
      vendor_performance.vendor_account_number_lifnr, vendor_performance.document_number_ebeln,
      vendor_performance.item_ebelp, materials_md.material_text_maktx, material_types_md.description_of_material_type_mtbez,
      vendor_performance.purchase_doc_date_date, vendor_performance.poquantity_menge,
      vendor_performance.uo_m_meins, vendor_performance.net_order_valuein_pocurrency_netwr,
      vendor_performance.invoice_amount_in_source_currency, vendor_performance.currency_key_waers,
      vendor_performance.currency_key_waers2, po_amount_global_currency, total_spend_global_currency,
      currency_conversion_new.tcurr, currency_conversion_new.ukurs, global_currency]
    filters:
      material_types_md.language_key_spras: E
      materials_md.language_spras: E
    sorts: [vendor_performance.purchase_doc_date_date desc]
    limit: 500
    dynamic_fields: [{category: dimension, expression: "${vendor_performance.net_order_valuein_pocurrency_netwr}*\
          \ ${currency_conversion_new.ukurs}", label: PO Amount Global Currency, value_format: !!null '',
        value_format_name: Greek_Number_Format, dimension: po_amount_global_currency,
        _kind_hint: dimension, _type_hint: number}, {category: dimension, expression: "${vendor_performance.invoice_amount_in_source_currency}*${currency_conversion_new.ukurs}",
        label: Total Spend Global Currency, value_format: !!null '', value_format_name: Greek_Number_Format,
        dimension: total_spend_global_currency, _kind_hint: dimension, _type_hint: number},
      {category: dimension, expression: "${currency_conversion_new.tcurr}", label: Global
          Currency, value_format: !!null '', value_format_name: !!null '', dimension: global_currency,
        _kind_hint: dimension, _type_hint: string}]
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
    column_order: ["$$$_row_numbers_$$$", vendor_performance.company_text_butxt, vendor_performance.purchasing_organization_text_ekotx,
      vendor_performance.purchasing_group_text_eknam, vendor_performance.country_key_land1,
      vendor_performance.name1, vendor_performance.vendor_account_number_lifnr, vendor_performance.document_number_ebeln,
      vendor_performance.item_ebelp, materials_md.material_text_maktx, material_types_md.description_of_material_type_mtbez,
      vendor_performance.purchase_doc_date_date, vendor_performance.poquantity_menge,
      vendor_performance.uo_m_meins, vendor_performance.net_order_valuein_pocurrency_netwr,
      vendor_performance.currency_key_waers, po_amount_global_currency, global_currency,
      vendor_performance.invoice_amount_in_source_currency, vendor_performance.currency_key_waers2,
      total_spend_global_currency, currency_conversion_new.tcurr, currency_conversion_new.ukurs]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      vendor_performance.purchasing_organization_text_ekotx: Purchasing Organization
      vendor_performance.purchasing_group_text_eknam: Purchasing Group
      vendor_performance.country_key_land1: Vendor Country
      vendor_performance.company_text_butxt: Company Code
      vendor_performance.name1: Vendor Name
      vendor_performance.poquantity_menge: PO Quantity
      vendor_performance.uo_m_meins: PO Unit
      vendor_performance.amount_in_local_currency_dmbtr: Total Spend
      vendor_performance.currency_key_waers: PO Currency
      vendor_performance.vendor_account_number_lifnr: Vendor Number
      material_types_md.material_type_mtart: Material Type
      materials_md.material_text_maktx: Material
      vendor_performance.purchase_doc_date: Document Period
      vendor_performance.currency_key_waers2: Total Spend Currency
      vendor_performance.net_order_valuein_pocurrency_netwr: PO Amount
      vendor_performance.purchase_doc_date_date: Purchase Document Date
      vendor_performance.invoice_amount_in_target_currency: Invoice Amount
      vendor_performance.currency_key_waers3: Currency
      material_types_md.description_of_material_type_mtbez: Material Type
      vendor_performance.invoice_amount_in_source_currency: Total Spend
      vendor_performance.document_number_ebeln: Purchase Order
      vendor_performance.item_ebelp: Item
      currency_conversion_new.tcurr: Global Currency
      currency_conversion_new.ukurs: Exchange Rate
      total_spend_global_currency: Total Spend in Global Currency
      po_amount_global_currency: PO Amount in Global Currency
    series_column_widths:
      vendor_performance.purchasing_organization_text_ekotx: 240
      vendor_performance.name1: 240
      vendor_performance.purchasing_group_text_eknam: 240
      vendor_performance.country_key_land1: 240
      vendor_performance.company_text_butxt: 240
      vendor_performance.document_number_ebeln: 220
      vendor_performance.poquantity_menge: 100
      vendor_performance.amount_in_local_currency_dmbtr: 240
      vendor_performance.uo_m_meins: 100
      vendor_performance.vendor_account_number_lifnr: 240
      materials_md.material_text_maktx: 240
      material_types_md.material_type_mtart: 240
      vendor_performance.purchase_doc_date: 240
      vendor_performance.invoice_amount_in_source_currency: 200
      vendor_performance.net_order_valuein_pocurrency_netwr: 200
      vendor_performance.purchase_doc_date_date: 150
      vendor_performance.material_type: 240
      material_types_md.description_of_material_type_mtbez: 240
      vendor_performance.item_ebelp: 240
      vendor_performance.currency_key_waers2: 100
      vendor_performance.currency_key_waers: 100
    series_cell_visualizations:
      vendor_performance.total_spend:
        is_active: true
    series_text_format:
      vendor_performance.amount_in_local_currency_dmbtr:
        align: right
      vendor_performance.poquantity_menge:
        align: right
      vendor_performance.invoice_amount_in_source_currency:
        align: right
      vendor_performance.net_order_valuein_pocurrency_netwr:
        align: right
    series_value_format:
      vendor_performance.amount_in_local_currency_dmbtr:
        name: id
        format_string: '0'
        label: ID
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
      Vendor Number: vendor_performance.vendor_account_number_lifnr
      Material Type: material_types_md.material_type_mtart
      Material: materials_md.material_text_maktx
    row: 6
    col: 0
    width: 24
    height: 6
  - title: Spend by Top Vendors Trend
    name: Spend by Top Vendors Trend
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_line
    fields: [vendor_performance.name1, vendor_performance.sum_spend_by_vendor1_globalcurr,
      vendor_performance.Invoice_date_month]
    pivots: [vendor_performance.name1]
    fill_fields: [vendor_performance.Invoice_date_month]
    filters:
      material_types_md.language_key_spras: E
    sorts: [vendor_performance.name1 desc, vendor_performance.Invoice_date_month]
    column_limit: 5
    dynamic_fields: [{measure: sum_of_amount_in_local_currency_dmbtr, based_on: vendor_performance.amount_in_local_currency_dmbtr,
        expression: '', label: Sum of Amount In Local Currency Dmbtr, type: sum, _kind_hint: measure,
        _type_hint: number, id: SjXDTbdlNW}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: e34425a5-3228-4f76-b45d-2e7cd13a6766
      options:
        steps: 5
    y_axes: [{label: Total Spend, orientation: left, series: [{axisId: vendor_performance.sum_spend_by_vendor1_globalcurr,
            id: Vendor 3 for US 2 Electronics - vendor_performance.sum_spend_by_vendor1_globalcurr,
            name: Vendor 3 for US 2 Electronics}, {axisId: vendor_performance.sum_spend_by_vendor1_globalcurr,
            id: Vendor 3 for US 1 Electronics - vendor_performance.sum_spend_by_vendor1_globalcurr,
            name: Vendor 3 for US 1 Electronics}, {axisId: vendor_performance.sum_spend_by_vendor1_globalcurr,
            id: Vendor 3 for Japan- Electronics - vendor_performance.sum_spend_by_vendor1_globalcurr,
            name: Vendor 3 for Japan- Electronics}, {axisId: vendor_performance.sum_spend_by_vendor1_globalcurr,
            id: Vendor 3 for Germany- Electronics - vendor_performance.sum_spend_by_vendor1_globalcurr,
            name: Vendor 3 for Germany- Electronics}, {axisId: vendor_performance.sum_spend_by_vendor1_globalcurr,
            id: Vendor 3 for Canada- Electronics - vendor_performance.sum_spend_by_vendor1_globalcurr,
            name: Vendor 3 for Canada- Electronics}], showLabels: true, showValues: true,
        maxValue: !!null '', minValue: !!null '', valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Invoice Month
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors:
      vendor_performance.sum_spend_by_vendor1_globalcurr: "#7CB342"
    series_labels:
      vendor_performance.sum_spend_by_country_1: Vendor Country
      vendor_performance.sum_spend_by_vendor_1: Vendor
    label_color: ["#80868B"]
    x_axis_datetime_label: "%m/%y"
    x_axis_label_rotation: -75
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0,,"M"
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
    hidden_fields: []
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
      Vendor Number: vendor_performance.vendor_account_number_lifnr
      Material Type: material_types_md.material_type_mtart
      Material: materials_md.material_text_maktx
    row: 0
    col: 7
    width: 17
    height: 6
  - title: Spend by Top Vendors
    name: Spend by Top Vendors
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_bar
    fields: [vendor_performance.name1, vendor_performance.sum_spend_by_vendor_globalcurr]
    filters:
      currency_conversion_new.tcurr: USD
      material_types_md.language_key_spras: E
    sorts: [vendor_performance.sum_spend_by_vendor_globalcurr desc 0]
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
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: b8e44ce6-d0e6-4bd4-b72c-ab0f595726a6
      options:
        steps: 5
    y_axes: [{label: Total Spend, orientation: bottom, series: [{axisId: vendor_performance.sum_spend_by_vendor_globalcurr,
            id: vendor_performance.sum_spend_by_vendor_globalcurr, name: Sum Spend
              By Vendor Globalcurr}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Vendor Name
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors: {}
    label_color: ["#80868B"]
    defaults_version: 1
    hidden_fields: []
    listen:
      Invoice Date: vendor_performance.Invoice_date_date
      Company Code: vendor_performance.company_text_butxt
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Vendor Name: vendor_performance.name1
      Vendor Country: vendor_performance.country_key_land1
      Vendor Number: vendor_performance.vendor_account_number_lifnr
    row: 0
    col: 0
    width: 7
    height: 6
  filters:
  - name: Invoice Date
    title: Invoice Date
    type: field_filter
    default_value: 365 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: []
    field: vendor_performance.Invoice_date_date
  - name: Target Currency
    title: Target Currency
    type: field_filter
    default_value: USD
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: []
    field: currency_conversion_new.tcurr
  - name: Company Code
    title: Company Code
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: []
    field: vendor_performance.company_text_butxt
  - name: Purchasing Organization
    title: Purchasing Organization
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: [Company Code]
    field: vendor_performance.purchasing_organization_text_ekotx
  - name: Purchasing Group
    title: Purchasing Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: [Purchasing Organization]
    field: vendor_performance.purchasing_group_text_eknam
  - name: Vendor Country
    title: Vendor Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: [Purchasing Group]
    field: vendor_performance.country_key_land1
  - name: Vendor Name
    title: Vendor Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: [Vendor Country]
    field: vendor_performance.name1
  - name: Vendor Number
    title: Vendor Number
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: []
    field: vendor_performance.vendor_account_number_lifnr
  - name: Material Type
    title: Material Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options:
      - Finished Product
      - Operating supplies
      - Raw materials
      - Semifinished Product
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: []
    field: material_types_md.description_of_material_type_mtbez
  - name: Material
    title: Material
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: []
    field: materials_md.material_text_maktx
