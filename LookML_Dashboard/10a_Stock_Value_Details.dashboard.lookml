- dashboard: stock_value_details
  title: "Inventory Stock Value Details"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: FfppWWxWhHUQLrsiDEUVRu
  elements:
  - title: Inventory Value by Plant
    name: Inventory Value by Plant
    model: cortex_sap_operational
    explore: inventory_by_plant
    type: looker_column
    fields: [inventory_by_plant.plant_name_name2, inventory_by_plant.sum_inventory_value_target_currency_for_plant]
    filters:
      inventory_by_plant.week_end_date: today
    sorts: [inventory_by_plant.sum_inventory_value_target_currency_for_plant desc
        0]
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
    y_axes: [{label: Inventory Value, orientation: left, series: [{axisId: inventory_by_plant.sum_stock_value,
            id: inventory_by_plant.sum_stock_value, name: Sum Stock Value}], showLabels: true,
        showValues: true, maxValue: !!null '', minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Plant
    x_axis_zoom: true
    y_axis_zoom: true
    label_value_format: ''
    series_types: {}
    series_colors: {}
    label_color: [grey]
    show_dropoff: false
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
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: []
    listen:
      Material Type: inventory_by_plant.description_of_material_type_mtbez
      Stock Type: inventory_by_plant.stock_characteristic
      Country: inventory_by_plant.country_key_land1
      Plant: inventory_by_plant.plant_name_name2
      Material: inventory_by_plant.material_text_maktx
      Currency: inventory_by_plant.target_currency
      Company Name: inventory_by_plant.company_text_butxt
    row: 0
    col: 0
    width: 24
    height: 6
  - title: Stock Value Detailed Report
    name: Stock Value Detailed Report
    model: cortex_sap_operational
    explore: inventory_by_plant
    type: looker_grid
    fields: [inventory_by_plant.plant_name_name2, inventory_by_plant.material_text_maktx,
      inventory_by_plant.storage_location_text_lgobe, inventory_by_plant.batch_number_charg,
      inventory_by_plant.base_unit_of_measure_meins, inventory_by_plant.inventory_value,
      inventory_by_plant.currency_key_waers, inventory_by_plant.description_of_material_type_mtbez,
      inventory_by_plant.quantity_menge, inventory_by_plant.stock_characteristic,
      inventory_by_plant.inventory_value_target_currency, inventory_by_plant.exchange_rate,
      inventory_by_plant.target_currency, inventory_by_plant.company_text_butxt]
    filters:
      inventory_by_plant.week_end_date: today
    sorts: [inventory_by_plant.plant_name_name2]
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
    column_order: ["$$$_row_numbers_$$$", inventory_by_plant.company_text_butxt, inventory_by_plant.plant_name_name2,
      inventory_by_plant.storage_location_text_lgobe, inventory_by_plant.description_of_material_type_mtbez,
      inventory_by_plant.material_text_maktx, inventory_by_plant.batch_number_charg,
      inventory_by_plant.stock_characteristic, inventory_by_plant.quantity_menge,
      inventory_by_plant.base_unit_of_measure_meins, inventory_by_plant.inventory_value,
      inventory_by_plant.currency_key_waers, inventory_by_plant.inventory_value_target_currency,
      inventory_by_plant.target_currency, inventory_by_plant.exchange_rate]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      inventory_by_plant.plant_name_name2: Plant
      inventory_by_plant.material_number_matnr: Material Numbers
      inventory_by_plant.material_text_maktx: Material
      inventory_by_plant.material_group_matkl: Material Group
      inventory_by_plant.material_type_mtart: Material Type
      inventory_by_plant.storage_location_text_lgobe: Storage Location
      inventory_by_plant.stock_characteristic: Stock Type
      inventory_by_plant.quantity_menge: Stock Quantity
      inventory_by_plant.inventory_value: Stock Value
      inventory_by_plant.currency_key_waers: Currency
      inventory_by_plant.country_key_land1: Plant Country
      inventory_by_plant.description_of_material_type_mtbez: Material Type
      inventory_by_plant.cal_year: Fiscal Year
      inventory_by_plant.material_group_description: Material Group
      inventory_by_plant.inventory_value_global_currency: Stock Value Global Currency
      currency_conversion_new.ukurs: Exchange Rate
      currency_conversion_new.tcurr: Global Currency
      inventory_by_plant.batch_number_charg: Batch
      inventory_by_plant.inventory_value_target_currency: Stock Value Target Currency
    series_column_widths: {}
    series_value_format:
      inventory_by_plant.cal_year:
        name: id
        format_string: '0'
        label: ID
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen:
      Country: inventory_by_plant.country_key_land1
      Plant: inventory_by_plant.plant_name_name2
      Material: inventory_by_plant.material_text_maktx
      Material Type: inventory_by_plant.description_of_material_type_mtbez
      Stock Type: inventory_by_plant.stock_characteristic
      Currency: inventory_by_plant.target_currency
      Company Name: inventory_by_plant.company_text_butxt
    row: 6
    col: 0
    width: 24
    height: 9
  filters:
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
    explore: inventory_by_plant
    listens_to_filters: []
    field: inventory_by_plant.target_currency
  - name: Company Name
    title: Company Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cortex_sap_operational
    explore: inventory_by_plant
    listens_to_filters: [Country, Plant, Stock Type, Material Type, Material]
    field: inventory_by_plant.company_text_butxt
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: inventory_by_plant
    listens_to_filters: [Company Name, Plant, Stock Type, Material Type, Material]
    field: inventory_by_plant.country_key_land1
  - name: Plant
    title: Plant
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: inventory_by_plant
    listens_to_filters: [Company Name, Country, Stock Type, Material Type, Material]
    field: inventory_by_plant.plant_name_name2
  - name: Stock Type
    title: Stock Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: inventory_by_plant
    listens_to_filters: [Company Name, Country, Plant, Material Type, Material]
    field: inventory_by_plant.stock_characteristic
  - name: Material Type
    title: Material Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: inventory_by_plant
    listens_to_filters: [Company Name, Country, Plant, Stock Type, Material]
    field: inventory_by_plant.description_of_material_type_mtbez
  - name: Material
    title: Material
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: cortex_sap_operational
    explore: inventory_by_plant
    listens_to_filters: [Company Name, Country, Plant, Stock Type, Material Type]
    field: inventory_by_plant.material_text_maktx
