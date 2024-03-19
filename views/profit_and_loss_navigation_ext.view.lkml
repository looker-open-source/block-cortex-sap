#########################################################{
# Extends and modifies navigation_template to support navigation between
# related Income Statement Dashboards: With Comparisons and No Comparisons
#
# Two sets of LookML dashboards are included:
#   - Marketplace Report Table With Comparisons (income_statement_mktplace_report_table)
#     and Without Comparisons (income_statement_mktplace_report_table_no_comparisons)
#   - Subtotal Table With Comparisons (income_statement_subtotal_table)
#     and Without Comparisons (income_statement_subtotal_table_no_comparisons)
#
# Because of these two sets of dashboards ADDED a parameter navigation_which_dashboard_style
# to dynamically derive LookML dashboard name based on parameter setting
#
# Other customizations:
#   dash_bindings: added dashboard and link names
#   filter_bindings: added 8 filters and corresponding URL values
#     filter      label                           URL format
#     -------     ---------------                 ---------------------
#     filter1     Hierarchy                       Hierarchy
#     filter2     Display Timeframe               Display+Timeframe
#     filter3     Select Fiscal Timeframe         Select+Fiscal+Timeframe
#     filter4     Global Currency                 Global+Currency
#     filter5     Company                         Company
#     filter6     Ledger Name                     Ledger+Name
#     filter7     Top Hierarchy Level to Display  Top+Hierarchy+Level+to+Display
#     filter8     Combine Selected Timeframes?    Combine+Selected+Timeframes%3F
#
#     tip: to find URL formats copy url for dashboard and review list of parameters after
#          [dashboard name]?
#
#   filter1 to filter8 filters: added labels as indicated above (NOTE: can optionally unhide)
#   navigation_focus_page: confirmed allowed values of 1 or 2
#   added group_label = "Navigation" for parameters exposed in the Explore
#
# To use this view:
#   1) Add to an explore using a bare join
#         explore: profit_and_loss {
#         join: profit_and_loss_navigation_ext {
#           view_label: "🔍 Filters & 🛠 Tools"
#           relationship: one_to_one
#           sql:  ;;
#           }}
#
#   2) Add Navigation to Single Value Visualization and set these paramaters accordingly
#         Navigation Style = small
#         Navigation Focus Page = 1 (if adding to first dashboard listed, set to 2 if added viz to second dashboard)
#         Which Dashboard Style? = subtotal (if adding to one of the subtotal dashboards)
#
#   3) Add Navigation visualization to a dashboard and set to map to listen to the dashboard filters
#
#      Below is example Dashboard LookML generated:
#     - title: navigation
#       name: navigation
#       explore: profit_and_loss
#       type: single_value
#       fields: [profit_and_loss_navigation_ext.navigation]
#       filters:
#         profit_and_loss_navigation_ext.navigation_focus_page: '1'
#         profit_and_loss_navigation_ext.navigation_style: 'small'
#         profit_and_loss_navigation_ext.navigation_which_dashboard_style: 'subtotal'
#       show_single_value_title: false
#       show_comparison: false
#       listen:
#         Hierarchy: profit_and_loss_navigation_ext.filter1
#         Display Timeframe: profit_and_loss_navigation_ext.filter2
#         Select Fiscal Timeframe: profit_and_loss_navigation_ext.filter3
#         Global Currency: profit_and_loss_navigation_ext.filter4
#         Company: profit_and_loss_navigation_ext.filter5
#         Ledger Name: profit_and_loss_navigation_ext.filter6
#         Top Hierarchy Level to Display: profit_and_loss_navigation_ext.filter7
#         Combine Selected Timeframes?: profit_and_loss_navigation_ext.filter8
#########################################################}


include: "/views/navigation_template.view"

view: profit_and_loss_navigation_ext {
  extends: [navigation_template]

  dimension: dash_bindings {
    hidden: yes
    type: string
    sql: 'income_statement_{% parameter navigation_which_dashboard_style %}_table|With Comparisons||income_statement_{% parameter navigation_which_dashboard_style %}_table_no_comparison|No Comparisons' ;;
  }

  parameter: navigation_which_dashboard_style {
    type: unquoted
    group_label: "Navigation"
    label: "Which Dashboard Style to Use?"
    description: "Pick one of the two possible dashboards styles defined for Income Statement: Table with Subtotals or Report Table from Marketplace"
    allowed_value: {label:"Marketplace Table (Report)" value:"mktplace_report"}
    allowed_value: {label: "Subtotal Table" value:"subtotal" }
    default_value: "subtotal"
  }

  dimension: filter_bindings {
    hidden: yes
    type: string
    # sql: 'filter1|Display+Timeframe' ;;
    sql: 'filter1|Hierarchy||filter2|Display+Timeframe||filter3|Select+Fiscal+Timeframe||filter4|Global+Currency||filter5|Company||filter6|Ledger+Name||filter7|Top+Hierarchy+Level||filter8|Combine+Selected+Timeframes%3F' ;;
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
    label: "Hierarchy"
  }

  filter: filter2 {
    hidden: yes
    type: string
    label: "Display Timeframe"
  }

  filter: filter3 {
    hidden: yes
    type: string
    label: "Select Fiscal Timeframe"
  }

  filter: filter4 {
    hidden: yes
    type: string
    label: "Global Currency"
  }

  filter: filter5 {
    hidden: yes
    type: string
    label: "Company"
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

  filter: filter8 {
    hidden: yes
    type: string
    label: "Combine Selected Timeframes?"
  }



}
