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
  - title: OTIF%
    name: OTIF%
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.OTIFPercentage]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count_2, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {measure: count_of_otif, based_on: data_intelligence_otc.otif, expression: '',
        label: Count of Otif, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count_3, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {category: table_calculation, label: Percent of Data Intelligence Otc Count,
        value_format: !!null '', value_format_name: percent_1, calculation_type: percent_of_column_sum,
        table_calculation: percent_of_data_intelligence_otc_count_1, args: [data_intelligence_otc.count],
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {measure: count_of_delivery,
        based_on: data_intelligence_otc.delivery, expression: '', label: Count of
          Delivery, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {category: table_calculation, label: Percent of  Count of Delivery, value_format: !!null '',
        value_format_name: percent_1, calculation_type: percent_of_column_sum, table_calculation: percent_of_count_of_delivery,
        args: [count_of_delivery], _kind_hint: measure, _type_hint: number, is_disabled: true}]
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
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Product: data_intelligence_otc.product
      Region: data_intelligence_otc.country
      Currency Required: data_intelligence_otc.Currency_Required
      Year: data_intelligence_otc.creation_date_year
    row: 4
    col: 12
    width: 6
    height: 5
  - title: On Time, In Full & OTIF
    name: On Time, In Full & OTIF
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_line
    fields: [data_intelligence_otc.count_on_time_delivery, data_intelligence_otc.count_in_full_delivery,
      data_intelligence_otc.count_otif, data_intelligence_otc.creation_date_month,
      count_of_delivery]
    fill_fields: [data_intelligence_otc.creation_date_month]
    filters:
      data_intelligence_otc.creation_date_month: 3 months
    sorts: [data_intelligence_otc.creation_date_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_delivery, based_on: data_intelligence_otc.delivery,
        expression: '', label: Count of Delivery, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: "${data_intelligence_otc.count_on_time_delivery}/${count_of_delivery}",
        label: On Time %, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: on_time, _type_hint: number}, {category: table_calculation,
        expression: "${data_intelligence_otc.count_in_full_delivery}/${count_of_delivery}",
        label: In Full %, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: in_full, _type_hint: number}, {category: table_calculation,
        expression: "${data_intelligence_otc.count_otif}/${count_of_delivery}", label: OTIF
          %, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: otif, _type_hint: number}]
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
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: on_time, id: on_time,
            name: On Time %}, {axisId: in_full, id: in_full, name: In Full %}, {axisId: otif,
            id: otif, name: OTIF %}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    series_types: {}
    series_colors:
      data_intelligence_otc.count_on_time_delivery: "#7CC8FA"
      data_intelligence_otc.count_in_full_delivery: "#F29ED2"
      data_intelligence_otc.count_otif: "#FCCF41"
      otif: "#F29ED2"
    series_labels:
      data_intelligence_otc.count_on_time_delivery: On Time
      data_intelligence_otc.count_in_full_delivery: In Full
      data_intelligence_otc.count_otif: OTIF
    series_point_styles:
      data_intelligence_otc.count_otif: auto
    defaults_version: 1
    hidden_fields: [data_intelligence_otc.count_on_time_delivery, data_intelligence_otc.count_in_full_delivery,
      data_intelligence_otc.count_otif, count_of_delivery]
    listen:
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Product: data_intelligence_otc.product
      Region: data_intelligence_otc.country
      Currency Required: data_intelligence_otc.Currency_Required
      Year: data_intelligence_otc.creation_date_year
    row: 11
    col: 0
    width: 24
    height: 7
  - title: Avg Order To Delivery Cycle Time
    name: Avg Order To Delivery Cycle Time
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: looker_column
    fields: [data_intelligence_otc.product, average_of_order_cycle_time_in_days]
    filters:
      data_intelligence_otc.order_cycle_time_in_days: NOT NULL
    sorts: [data_intelligence_otc.product]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Average of Order Cycle
          Time In Days, value_format: '0.00', value_format_name: !!null '', based_on: data_intelligence_otc.order_cycle_time_in_days,
        _kind_hint: measure, measure: average_of_order_cycle_time_in_days, type: average,
        _type_hint: average}]
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
    y_axes: [{label: Avg Order Cycle Time(days), orientation: left, series: [{axisId: average_of_order_cycle_time_in_days,
            id: average_of_order_cycle_time_in_days, name: Average of Order Cycle
              Time In Days}], showLabels: true, showValues: true, valueFormat: '0',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Product: data_intelligence_otc.product
      Region: data_intelligence_otc.country
      Currency Required: data_intelligence_otc.Currency_Required
      Year: data_intelligence_otc.creation_date_year
    row: 18
    col: 0
    width: 24
    height: 7
  - title: In Full%
    name: In Full%
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.InFullPercentage]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {category: table_calculation, label: In Full %, value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_of_column_sum, table_calculation: in_full, args: [
          data_intelligence_otc.count], _kind_hint: measure, _type_hint: number, is_disabled: true},
      {measure: count_of_delivery, based_on: data_intelligence_otc.delivery, expression: '',
        label: Count of Delivery, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {category: table_calculation, label: In Full%, value_format: !!null '', value_format_name: percent_0,
        calculation_type: percent_of_column_sum, table_calculation: in_full_1, args: [
          count_of_delivery], _kind_hint: measure, _type_hint: number, is_disabled: true}]
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
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Product: data_intelligence_otc.product
      Region: data_intelligence_otc.country
      Currency Required: data_intelligence_otc.Currency_Required
      Year: data_intelligence_otc.creation_date_year
    row: 4
    col: 6
    width: 6
    height: 5
  - title: On Time%
    name: On Time%
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.OnTimePercentage]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {category: table_calculation, label: Percentage of Column, value_format: !!null '',
        value_format_name: percent_1, calculation_type: percent_of_column_sum, table_calculation: percentage_of_column,
        args: [data_intelligence_otc.count_on_time_delivery], _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {category: table_calculation, label: On
          Time %, value_format: !!null '', value_format_name: percent_1, calculation_type: percent_of_column_sum,
        table_calculation: on_time, args: [data_intelligence_otc.count], _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {measure: count_of_delivery, based_on: data_intelligence_otc.delivery,
        expression: '', label: Count of Delivery, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, label: Percent of  Count
          of Delivery, value_format: !!null '', value_format_name: percent_1, calculation_type: percent_of_column_sum,
        table_calculation: percent_of_count_of_delivery, args: [count_of_delivery],
        _kind_hint: measure, _type_hint: number, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    arm_length: 9
    arm_weight: 48
    spinner_length: 153
    spinner_weight: 25
    target_length: 10
    target_gap: 10
    target_weight: 25
    range_min: 0
    range_max:
    value_label_type: value
    value_label_font: 12
    value_label_padding: 45
    target_source: 'off'
    target_label_type: nolabel
    target_label_font: 3
    label_font_size: 3
    range_formatting: '0'
    spinner_type: needle
    fill_color: "#0092E5"
    background_color: "#CECECE"
    spinner_color: "#282828"
    range_color: "#ffffff"
    gauge_fill_type: segment
    fill_colors: ["#EE7772", "#ffed6f", "#7FCDAE"]
    viz_trellis_by: none
    trellis_rows: 2
    trellis_cols: 2
    angle: 90
    cutout: 30
    range_x: 1
    range_y: 1
    target_label_padding: 1.06
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
      Distribution Channel: data_intelligence_otc.distribution_channel
      Division: data_intelligence_otc.division
      Sales Org: data_intelligence_otc.sales_org
      Product: data_intelligence_otc.product
      Region: data_intelligence_otc.country
      Currency Required: data_intelligence_otc.Currency_Required
      Year: data_intelligence_otc.creation_date_year
    row: 4
    col: 0
    width: 6
    height: 5
  - name: ' <a href="/dashboards/cortex_sap_operational::delivery_performance?">Delivery Performance</a>'
    type: text
    title_text: ' <a href="/dashboards/cortex_sap_operational::delivery_performance?">Delivery
      Performance</a>'
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 2
  - title: Late Delivery %
    name: Late Delivery %
    model: cortex_sap_operational
    explore: data_intelligence_otc
    type: single_value
    fields: [data_intelligence_otc.LateDeliveryPercentage]
    limit: 500
    column_limit: 50
    dynamic_fields: [{args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count_2, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {measure: count_of_otif, based_on: data_intelligence_otc.otif, expression: '',
        label: Count of Otif, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {args: [data_intelligence_otc.count], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: data_intelligence_otc.count, label: Percent
          of Data Intelligence Otc Count, source_field: data_intelligence_otc.count,
        table_calculation: percent_of_data_intelligence_otc_count_3, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true},
      {category: table_calculation, label: Percent of Data Intelligence Otc Count,
        value_format: !!null '', value_format_name: percent_1, calculation_type: percent_of_column_sum,
        table_calculation: percent_of_data_intelligence_otc_count_1, args: [data_intelligence_otc.count],
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {measure: count_of_delivery,
        based_on: data_intelligence_otc.delivery, expression: '', label: Count of
          Delivery, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {category: table_calculation, label: Percent of  Late Deliveries, value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_of_column_sum, table_calculation: percent_of_late_deliveries,
        args: [count_of_delivery], _kind_hint: measure, _type_hint: number, is_disabled: true}]
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
      Region: data_intelligence_otc.country
      Currency Required: data_intelligence_otc.Currency_Required
      Year: data_intelligence_otc.creation_date_year
    row: 4
    col: 18
    width: 6
    height: 5
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
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_otc
    listens_to_filters: []
    field: data_intelligence_otc.product
  - name: Currency Required
    title: Currency Required
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