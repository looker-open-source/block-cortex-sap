- dashboard: sap_finance_sa_08_a_spend_by_top_vendors
  title: "Spend Analysis by Top Vendors"
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
      vendor_performance.item_ebelp, vendor_performance.material_description, vendor_performance.material_type_description,
      vendor_performance.purchase_doc_date_date, vendor_performance.poquantity_menge,
      vendor_performance.uo_m_meins, vendor_performance.net_order_valuein_pocurrency_netwr,
      vendor_performance.currency_key_waers, vendor_performance.net_order_valuein_target_currency_netwr,
      vendor_performance.target_currency_tcurr, vendor_performance.invoice_amount_in_target_currency,
      vendor_performance.exchange_rate_ukurs, vendor_performance.invoice_amount_in_source_currency]
    sorts: [vendor_performance.purchase_doc_date_date desc]
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
    column_order: ["$$$_row_numbers_$$$", vendor_performance.company_text_butxt, vendor_performance.purchasing_organization_text_ekotx,
      vendor_performance.purchasing_group_text_eknam, vendor_performance.country_key_land1,
      vendor_performance.name1, vendor_performance.vendor_account_number_lifnr, vendor_performance.document_number_ebeln,
      vendor_performance.item_ebelp, vendor_performance.material_type_description,
      vendor_performance.material_description, vendor_performance.purchase_doc_date_date,
      vendor_performance.poquantity_menge, vendor_performance.uo_m_meins, vendor_performance.currency_key_waers,
      vendor_performance.net_order_valuein_pocurrency_netwr, vendor_performance.invoice_amount_in_source_currency,
      vendor_performance.target_currency_tcurr, vendor_performance.net_order_valuein_target_currency_netwr,
      vendor_performance.invoice_amount_in_target_currency, vendor_performance.exchange_rate_ukurs]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      vendor_performance.company_text_butxt: Company Code
      vendor_performance.purchasing_group_text_eknam: Purchasing Group
      vendor_performance.purchasing_organization_text_ekotx: Purchasing Organization
      vendor_performance.vendor_account_number_lifnr: Vendor Number
      vendor_performance.document_number_ebeln: Purchase Order
      vendor_performance.item_ebelp: Purchase Order Item
      vendor_performance.material_description: Material
      vendor_performance.material_type_description: Material Type
      vendor_performance.purchase_doc_date_date: Purchase Document Date
      vendor_performance.poquantity_menge: PO Quantity
      vendor_performance.uo_m_meins: PO Unit
      vendor_performance.currency_key_waers: PO Currency
      vendor_performance.net_order_valuein_pocurrency_netwr: PO Amount
      vendor_performance.net_order_valuein_target_currency_netwr: PO Amount (TC)
      vendor_performance.target_currency_tcurr: Target Currency
      vendor_performance.invoice_amount_in_target_currency: Total Spend (TC)
      vendor_performance.exchange_rate_ukurs: Exchange Rate
      vendor_performance.invoice_amount_in_source_currency: Total Spend
    series_column_widths:
      vendor_performance.purchasing_organization_text_ekotx: 134
      vendor_performance.purchasing_group_text_eknam: 112
      vendor_performance.country_key_land1: 82
      vendor_performance.name1: 215
      vendor_performance.vendor_account_number_lifnr: 89
      vendor_performance.document_number_ebeln: 95
      vendor_performance.item_ebelp: 102
      vendor_performance.material_type_description: 118
      vendor_performance.material_description: 159
      vendor_performance.purchase_doc_date_date: 109
    series_value_format:
      vendor_performance.invoice_amount_in_source_currency: "#,##0.00"
      vendor_performance.invoice_amount_in_target_currency: "#,##0.00"
      vendor_performance.net_order_valuein_target_currency_netwr: "#,##0.00"
      vendor_performance.net_order_valuein_pocurrency_netwr: "#,##0.00"
    truncate_column_names: false
    defaults_version: 1
    series_types: {}
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Vendor Number: vendor_performance.vendor_account_number_lifnr
      Target Currency: vendor_performance.target_currency_tcurr
      Material Type: vendor_performance.material_type_description
      Material: vendor_performance.material_description
    row: 6
    col: 0
    width: 24
    height: 6
  - title: Spend by Top Vendors Trend
    name: Spend by Top Vendors Trend
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_line
    fields: [vendor_performance.Invoice_date_month, vendor_performance.name1, vendor_performance.sum_invoice_amount_in_target_currency]
    pivots: [vendor_performance.name1]
    fill_fields: [vendor_performance.Invoice_date_month]
    sorts: [vendor_performance.name1 desc, vendor_performance.Invoice_date_month desc]
    limit: 500
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Total Spend, orientation: left, series: [{axisId: vendor_performance.sum_invoice_amount_in_target_currency,
            id: CYMBAL Third party vendor for Japan - vendor_performance.sum_invoice_amount_in_target_currency,
            name: CYMBAL Third party vendor for Japan}, {axisId: vendor_performance.sum_invoice_amount_in_target_currency,
            id: CYMBAL Third party vendor for Germa - vendor_performance.sum_invoice_amount_in_target_currency,
            name: CYMBAL Third party vendor for Germa}, {axisId: vendor_performance.sum_invoice_amount_in_target_currency,
            id: CYMBAL Third party vendor for Canad - vendor_performance.sum_invoice_amount_in_target_currency,
            name: CYMBAL Third party vendor for Canad}, {axisId: vendor_performance.sum_invoice_amount_in_target_currency,
            id: CYMBAL Third party vendor - vendor_performance.sum_invoice_amount_in_target_currency,
            name: CYMBAL Third party vendor}, {axisId: vendor_performance.sum_invoice_amount_in_target_currency,
            id: Canada Vendor for Operating supplie - vendor_performance.sum_invoice_amount_in_target_currency,
            name: Canada Vendor for Operating supplie}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '10'
    series_types: {}
    label_color: [grey]
    x_axis_datetime_label: "%m/%y"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Monthly distribution of total spend by top vendors in the target currency
      during the invoice date range selected
    listen:
      Company Code: vendor_performance.company_text_butxt
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Vendor Country: vendor_performance.country_key_land1
      Vendor Name: vendor_performance.name1
      Invoice Date: vendor_performance.Invoice_date_date
      Vendor Number: vendor_performance.vendor_account_number_lifnr
      Target Currency: vendor_performance.target_currency_tcurr
      Material Type: vendor_performance.material_type_description
      Material: vendor_performance.material_description
    row: 0
    col: 7
    width: 17
    height: 6
  - title: Spend by Top Vendors
    name: Spend by Top Vendors
    model: cortex_sap_operational
    explore: vendor_performance
    type: looker_bar
    fields: [vendor_performance.name1, vendor_performance.sum_invoice_amount_in_target_currency]
    sorts: [vendor_performance.sum_invoice_amount_in_target_currency desc 0]
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
    y_axes: [{label: Total Spend, orientation: bottom, series: [{axisId: vendor_performance.sum_invoice_amount_in_target_currency,
            id: vendor_performance.sum_invoice_amount_in_target_currency, name: Sum
              Invoice Amount In Target Currency}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    font_size: '10'
    series_types: {}
    series_colors:
      vendor_performance.sum_invoice_amount_in_target_currency: "#7CB342"
    label_color: [grey]
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Distribution of total spend by top vendors in the target currency during
      the invoice date range selected
    listen:
      Invoice Date: vendor_performance.Invoice_date_date
      Company Code: vendor_performance.company_text_butxt
      Purchasing Group: vendor_performance.purchasing_group_text_eknam
      Purchasing Organization: vendor_performance.purchasing_organization_text_ekotx
      Vendor Name: vendor_performance.name1
      Vendor Country: vendor_performance.country_key_land1
      Vendor Number: vendor_performance.vendor_account_number_lifnr
      Target Currency: vendor_performance.target_currency_tcurr
      Material Type: vendor_performance.material_type_description
      Material: vendor_performance.material_description
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
    listens_to_filters: [Purchasing Organization, Company Code]
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
    listens_to_filters: [Purchasing Group, Company Code]
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
    listens_to_filters: [Vendor Country, Company Code]
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
    listens_to_filters: [Company Code]
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
    listens_to_filters: []
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
    listens_to_filters: []
    field: vendor_performance.material_description
