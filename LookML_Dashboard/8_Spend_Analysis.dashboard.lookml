- dashboard: spend_analysis
  title: "[SAP SPEND ANALYSIS] 08: Spend Analysis"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: nduljjI5gByUjzwTT99hBL
  elements:
  - title: Active Vendors
    name: Active Vendors
    model: cortex_sap_operational
    explore: vendor_performance
    type: single_value
    fields: [vendor_performance.Active_Vendor_1]
    limit: 500
    dynamic_fields: [{measure: count_of_vendor_account_number_lifnr, based_on: vendor_performance.vendor_account_number_lifnr,
        expression: '', label: Count of Vendor Account Number Lifnr, type: count_distinct,
        _kind_hint: measure, _type_hint: number, id: Slp0sg3lDL}]
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Count of vendors with invoices cleared during the invoice date range
      selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Cleared Invoices
    name: Cleared Invoices
    model: cortex_sap_operational
    explore: vendor_performance
    type: single_value
    fields: [vendor_performance.invoice_count]
    limit: 500
    dynamic_fields: [{measure: sum_of_invoice_amount_in_source_currency, based_on: vendor_performance.invoice_amount_in_source_currency,
        expression: '', label: Sum of Invoice Amount In Source Currency, type: sum,
        _kind_hint: measure, _type_hint: number, id: C0LHmUs3NJ}, {measure: sum_of_invoice_amount_in_target_currency,
        based_on: vendor_performance.invoice_amount_in_target_currency, expression: '',
        label: Sum of Invoice Amount In Target Currency, type: sum, _kind_hint: measure,
        _type_hint: number, id: pp8P3n4JXd}]
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
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Count of invoices cleared during the invoice date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 2
    col: 16
    width: 8
    height: 2
  - title: Total Spend
    name: Total Spend
    model: cortex_sap_operational
    explore: vendor_performance
    type: single_value
    fields: [vendor_performance.total_spend_global_curr]
    limit: 500
    dynamic_fields: [{measure: sum_of_amount_in_local_currency_dmbtr, based_on: vendor_performance.amount_in_local_currency_dmbtr,
        expression: '', label: Sum of Amount In Local Currency Dmbtr, type: sum, _kind_hint: measure,
        _type_hint: number, id: SjXDTbdlNW}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: "#,##0.0,, \\M"
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Total amount of all invoices cleared in the target currency during
      the invoice date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 2
    col: 0
    width: 8
    height: 2
  - title: Spend by Purchasing Organization
    name: Spend by Purchasing Organization
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_pie
    fields: [vendor_performance.purchasing_organization_text_ekotx, vendor_performance.sum_spend_by_purchase_org_global_curr]
    sorts: [vendor_performance.sum_spend_by_purchase_org_global_curr desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    start_angle: 18
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Distribution of total spend by purchasing organization during the invoice
      date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 5
    col: 0
    width: 8
    height: 5
  - title: Spend by Purchasing Group
    name: Spend by Purchasing Group
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_pie
    fields: [vendor_performance.purchasing_group_text_eknam, vendor_performance.sum_spend_by_purchase_grp_global_curr]
    sorts: [vendor_performance.sum_spend_by_purchase_grp_global_curr desc 0]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 45
    start_angle: 18
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Distribution of total spend by purchasing group during the invoice
      date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 5
    col: 16
    width: 8
    height: 5
  - title: Spend by Vendor Country
    name: Spend by Vendor Country
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_pie
    fields: [vendor_performance.country_key_land1, vendor_performance.sum_spend_by_country_global_curr]
    filters: {}
    sorts: [vendor_performance.sum_spend_by_country_global_curr desc 0]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    start_angle: 18
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: c65a64ce-7f46-476b-a320-41345941e5b1
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Distribution of total spend by vendor country during the invoice date
      range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 11
    col: 8
    width: 8
    height: 5
  - title: Total Spend Trend
    name: Total Spend Trend
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_area
    fields: [vendor_performance.Invoice_date_month, vendor_performance.sum_spend_by_month_global_currency]
    fill_fields: [vendor_performance.Invoice_date_month]
    filters:
      material_types_md.language_key_spras: E
    sorts: [vendor_performance.Invoice_date_month]
    limit: 500
    dynamic_fields: [{measure: sum_of_amount_in_local_currency_dmbtr, based_on: vendor_performance.amount_in_local_currency_dmbtr,
        expression: '', label: Sum of Amount In Local Currency Dmbtr, type: sum, _kind_hint: measure,
        _type_hint: number, id: TVppvr21qh}]
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
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Total Spend, orientation: left, series: [{axisId: vendor_performance.sum_spend_by_month_global_currency,
            id: vendor_performance.sum_spend_by_month_global_currency, name: Sum Spend
              By Month Global Currency}], showLabels: true, showValues: true, maxValue: !!null '',
        minValue: !!null '', valueFormat: '', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 19, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors: {}
    series_point_styles:
      vendor_performance.sum_spend_by_month: diamond
    label_color: ["#80868B"]
    x_axis_datetime_label: "%m/%y"
    x_axis_label_rotation: -75
    discontinuous_nulls: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Total spend in the target currency by month during the invoice date
      range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 5
    col: 8
    width: 8
    height: 5
  - title: Spend by Top  Vendors
    name: Spend by Top  Vendors
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_bar
    fields: [vendor_performance.name1, vendor_performance.sum_spend_by_vendor_globalcurr]
    filters:
      material_types_md.language_key_spras: E
    sorts: [vendor_performance.sum_spend_by_vendor_globalcurr desc 0]
    limit: 500
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
    note_state: collapsed
    note_display: hover
    note_text: Distribution of total spend by top vendors in the target currency during
      the invoice date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Target Currency: currency_conversion_new.tcurr
    row: 11
    col: 16
    width: 8
    height: 5
  - title: Spend by Material Type
    name: Spend by Material Type
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_column
    fields: [material_types_md.description_of_material_type_mtbez, vendor_performance.sum_spend_by_material_type_global_curr]
    filters:
      material_types_md.language_key_spras: E
    sorts: [vendor_performance.sum_spend_by_material_type_global_curr desc 0]
    limit: 500
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
    y_axes: [{label: Total Spend, orientation: left, series: [{axisId: vendor_performance.sum_spend_by_material_type_global_curr,
            id: vendor_performance.sum_spend_by_material_type_global_curr, name: Sum
              Spend By Material Type Global Curr}], showLabels: true, showValues: true,
        valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Material Type
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    label_value_format: ''
    series_types: {}
    series_colors: {}
    label_color: ["#80868B"]
    x_axis_label_rotation: 0
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: Total spend by top material types in the target currency during the
      invoice date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Target Currency: currency_conversion_new.tcurr
      Invoice Date: vendor_performance.Invoice_date_date
    row: 11
    col: 0
    width: 8
    height: 5
  - name: ''
    type: text
    title_text: ''
    subtitle_text: <font color="#c1c1c1">What is my spend by organization, by group
      and by month?</font>
    body_text: ''
    row: 4
    col: 0
    width: 24
    height: 1
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: <font color="#c1c1c1">Where am I spending the most, with who and
      for what?</font>
    body_text: ''
    row: 10
    col: 0
    width: 24
    height: 1
  - name: Key Spend Analysis Indicators
    type: text
    title_text: Key Spend Analysis Indicators
    subtitle_text: <font color="#c1c1c1">What is my current vendor spend position?</font>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
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
