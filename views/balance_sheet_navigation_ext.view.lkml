#########################################################{
# PURPOSE
# Dynamically generates html links (including filters) to supports navigation between
# related Balance Sheet Subtotal Dashboards: With Comparisons and No Comparisons.
#
# SOURCE
# Extends View navigation_template
#
# REFERENCED BY
# Explore balance_sheet
# Dashboards:
#   - Subtotal Table With Comparisons (balance_sheet_subtotal3_table)
#   - Subtotal Table Without Comparisons (balance_sheet_subtotal3_table_no_comparison)
#   - Note, Marketplace dashboard handles no comparisons cleanly so no additonal dashboard needed
#
# CUSTOMIZATIONS
# While the navigation_template provides much of the logic needed, customizations for Balance Sheet
# are required.
#   1. dash_bindings -- added dashboard name and link text for each dashboard
#       dashboard name                                link text
#       ---------------                               ---------------
#       balance_sheet_subtotal3_table                 With Comparisons
#       balance_sheet_subtotal3_table_no_comparison   No Comparisons
#
#   2. filter_bindings -- added 7 filters and corresponding URL values
#       filter      label                           URL format
#       -------     ---------------                 ---------------------
#       filter1     Fiscal Period                   Fiscal+Period
#       filter2     Global Currency                 Global+Currency
#       filter3     Hierarchy                       Hierarchy
#       filter4     Chart of Accounts               Chart+of+Accounts
#       filter5     Company Code                    Company+Code
#       filter6     Ledger Name                     Ledger+Name
#       filter7     Top Hierarchy Level             Top+Hierarchy+Level
#
#       tip: to find URL formats copy url for dashboard and review list of parameters after
#          [dashboard name]?
#
#   3. filter1 to filter7 filters: added labels as indicated above (NOTE: can optionally unhide)
#   4. navigation_focus_page: confirmed allowed values of 1 or 2
#   5. added group_label = "Navigation" for parameters exposed in the Explore
#
# HOW TO USE FOR NAVIGATION
#   1. Add to an Explore using a bare join
#         explore: balance_sheet {
#         join: balance_sheet_navigation_ext {
#           view_label: "🔍 Filters & 🛠 Tools"
#           relationship: one_to_one
#           sql:  ;;
#           }}
#
#   2. Add Navigation dimension to Single Value Visualization and set these paramaters accordingly
#         Navigation Style = Hyperlinks - Left Aligned - No Border - Small font (or if using lookml, = small)
#         Navigation Focus Page = 1 (if adding to first dashboard listed, set to 2 if added viz to second dashboard)
#
#   3. Add Navigation visualization to dashboard and set viz to listen to the dashboard filters
#
#      Below is example Dashboard LookML generated:
#     - title: navigation
#       name: navigation
#       explore: balance_sheet
#       type: single_value
#       fields: [balance_sheet_navigation_ext.navigation]
#       filters:
#         balance_sheet_navigation_ext.navigation_focus_page: '1'
#         balance_sheet_navigation_ext.navigation_style: 'small'
#       show_single_value_title: false
#       show_comparison: false
#       listen:
#         Fiscal Period: balance_sheet_navigation_ext.filter1
#         Global Currency: balance_sheet_navigation_ext.filter2
#         Hierarchy: balance_sheet_navigation_ext.filter3
#         Chart of Accounts: balance_sheet_navigation_ext.filter4
#         Company Code: balance_sheet_navigation_ext.filter5
#         Ledger Name: balance_sheet_navigation_ext.filter6
#         Top Hierarchy Level: balance_sheet_navigation_ext.filter7
#########################################################}


include: "/views/navigation_template.view"

view: balance_sheet_navigation_ext {
  extends: [navigation_template]

  dimension: dash_bindings {
    hidden: yes
    type: string
    sql: 'balance_sheet_subtotal3_table|With Comparisons||balance_sheet_subtotal3_table_no_comparison|No Comparisons' ;;
  }

  dimension: filter_bindings {
    hidden: yes
    type: string
    # sql: 'filter1|Display+Timeframe' ;;
    sql: 'filter1|Fiscal+Period||filter2|Global+Currency||filter3|Hierarchy||filter4|Chart+of+Accounts||filter5|Company+Code||filter6|Ledger+Name||filter7|Top+Hierarchy+Level' ;;
  }

  parameter: navigation_focus_page {
    hidden: no
    type: unquoted
    group_label: "Navigation"
    allowed_value: {value:"1"}
    allowed_value: {value:"2"}
    default_value: "1"
  }

  parameter: navigation_style {
    hidden: no
    group_label: "Navigation"
  }

  filter: filter1 {
    hidden: yes
    type: string
    label: "Fiscal Period"
  }

  filter: filter2 {
    hidden: yes
    type: string
    label: "Global Currency"
  }

  filter: filter3 {
    hidden: yes
    type: string
    label: "Hierarchy"
  }

  filter: filter4 {
    hidden: yes
    type: string
    label: "Chart of Accounts"
  }

  filter: filter5 {
    hidden: yes
    type: string
    label: "Company Code"
  }

  filter: filter6 {
    hidden: yes
    type: string
    label: "Ledger Name"
  }

  filter: filter7 {
    hidden: yes
    type: string
    label: "Top Hierarchy Level"
  }


}
