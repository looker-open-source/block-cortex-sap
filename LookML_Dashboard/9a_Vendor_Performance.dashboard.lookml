- dashboard: sap_finance_vp_09_a_delivery_performance_trend
  title: "Vendor Delivery Performance Trend"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1E0Z3ngekMzhHYCkG9ti4H
  elements:
  - title: Delivery Performance Detailed Report
    name: Delivery Performance Detailed Report
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_grid
    fields: [vendor_performance.company_text_butxt, vendor_performance.purchasing_organization_text_ekotx,
      vendor_performance.purchasing_group_text_eknam, vendor_performance.country_key_land1,
      vendor_performance.name1, vendor_performance.vendor_account_number_lifnr, vendor_performance.document_number_ebeln,
      vendor_performance.item_ebelp, vendor_performance.purchasing_document_date_bedat_date,
      vendor_performance.Schedule_line_date_date, vendor_performance.Requested_delivery_date_date,
      vendor_performance.Actual_Receipt_Date_date, vendor_performance.item_delivery_date_eindt_date,
      vendor_performance.Invoice_date_date, vendor_performance.poquantity_menge, vendor_performance.uo_m_meins,
      vendor_performance.goods_receipt_quantity, vendor_performance.uo_m_meins2, vendor_performance.invoice_quantity,
      vendor_performance.uo_m_meins3, vendor_performance.On_Time, vendor_performance.In_full,
      vendor_performance.is_delivered, vendor_performance.is_rejected, vendor_performance.material_description,
      vendor_performance.material_type_description]
    filters:
      vendor_performance.On_Time: 'Yes'
    sorts: [vendor_performance.is_rejected desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
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
    column_order: ["$$$_row_numbers_$$$", vendor_performance.company_text_butxt, vendor_performance.purchasing_organization_text_ekotx,
      vendor_performance.purchasing_group_text_eknam, vendor_performance.country_key_land1,
      vendor_performance.name1, vendor_performance.vendor_account_number_lifnr, vendor_performance.material_type_description,
      vendor_performance.material_description, vendor_performance.document_number_ebeln,
      vendor_performance.item_ebelp, vendor_performance.purchasing_document_date_bedat_date,
      vendor_performance.Schedule_line_date_date, vendor_performance.Requested_delivery_date_date,
      vendor_performance.Actual_Receipt_Date_date, vendor_performance.item_delivery_date_eindt_date,
      vendor_performance.Invoice_date_date, vendor_performance.poquantity_menge, vendor_performance.uo_m_meins,
      vendor_performance.goods_receipt_quantity, vendor_performance.uo_m_meins2, vendor_performance.invoice_quantity,
      vendor_performance.uo_m_meins3, vendor_performance.On_Time, vendor_performance.In_full,
      vendor_performance.is_rejected, vendor_performance.is_delivered]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      vendor_performance.purchasing_organization_text_ekotx: Purchasing Organization
      vendor_performance.company_text_butxt: Company Code
      vendor_performance.vendor_account_number_lifnr: Vendor Number
      vendor_performance.document_number_ebeln: Purchase Order
      vendor_performance.item_ebelp: Purchase Order Item
      materials_md.material_text_maktx: Material
      vendor_performance.Actual_Receipt_Date_date: Goods Receipt Date
      vendor_performance.Requested_delivery_date_date: Requested Delivery Date
      vendor_performance.PO_Creation_Date_date: PO Creation Date
      vendor_performance.Schedule_line_date_date: Schedule Line Date
      vendor_performance.Invoice_date_date: Invoice Date
      vendor_performance.poquantity_menge: PO Quantity
      vendor_performance.uo_m_meins: PO Quantity Unit
      vendor_performance.uo_m_meins2: GR Quantity Unit
      vendor_performance.goods_receipt_quantity: GR Quantity
      vendor_performance.invoice_quantity: Invoice Quantity
      vendor_performance.uo_m_meins3: Invoice Quantity Unit
      vendor_performance.Delivery: Delivery
      vendor_performance.On_Time: Is On-time
      vendor_performance.item_delivery_date_eindt_date: Actual Delivery Date
      vendor_performance.purchasing_document_date_bedat_date: Purchase Document Date
      vendor_performance.DeliveredorNot: Delivered (Yes/No)
      vendor_performance.purchasing_group_text_eknam: Purchasing Group
      vendor_performance.Rejected: Rejected
      vendor_performance.In_full: Is In-full
      material_types_md.description_of_material_type_mtbez: Material Type
      vendor_performance.is_delivered: Is Delivered
      vendor_performance.is_rejected: Is Rejected
      vendor_performance.material_description: Material
      vendor_performance.material_type_description: Material Type
    series_column_widths:
      vendor_performance.purchasing_organization_text_ekotx: 109
      vendor_performance.purchasing_group_text_eknam: 139
      vendor_performance.company_text_butxt: 146
      vendor_performance.vendor_account_number_lifnr: 93
      vendor_performance.name1: 221
      vendor_performance.document_number_ebeln: 92
      vendor_performance.item_ebelp: 81
      materials_md.material_text_maktx: 240
      vendor_performance.Actual_Receipt_Date_date: 84
      vendor_performance.Requested_delivery_date_date: 82
      vendor_performance.PO_Creation_Date_date: 240
      vendor_performance.Invoice_date_date: 91
      vendor_performance.poquantity_menge: 78
      vendor_performance.invoice_quantity: 84
      vendor_performance.uo_m_meins3: 75
      vendor_performance.On_Time: 98
      vendor_performance.Delivery: 240
      vendor_performance.country_key_land1: 84
      vendor_performance.Schedule_line_date_date: 87
      vendor_performance.item_delivery_date_eindt_date: 90
      vendor_performance.uo_m_meins: 95
      vendor_performance.goods_receipt_quantity: 86
      vendor_performance.uo_m_meins2: 91
      vendor_performance.DeliveredorNot: 120
      vendor_performance.material_description: 194
      vendor_performance.material_type_description: 129
      vendor_performance.purchasing_document_date_bedat_date: 98
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Name: vendor_performance.name1
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
      Material Type: vendor_performance.material_type_description
      Vendor Number: vendor_performance.vendor_account_number_lifnr
      Material: vendor_performance.material_description
    row: 8
    col: 0
    width: 24
    height: 6
  - title: Delivery Performance Trend
    name: Delivery Performance Trend
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_column
    fields: [vendor_performance.Vendor_Ontime_del, vendor_performance.Infull_rate_del,
      vendor_performance.Vendor_Ontime_late, vendor_performance.purchasing_document_date_bedat_month]
    fill_fields: [vendor_performance.purchasing_document_date_bedat_month]
    sorts: [vendor_performance.purchasing_document_date_bedat_month]
    limit: 100
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Delivery Performance (%), orientation: left, series: [{axisId: vendor_performance.Vendor_Ontime_del,
            id: vendor_performance.Vendor_Ontime_del, name: On-time}, {axisId: vendor_performance.Infull_rate_del,
            id: vendor_performance.Infull_rate_del, name: In-full}, {axisId: vendor_performance.Vendor_Ontime_late,
            id: vendor_performance.Vendor_Ontime_late, name: Late}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', valueFormat: 0%,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 0, type: linear}]
    x_axis_label: Purchase Order Month
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    hidden_series: []
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors:
      vendor_performance.Vendor_Ontime_del: "#1A73E8"
      vendor_performance.Infull_rate_del: "#8ebde8"
      vendor_performance.Vendor_Ontime_late: "#E52592"
    series_labels:
      vendor_performance.Vendor_Ontime_del: On-time
      vendor_performance.Infull_rate_del: In-full
      vendor_performance.Vendor_Ontime_late: Late
    label_color: ["#80868B"]
    x_axis_datetime_label: "%b-%Y"
    show_null_points: true
    interpolation: linear
    swap_axes: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map: usa
    map_projection: ''
    truncate_column_names: false
    groupBars: true
    labelSize: 10pt
    showLegend: true
    up_color: false
    down_color: false
    total_color: false
    note_state: collapsed
    note_display: hover
    note_text: Monthly on-time, in-full and rejection rates for purchase orders created
      during the date range selected
    listen:
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Company Code: vendor_performance.company_text_butxt
      Vendor Name: vendor_performance.name1
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
      Material Type: vendor_performance.material_type_description
      Vendor Number: vendor_performance.vendor_account_number_lifnr
      Material: vendor_performance.material_description
    row: 0
    col: 0
    width: 24
    height: 8
  filters:
  - name: Purchase Order Date
    title: Purchase Order Date
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
    field: vendor_performance.purchasing_document_date_bedat_date
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
    listens_to_filters: [Vendor Country, Vendor Name, Material Type Description, Material,
      Material Type, Vendor Number, Purchasing Group, Purchasing Organization]
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
    listens_to_filters: [Company Code, Vendor Country, Vendor Name, Material Type
        Description, Material, Material Type, Vendor Number, Purchasing Group]
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
    listens_to_filters: [Company Code, Vendor Country, Vendor Name, Material Type
        Description, Material, Material Type, Vendor Number, Purchasing Organization]
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
    listens_to_filters: [Company Code, Vendor Name, Material Type Description, Material,
      Material Type, Vendor Number, Purchasing Group, Purchasing Organization]
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
    listens_to_filters: [Company Code, Vendor Country, Material Type Description,
      Material, Material Type, Vendor Number, Purchasing Group, Purchasing Organization]
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
    listens_to_filters: [Company Code, Vendor Country, Vendor Name, Material Type
        Description, Material, Material Type, Purchasing Group, Purchasing Organization]
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
    model: cortex_sap_operational
    explore: vendor_performance
    listens_to_filters: [Vendor Number, Purchasing Group, Purchasing Organization]
    field: vendor_performance.material_type_description
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
    listens_to_filters: [Material Type, Vendor Number, Purchasing Group, Purchasing
        Organization]
    field: vendor_performance.material_description
