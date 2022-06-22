- dashboard: accounts_receivable
  title: "[SAP OTC AR] 06: Accounts Receivable"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Account Receivable by Company
    name: Account Receivable by Company
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_pie
    fields: [data_intelligence_ar.Company_Name, data_intelligence_ar.Sum_of_Receivables]
    filters: {}
    sorts: [data_intelligence_ar.Company_Name]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Total Receivable,
        value_format: '0.00,"K"', value_format_name: !!null '', based_on: data_intelligence_ar.Accounts_Receivable_Local_Currency,
        _kind_hint: measure, measure: total_receivable, type: sum, _type_hint: sum},
      {category: measure, expression: '', label: Total Receivable, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_ar.Accounts_Receivable_Global_Currency,
        _kind_hint: measure, measure: total_receivable_1, type: sum, _type_hint: sum}]
    value_labels: legend
    label_type: labVal
    inner_radius: 45
    start_angle: 3
    end_angle: 2
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors:
      CYMBAL US01 US EAST: "#FDEC85"
      CYMBAL CA-CANADA: "#ACE9F5"
      Cymbal: "#AEC8C1"
      CYMBAL EU-GERMANY: "#FD9577"
      CYMBAL US02 US WEST: "#7CC8FA"
      CYMBAL JP JAPAN: "#C8A7F9"
    series_labels: {}
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
    font_size: 12
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
    hidden_fields: []
    hidden_points_if_no: []
    up_color: false
    down_color: false
    total_color: false
    show_null_points: true
    interpolation: linear
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 9
    col: 0
    width: 12
    height: 8
  - title: Overdue Receivable by Days
    name: Overdue Receivable by Days
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_pie
    fields: [data_intelligence_ar.Past_Due_Interval, data_intelligence_ar.OverDue_Amount]
    filters:
      data_intelligence_ar.Key_Date: 2022/03/31
      data_intelligence_ar.Past_Due_Interval: "-Due after Key Date"
    sorts: [data_intelligence_ar.Past_Due_Interval desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Overdue Amount, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_ar.Open_and_Over_Due_Local_Currency,
        _kind_hint: measure, measure: overdue_amount, type: sum, _type_hint: sum},
      {category: measure, expression: '', label: Overdue Amount, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_ar.Open_and_Over_Due_Global_Currency,
        _kind_hint: measure, measure: overdue_amount_1, type: sum, _type_hint: sum}]
    value_labels: legend
    label_type: labVal
    inner_radius: 45
    start_angle: 6
    end_angle: 2
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      custom:
        id: 0a00f0dc-dd8d-977f-c6fa-2c229818a106
        label: Custom
        type: discrete
        colors:
        - "#A5EF55"
        - "#7CC8FA"
        - "#f56776"
        - "#10C871"
        - "#FD9577"
        - "#9E7FD0"
        - "#AEC8C1"
        - "#ACE9F5"
        - "#A5EF55"
        - "#C8A7F9"
        - "#F29ED2"
        - "#ACE9F5"
      options:
        steps: 5
        reverse: true
    series_colors: {}
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
    font_size: 12
    show_null_points: true
    interpolation: linear
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 9
    col: 12
    width: 12
    height: 8
  - title: Total Receivable
    name: Total Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Total_Receivables]
    filters: {}
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
    single_value_title: Total Receivable
    value_format: ''
    value_labels: legend
    label_type: labPer
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
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 4
    col: 0
    width: 6
    height: 3
  - title: Total Overdue Receivable
    name: Total Overdue Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Sum_of_Open_and_Over_Due_Local_Currency]
    filters: {}
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
    single_value_title: ''
    value_format: ''
    value_labels: legend
    label_type: labPer
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
    note_state: collapsed
    note_display: above
    note_text: Past Due Date
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 4
    col: 6
    width: 6
    height: 3
  - title: ''
    name: ''
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_line
    fields: [data_intelligence_ar.Posting_month, data_intelligence_ar.Sum_of_Receivables,
      data_intelligence_ar.Sum_of_Sales]
    fill_fields: [data_intelligence_ar.Posting_month]
    filters:
      data_intelligence_ar.Posting_month: 3 months
    sorts: [data_intelligence_ar.Posting_month desc]
    limit: 500
    dynamic_fields: [{category: measure, expression: '', label: Total Receivable,
        value_format: '', value_format_name: !!null '', based_on: data_intelligence_ar.Accounts_Receivable_Global_Currency,
        _kind_hint: measure, measure: total_receivable, type: sum, _type_hint: number},
      {category: measure, expression: '', label: Total Sales, value_format: '', value_format_name: !!null '',
        based_on: data_intelligence_ar.Sales_Global_Currency, _kind_hint: measure,
        measure: total_sales, type: sum, _type_hint: number}]
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: data_intelligence_ar.Sum_of_Receivables,
            id: data_intelligence_ar.Sum_of_Receivables, name: Sum of Receivables},
          {axisId: data_intelligence_ar.Sum_of_Sales, id: data_intelligence_ar.Sum_of_Sales,
            name: Sum of Sales}], showLabels: true, showValues: true, valueFormat: '0.00,,"M"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    hidden_series: []
    hide_legend: false
    label_value_format: 0.00,"K"
    series_types: {}
    series_colors:
      total_receivable: "#f56776"
      total_sales: "#A5EF55"
    series_labels:
      sum_of_accounts_receivable_local_currency: Account Receivables
      sum_of_sales_local_currency: Sales
    x_axis_datetime_label: "%b %Y"
    swap_axes: false
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 19
    col: 0
    width: 24
    height: 9
  - title: Total Doubtful Receivable
    name: Total Doubtful Receivable
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Total_Doubtful_Receivables]
    filters: {}
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
    value_format: ''
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Greater than 90 Days
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 4
    col: 18
    width: 6
    height: 3
  - title: Avg Day Sales Outstanding
    name: Avg Day Sales Outstanding
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Total_DSO]
    filters: {}
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
    value_format: ''
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
    hidden_fields:
    defaults_version: 1
    series_types: {}
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 4
    col: 12
    width: 6
    height: 3
  - name: Key Account Receivable Indicators
    type: text
    title_text: Key Account Receivable Indicators
    subtitle_text: <font color="#c1c1c1">How much are we owed?</font>
    body_text: ''
    row: 2
    col: 0
    width: 24
    height: 2
  - name: 'Account Receivable Breakdown '
    type: text
    title_text: 'Account Receivable Breakdown '
    subtitle_text: <font color="#c1c1c1"></font>
    body_text: ''
    row: 7
    col: 0
    width: 12
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: <font color="#c1c1c1">Who are my top debtors ?</font>
    body_text: ''
    row: 28
    col: 0
    width: 24
    height: 2
  - title: Top 5 Overdue Receivable Amount by Sold to Party
    name: Top 5 Overdue Receivable Amount by Sold to Party
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: looker_column
    fields: [data_intelligence_ar.Past_Due_Interval, data_intelligence_ar.Sold_to_Party_Name,
      data_intelligence_ar.OverDue_Amount]
    pivots: [data_intelligence_ar.Past_Due_Interval]
    filters:
      data_intelligence_ar.Key_Date: 2022/03/31
      data_intelligence_ar.Past_Due_Interval: "-Due after Key Date"
    sorts: [data_intelligence_ar.Past_Due_Interval, data_intelligence_ar.OverDue_Amount
        desc 4]
    limit: 500
    row_total: right
    dynamic_fields: [{category: measure, expression: '', label: Overdue Amount, value_format: '0.00,"K"',
        value_format_name: !!null '', based_on: data_intelligence_ar.Open_and_Over_Due_Local_Currency,
        _kind_hint: measure, measure: overdue_amount, type: sum, _type_hint: sum}]
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
    stacking: normal
    limit_displayed_rows: true
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    y_axes: [{label: Overdue Amount, orientation: left, series: [{axisId: "> 30 Days\
              \ - overdue_amount", id: "> 30 Days - overdue_amount", name: "> 30 Days"},
          {axisId: 1- 10 Days - overdue_amount, id: 1- 10 Days - overdue_amount, name: 1-
              10 Days}, {axisId: 11-20 Days - overdue_amount, id: 11-20 Days - overdue_amount,
            name: 11-20 Days}, {axisId: 21-30 Days - overdue_amount, id: 21-30 Days
              - overdue_amount, name: 21-30 Days}], showLabels: true, showValues: true,
        valueFormat: '0,"K"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Sold to Party Name
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    hidden_series: [Row Total - sum_of_open_and_over_due_local_currency]
    label_value_format: 0.00,,"M"
    series_types: {}
    series_colors:
      "> 30 Days - overdue_amount": "#FDEC85"
      1- 10 Days - overdue_amount: "#ACE9F5"
      11-20 Days - overdue_amount: "#7CC8FA"
      21-30 Days - overdue_amount: "#A5EF55"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 30
    col: 0
    width: 24
    height: 10
  - name: Sales Vs Receivable
    type: text
    title_text: Sales Vs Receivable
    subtitle_text: <font color="#c1c1c1">How well are we collecting receivables? </font>
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 2
  - name: Overdue Receivable Breakdown
    type: text
    title_text: Overdue Receivable Breakdown
    subtitle_text: ''
    body_text: ''
    row: 7
    col: 12
    width: 12
    height: 2
  - title: Current Date
    name: Current Date
    model: cortex_sap_operational
    explore: data_intelligence_ar
    type: single_value
    fields: [data_intelligence_ar.Current_Date]
    fill_fields: [data_intelligence_ar.Current_Date]
    sorts: [data_intelligence_ar.Current_Date desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size_main: '10'
    orientation: auto
    style_data_intelligence_ar.Current_Date: "#3A4245"
    show_title_data_intelligence_ar.Current_Date: true
    title_placement_data_intelligence_ar.Current_Date: above
    value_format_data_intelligence_ar.Current_Date: mm-dd-yyyy
    single_value_title: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    listen:
      DSO Period: data_intelligence_ar.Day_Sales_Outstanding
      Currency: data_intelligence_ar.Currency_Required
      Company: data_intelligence_ar.Company_Name
      Overdue Receivable Interval: data_intelligence_ar.Aging_Interval
      'Sold to Party ': data_intelligence_ar.Sold_to_Party_Name
    row: 0
    col: 19
    width: 5
    height: 2
  filters:
  - name: Company
    title: Company
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Company_Name
  - name: 'Sold to Party '
    title: 'Sold to Party '
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Sold_to_Party_Name
  - name: DSO Period
    title: DSO Period
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Day_Sales_Outstanding
  - name: Overdue Receivable Interval
    title: Overdue Receivable Interval
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options:
      - '30'
      - '20'
      - '10'
    model: cortex_sap_operational
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Aging_Interval
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
    explore: data_intelligence_ar
    listens_to_filters: []
    field: data_intelligence_ar.Currency_Required