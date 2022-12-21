- dashboard: order_fulfillment
  title: "[SAP OTC AR] 01: Order Fulfillment"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Navigation Bar
    name: Navigation Bar
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
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Order Fulfillment
    type: text
    title_text: Order Fulfillment
    subtitle_text: "<font color=\"#c1c1c1\">How is my Delivery Performance?\t</font>"
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - name: ' <a href="/dashboards/cortex_sap_operational::delivery_performance?">Delivery
      Performance</a>'
    type: text
    title_text: ' <a href="/dashboards/cortex_sap_operational::delivery_performance?">Delivery
      Performance</a>'
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: In Full %
    name: In Full %
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [deliveries.InFullPercentage]
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
    value_format: 0.00%
    defaults_version: 1
    listen:
      Year: deliveries.date_created_erdat_date
    row: 4
    col: 6
    width: 6
    height: 4
  - title: On Time %
    name: On Time %
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [deliveries.OnTimePercentage]
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
    value_format: 0.00%
    defaults_version: 1
    listen:
      Year: deliveries.date_created_erdat_date
    row: 4
    col: 0
    width: 6
    height: 4
  - title: OTIF %
    name: OTIF %
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [deliveries.OTIFPercentage]
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
    value_format: 0.00%
    defaults_version: 1
    listen:
      Year: deliveries.date_created_erdat_date
    row: 4
    col: 12
    width: 6
    height: 4
  - title: Late Delivery %
    name: Late Delivery %
    model: cortex_sap_operational
    explore: sales_orders
    type: single_value
    fields: [deliveries.LateDeliveryPercentage]
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
    value_format: 0.00%
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
      Year: deliveries.date_created_erdat_date
    row: 4
    col: 18
    width: 6
    height: 4
  - title: Avg Order To Delivery Cycle Time
    name: Avg Order To Delivery Cycle Time
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_column
    fields: [average_of_order_cycle_time_2, materials_md.material_text_maktx]
    filters:
      average_of_order_cycle_time_2: ">0"
    sorts: [materials_md.material_text_maktx]
    limit: 500
    dynamic_fields: [{measure: average_of_order_cycle_time, based_on: deliveries.Order_Cycle_Time,
        expression: '', label: Average of Order Cycle Time, type: average, _kind_hint: measure,
        _type_hint: number, id: cy7lHmcwoH}, {measure: average_of_order_cycle_time_2,
        based_on: deliveries.Order_Cycle_Time, expression: '', label: Average of Order
          Cycle Time, type: average, _kind_hint: measure, _type_hint: number, id: ro6GfqDwBY}]
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
    y_axes: [{label: Average Order Cycle Time, orientation: left, series: [{axisId: average_of_order_cycle_time_2,
            id: average_of_order_cycle_time_2, name: Average of Order Cycle Time}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Product
    defaults_version: 1
    listen:
      Year: deliveries.date_created_erdat_date
    row: 17
    col: 0
    width: 24
    height: 7
  - title: On Time, In Full & OTIF
    name: On Time, In Full & OTIF
    model: cortex_sap_operational
    explore: sales_orders
    type: looker_line
    fields: [deliveries.date_created_erdat_month, deliveries.count_on_time_delivery,
      deliveries.count_in_full_delivery, deliveries.count_otif, deliveries.count_of_deliveries]
    fill_fields: [deliveries.date_created_erdat_month]
    sorts: [deliveries.date_created_erdat_month]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${deliveries.count_on_time_delivery}/${deliveries.count_of_deliveries}",
        label: On Time %, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: on_time, _type_hint: number, id: yuk3RNbXmc}, {category: table_calculation,
        expression: "${deliveries.count_in_full_delivery}/${deliveries.count_of_deliveries}",
        label: In Full %, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: in_full, _type_hint: number, id: MdTeyHWNoo}, {category: table_calculation,
        expression: "${deliveries.count_otif}/${deliveries.count_of_deliveries}",
        label: OTIF %, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: otif, _type_hint: number, id: mkIEP9ohdi}]
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
    show_null_points: true
    interpolation: linear
    x_axis_label: Month
    series_colors:
      on_time: "#ffe22c"
      in_full: "#18e4ff"
      otif: "#ff51a3"
    x_axis_datetime_label: "%B %y"
    defaults_version: 1
    hidden_fields: [deliveries.count_on_time_delivery, deliveries.count_in_full_delivery,
      deliveries.count_otif, deliveries.count_of_deliveries]
    listen:
      Year: deliveries.date_created_erdat_date
    row: 10
    col: 0
    width: 24
    height: 7
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
    explore: sales_orders
    listens_to_filters: []
    field: deliveries.date_created_erdat_date
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
    field: deliveries.division_spart
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
  - name: Currency Required
    title: Currency Required
    type: field_filter
    default_value: "{{ _user_attributes['default_value_currency_required'] }}"
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
