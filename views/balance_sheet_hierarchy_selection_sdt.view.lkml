#########################################################
# This SQL Derived Table (sdt):
#   1) Takes user inputs from parameters:
#          parameter_pick_start_level - select top level of hierarchy to show
#          parameter_pick_depth_level - how many levels should be shown (1 to 5 levels)
#   2) Derives node_text and node values for hier1 to hier5 by placing the top level selected by user into hier_1 and subsequent levels into hier2 to hier5
#   3) Filters to the last level selected by user. For example, if Top Level to Display of 2 and a depth of 3 is selected:
#         level = 5
#         derived as: 0 (start) + 3 (depth) + 2 (adjustment because minimum level possible = 2)
#
# If more than 5 hierarchy levels are needed, update the parameter_pick_depth_level and add additional hierN dimensions for node and node_text
#
#########################################################

include: "/views/balance_sheet_path_to_node_pdt.view"
view: balance_sheet_hierarchy_selection_sdt {
    derived_table: {
      sql:
          {% assign start = parameter_pick_start_level._parameter_value | times: 1 | minus: 2 %}
          {% assign depth = parameter_pick_depth_level._parameter_value | times: 1 | minus: 1 %}
          select
            h.Client,
            h.ChartOfAccounts,
            h.HierarchyName,
            LanguageKey_SPRAS,
            LevelNumber,
            LevelSequenceNumber,
            Node,
            NodeText,
            NodeTextPath_String,
            NodePath_String,
            NodeTextPath[SAFE_OFFSET({{start}})] AS hier1_node_text,
            NodeTextPath[SAFE_OFFSET({{start | plus: 1}})] AS hier2_node_text,
            NodeTextPath[SAFE_OFFSET({{start | plus: 2}})] AS hier3_node_text,
            NodeTextPath[SAFE_OFFSET({{start | plus: 3}})] AS hier4_node_text,
            NodeTextPath[SAFE_OFFSET({{start | plus: 4}})] AS hier5_node_text,
            NodePath[SAFE_OFFSET({{start}})] AS hier1_node,
            NodePath[SAFE_OFFSET({{start | plus: 1}})] AS hier2_node,
            NodePath[SAFE_OFFSET({{start | plus: 2}})] AS hier3_node,
            NodePath[SAFE_OFFSET({{start | plus: 3}})] AS hier4_node,
            NodePath[SAFE_OFFSET({{start | plus: 4}})] AS hier5_node
        from ${balance_sheet_path_to_node_pdt.SQL_TABLE_NAME} h
        where
        --filter to ending level as start + depth + 2 (add 2 as minimum level is 2)
        --cap at Max Number of Levels if requested depth exceeds
        LevelNumber = least({{start}} + {{depth}} + 2,MaxLevelNumber)
        ;;
    }

    label: "Balance Sheet"
    fields_hidden_by_default: yes

    parameter: parameter_pick_start_level {
      hidden: no
      type: unquoted
      view_label: "🗓 Pick Fiscal Periods"
      label: "Select Top Hierarchy Level to Display"
      suggest_explore: balance_sheet
      suggest_dimension: balance_sheet.level_string
      default_value: "2"
    }

    parameter: parameter_pick_depth_level {
      hidden: no
      type: unquoted
      view_label: "🗓 Pick Fiscal Periods"
      label: "Select Number of Hierarchy Levels to Display"
      description: "Select number of hierarchy levels (1 to 5) to display"
      allowed_value: {value: "1"}
      allowed_value: {value: "2"}
      allowed_value: {value: "3"}
      allowed_value: {value: "4"}
      allowed_value: {value: "5"}
      default_value: "3"
    }

    dimension: key {
      hidden: yes
      type: string
      primary_key: yes
      sql: concat(${client_mandt},${hierarchy_name},${chart_of_accounts},${language_key_spras},${node}) ;;
    }

    dimension: client_mandt {
      type: string
      sql: ${TABLE}.client ;;
    }

    dimension: chart_of_accounts {
      type: string
      sql: ${TABLE}.ChartOfAccounts ;;
    }

    dimension: hierarchy_name {
      type: string
      sql: ${TABLE}.HierarchyName ;;
    }

    dimension: language_key_spras {
      type: string
      sql: ${TABLE}.LanguageKey_SPRAS ;;
    }

    dimension: level_number {
      type: number
      sql: ${TABLE}.LevelNumber ;;
    }

    dimension: node {
      type: string
      sql: ${TABLE}.node ;;
    }

    dimension: node_text {
      type: string
      sql: ${TABLE}.NodeText ;;
    }

    dimension: node_text_path_string {
      hidden: no
      type: string
      sql: ${TABLE}.NodeTextPath_String ;;
    }

    dimension: node_path_string {
      hidden: no
      type: string
      sql: ${TABLE}.NodePath_String ;;
    }

    dimension: hier1_node_text {
      hidden: no
      type: string
      sql: ${TABLE}.hier1_node_text ;;
      order_by_field: hier1_node
    }

    dimension: hier2_node_text {
      hidden: no
      type: string
      sql: ${TABLE}.hier2_node_text ;;
      order_by_field: hier2_node
    }

    dimension: hier3_node_text {
      hidden: no
      type: string
      sql: ${TABLE}.hier3_node_text ;;
      order_by_field: hier3_node
    }

    dimension: hier4_node_text {
      hidden: no
      type: string
      sql: ${TABLE}.hier4_node_text ;;
      order_by_field: hier4_node
    }

    dimension: hier5_node_text {
      hidden: no
      type: string
      sql: ${TABLE}.hier5_node_text ;;
      order_by_field: hier5_node
    }

    dimension: hier1_node {
      hidden: no
      description: "First level of hierarchy to display"
      type: string
      sql: ${TABLE}.hier1_node ;;
    }

    dimension: hier2_node {
      hidden: no
      description: "Second level of hierarchy to display"
      type: string
      sql: ${TABLE}.hier2_node ;;
    }

    dimension: hier3_node {
      hidden: no
      description: "Third level of hierarchy to display"
      type: string
      sql: ${TABLE}.hier3_node ;;
    }

    dimension: hier4_node {
      hidden: no
      description: "Fourth level of hierarchy to display"
      type: string
      sql: ${TABLE}.hier4_node ;;
    }

    dimension: hier5_node {
      hidden: no
      description: "Fifth level of hierarchy to display"
      type: string
      sql: ${TABLE}.hier5_node ;;
    }

  }
