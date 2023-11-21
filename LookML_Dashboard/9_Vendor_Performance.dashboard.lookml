- dashboard: sap_finance_vp_09_vendor_performance
  title: "Vendor Performance"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: IjLuUaKUK8RpdGr4iZ6Nbd
  elements:
  - title: Vendor Lead Time
    name: Vendor Lead Time
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_column
    fields: [vendor_performance.name1, vendor_performance.avg_vendor_cycle_time_in_days]
    filters:
      vendor_performance.vendor_account_number_lifnr: "-NULL"
    sorts: [vendor_performance.avg_vendor_cycle_time_in_days desc 0]
    limit: 5
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Average of Vendor
          Cycle Time In Days, value_format: !!null '', value_format_name: decimal_2,
        based_on: vendor_performance.vendor_cycle_time_in_days, _kind_hint: measure,
        measure: average_of_vendor_cycle_time_in_days, type: average, _type_hint: number},
      {measure: sum_of_vendor_cycle_time_in_days, based_on: vendor_performance.vendor_cycle_time_in_days,
        expression: '', label: Sum of Vendor Cycle Time In Days, type: sum, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: 'if(${vendor_performance.name1}
          = null AND ${vendor_performance.vendor_account_number_lifnr} = null,no,yes)',
        label: Null Calc, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: null_calc, _type_hint: yesno, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
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
    y_axes: [{label: Average Lead Time (in days), orientation: left, series: [{axisId: vendor_performance.avg_vendor_cycle_time_in_days,
            id: vendor_performance.avg_vendor_cycle_time_in_days, name: Average Vendor
              Lead Time (in days)}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    label_value_format: '0.0'
    series_types: {}
    series_colors:
      vendor_performance.avg_vendor_cycle_time_in_days: "#079c98"
    series_labels:
      vendor_performance.vendor_cycle_time_in_days: Vendor Cycle Time (Days)
      average_of_vendor_cycle_time_in_days: Average Vendor Lead Time (in days)
      vendor_performance.avg_vendor_cycle_time_in_days: Average Vendor Lead Time (in
        days)
    label_color: ["#80868B"]
    label_rotation: 0
    x_axis_label_rotation: 0
    show_null_points: true
    interpolation: linear
    swap_axes: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Vendors with the highest average delivery time in days from purchase
      order creation to goods receipt for completely delivered purchase orders created
      during the date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Name: vendor_performance.name1
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
    row: 9
    col: 8
    width: 8
    height: 6
  - title: Delivery Performance by Top Vendors
    name: Delivery Performance by Top Vendors
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_column
    fields: [vendor_performance.name1, vendor_performance.Vendor_Ontime_vendor, vendor_performance.Infull_rate_vendor,
      vendor_performance.Rejection_rate_vendor, vendor_performance.sum_invoice_amount]
    sorts: [vendor_performance.sum_invoice_amount desc]
    limit: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: left
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
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Delivery Performance (%), orientation: left, series: [{axisId: vendor_performance.Vendor_Ontime_vendor,
            id: vendor_performance.Vendor_Ontime_vendor, name: On-Time}, {axisId: vendor_performance.Infull_rate_vendor,
            id: vendor_performance.Infull_rate_vendor, name: In-Full}, {axisId: vendor_performance.Rejection_rate_vendor,
            id: vendor_performance.Rejection_rate_vendor, name: Rejection}], showLabels: true,
        showValues: true, valueFormat: 0%, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors:
      vendor_performance.Infull_rate_vendor: "#8ebde8"
    series_labels:
      vendor_performance.Rejection_rate: Rejection
      vendor_performance.Infull_rate: Infull
      vendor_performance.Vendor_Ontime: On Time
      vendor_performance.Vendor_Ontime_vendor: On-time
      vendor_performance.Infull_rate_vendor: In-full
      vendor_performance.Rejection_rate_vendor: Rejected
    label_color: ["#80868B"]
    defaults_version: 1
    hidden_fields: [vendor_performance.sum_invoice_amount]
    note_state: collapsed
    note_display: hover
    note_text: On-time, in-full and rejection rates of the top vendors for purchase
      orders created during the date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Name: vendor_performance.name1
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
    row: 2
    col: 4
    width: 20
    height: 6
  - title: Purchase Price Variance
    name: Purchase Price Variance
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_column
    fields: [vendor_performance.name1, vendor_performance.sum_standard_cost, vendor_performance.sum_net_price_in_target_currency_netpr,
      vendor_performance.sum_purchase_price_variance]
    filters: {}
    sorts: [vendor_performance.sum_net_price_in_target_currency_netpr desc 0]
    limit: 5
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Variance Amount, orientation: left, series: [{axisId: vendor_performance.sum_Standard_Price_global_currency,
            id: vendor_performance.sum_Standard_Price_global_currency, name: Standard
              Price}, {axisId: vendor_performance.sum_Purchase_price_global_currency,
            id: vendor_performance.sum_Purchase_price_global_currency, name: Purchase
              Price}, {axisId: vendor_performance.sum_Purchase_Variance_global_currency,
            id: vendor_performance.sum_Purchase_Variance_global_currency, name: Purchase
              Variance}], showLabels: true, showValues: true, valueFormat: '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    label_value_format: ''
    series_types:
      purchase_price_varaince.purchase_varainace_pv: area
      vendor_performance.sum_Purchase_Variance_global_currency: area
      vendor_performance.sum_purchase_price_variance: area
    series_colors:
      purchase_price_varaince.purchase_varainace_pv: "#FF8168"
    series_labels:
      purchase_price_varaince.standrad_price_std: Standard Price
      purchase_price_varaince.purchase_price_pp: Purchase Price
      purchase_price_varaince.purchase_varainace_pv: Purchase Variance
      vendor_performance.sum_Standard_Price_global_currency: Standard Price
      vendor_performance.sum_Purchase_price_global_currency: Purchase Price
      vendor_performance.sum_Purchase_Variance_global_currency: Purchase Variance
      vendor_performance.sum_purchase_price_variance: Purchase Price Variance
      vendor_performance.sum_net_price_in_target_currency_netpr: Purchase Price
      vendor_performance.sum_standard_cost: Standard Price
    x_axis_label_rotation: 0
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: The sum of differences, in the target currency, between the purchase
      price and standard price multiplied by the order quantity for purchase orders
      created during the date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Name: vendor_performance.name1
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
      Target Currency: vendor_performance.target_currency_tcurr
    row: 9
    col: 0
    width: 8
    height: 6
  - title: Purchase Order Status
    name: Purchase Order Status
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_column
    fields: [vendor_performance.name1, vendor_performance.count_past_due, vendor_performance.open]
    sorts: [vendor_performance.count_past_due desc]
    limit: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Number of Order Items, orientation: left, series: [{axisId: vendor_performance.count_past_due,
            id: vendor_performance.count_past_due, name: Past Due}, {axisId: vendor_performance.open,
            id: vendor_performance.open, name: Open}], showLabels: true, showValues: true,
        maxValue: !!null '', minValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: []
    font_size: '10'
    series_types: {}
    series_colors:
      vendor_performance.count_past_due: "#E52592"
      vendor_performance.count_open_po: "#7CB342"
      vendor_performance.open: "#1A73E8"
    series_labels:
      vendor_performance.count_past_due: Past Due
    label_color: ["#80868B"]
    x_axis_label_rotation: 0
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Vendors with the most purchase order items created during the date
      range selected that have exceeded their requested delivery date, or are currently
      open and expecting delivery
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Name: vendor_performance.name1
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
      Target Currency: vendor_performance.target_currency_tcurr
    row: 9
    col: 16
    width: 8
    height: 6
  - name: Key Vendor Performance Indicators
    type: text
    title_text: Key Vendor Performance Indicators
    subtitle_text: <font color="#c1c1c1">What is my overall delivery performance across
      vendors and how reliable are my top vendors?</font>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: <font color="#c1c1c1">Which vendors do I need to evaluate based
      on their pricing, lead time and open orders?</font>
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 1
  - title: On-time Delivery
    name: On-time Delivery
    model: cortex_sap_operational
    explore: vendor_performance
    type: single_value
    fields: [vendor_performance.Vendor_Ontime]
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
    custom_color: "#000000"
    single_value_title: On-time Delivery
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: On-time deliveries for purchase orders created during the date range
      selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Name: vendor_performance.name1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
    row: 2
    col: 0
    width: 4
    height: 2
  - title: Invoice Accuracy
    name: Invoice Accuracy
    model: cortex_sap_operational
    explore: vendor_performance
    type: single_value
    fields: [vendor_performance.Invoice_Accuracy]
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Accurate invoices received for purchase orders created during the date
      range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Name: vendor_performance.name1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
    row: 4
    col: 0
    width: 4
    height: 2
  - title: Rejection Rate
    name: Rejection Rate
    model: cortex_sap_operational
    explore: vendor_performance
    type: single_value
    fields: [vendor_performance.Rejection_rate]
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
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Deliveries rejected for purchase orders created during the date range
      selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Vendor Name: vendor_performance.name1
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Vendor Country: vendor_performance.country_key_land1
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Purchase Order Date: vendor_performance.purchasing_document_date_bedat_date
    row: 6
    col: 0
    width: 4
    height: 2
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
    field: vendor_performance.target_currency_tcurr
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
    listens_to_filters: [Purchasing Organization, Purchasing Group, Vendor Country,
      Vendor Name]
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
    listens_to_filters: [Company Code, Purchasing Group, Vendor Country, Vendor Name]
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
    listens_to_filters: [Company Code, Purchasing Organization, Vendor Country, Vendor
        Name]
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
    listens_to_filters: [Company Code, Purchasing Organization, Purchasing Group,
      Vendor Name]
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
    listens_to_filters: [Company Code, Purchasing Organization, Purchasing Group,
      Vendor Country]
    field: vendor_performance.name1
