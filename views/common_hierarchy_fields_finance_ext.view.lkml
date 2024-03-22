#########################################################{
# PURPOSE
# Defines hierarchy-related dimensions and parameters to be EXTENDED into:
#   balance_sheet_hierarchy_selection_sdt
#   profit_and_loss_hierarchy_selection_sdt
#
# The properties from this view are used and customized by extending views.
#
# SOURCE
#   none. The ${TABLE} property uses the table definition of the extending view
#
# EXTENDABLE FIELDS
#   parameter_pick_start_level, parameter_pick_depth_level
#   node_text_path_string, node_path_string
#   hier1_node_text to hier5_node_text
#   hier1_node to hier5_node (used as order by fields for hierN_node_text dimension)
#########################################################}

view: common_hierarchy_fields_finance_ext {
  extension: required

  parameter: parameter_pick_start_level {
    hidden: no
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    label: "Select Top Hierarchy Level to Display"
    description: "Specify the initial hierarchy level to be displayed. If the value is 3, the first three columns of the report will represent child hierarchy levels 3, 4, and 5. If the value is 6, the first three columns will represent levels 6, 7, 8."
    # update suggest_explore and dimension after extending
    # suggest_explore: balance_sheet
    # suggest_dimension: balance_sheet.level_string
    default_value: "2"
  }

  parameter: parameter_pick_depth_level {
    hidden: no
    type: unquoted
    view_label: "🔍 Filters & 🛠 Tools"
    label: "Select Number of Hierarchy Levels to Display"
    description: "Select number of hierarchy levels (1 to 5) to display"
    allowed_value: {value: "1"}
    allowed_value: {value: "2"}
    allowed_value: {value: "3"}
    allowed_value: {value: "4"}
    allowed_value: {value: "5"}
    default_value: "3"
  }

  dimension: node_text_path_string {
    hidden: no
    type: string
    group_label: "Hierarchy Paths to Node"
    label: "Full Hierarchy Path"
    sql: ${TABLE}.NodeTextPath_String ;;
  }

  dimension: node_path_string {
    hidden: yes
    type: string
    group_label: "Hierarchy Paths to Node"
    label: "Full Hierarchy Path (code)"
    sql: ${TABLE}.NodePath_String ;;
  }

  dimension: hier1_node_text {
    hidden: no
    type: string
    group_label: "Hierarchy Paths to Node"
    label: "Hierarchy Node 1"
    description: "Node (text) for 1st Hierarchy Level as set with the parameter 'Select Top Hierarchy Level to Display'"
    sql: ${TABLE}.hier1_node_text ;;
    order_by_field: hier1_node
  }

  dimension: hier2_node_text {
    hidden: no
    type: string
    group_label: "Hierarchy Paths to Node"
    label: "Hierarchy Node 2"
    description: "Node (text) for 2nd Hierarchy Level as set with the parameter 'Select Top Hierarchy Level to Display'"
    sql: COALESCE(${TABLE}.hier2_node_text,' ') ;;
    # sql: COALESCE(${TABLE}.hier2_node_text,${TABLE}.hier1_node_text) ;;
    order_by_field: hier2_node
  }

  dimension: hier3_node_text {
    hidden: no
    type: string
    group_label: "Hierarchy Paths to Node"
    label: "Hierarchy Node 3"
    description: "Node (text) for 3rd Hierarchy Level as set with the parameter 'Select Top Hierarchy Level to Display'"
    sql: COALESCE(${TABLE}.hier3_node_text,' ') ;;
    # sql: COALESCE(${TABLE}.hier3_node_text,${TABLE}.hier2_node_text) ;;
    order_by_field: hier3_node
  }

  dimension: hier4_node_text {
    hidden: no
    type: string
    group_label: "Hierarchy Paths to Node"
    label: "Hierarchy Node 4"
    description: "Node (text) for 4th Hierarchy Level as set with the parameter 'Select Top Hierarchy Level to Display'"
    sql: COALESCE(${TABLE}.hier4_node_text, ' ') ;;
    order_by_field: hier4_node
  }

  dimension: hier5_node_text {
    hidden: no
    type: string
    group_label: "Hierarchy Paths to Node"
    label: "Hierarchy Node 5"
    description: "Node (text) for 5th Hierarchy Level as set with the parameter 'Select Top Hierarchy Level to Display'"
    sql: COALESCE(${TABLE}.hier5_node_text,' ') ;;
    order_by_field: hier5_node
  }

  dimension: hier1_node {
    hidden: yes
    type: string
    sql: UPPER(${TABLE}.hier1_node) ;;
  }

  dimension: hier2_node {
    hidden: yes
    type: string
    sql: UPPER(COALESCE(${TABLE}.hier2_node,'ZZZZ')) ;;
  }

  dimension: hier3_node {
    hidden: yes
    type: string
    sql: UPPER(COALESCE(${TABLE}.hier3_node,'ZZZZ')) ;;
  }

  dimension: hier4_node {
    hidden: yes
    type: string
    sql: UPPER(COALESCE(${TABLE}.hier4_node,'ZZZZ') ;;
  }

  dimension: hier5_node {
    hidden: yes
    type: string
    sql: UPPER(COALESCE(${TABLE}.hier5_node),'ZZZZ') ;;
  }
}
