#########################################################{
# Step 3 of 3 in deriving Reporting and Comparison Groups
# Step 3 - Combine Reporting and Comparison Groups
# This SQL Derived Table (sdt) uses these views:
#     profit_and_loss_01_reporting_fiscal_periods_sdt (aliased below as rep)
#     profit_and_loss_02_comparison_fiscal_periods_sdt (aliased below as comp)
#
# Keys to using this view:
#   - View label is "Reporting vs. Comparison Period"
#   - Fields are hidden by default so must change hidden: property to no to include in an explore
#   - includes references to fields from view profit_and_loss so always join this view to profit_and_loss using an inner join on:
#         glhierarchy, company_code, fiscal_year, fiscal_period
#      Note, the profit_and_loss_fiscal_periods_sdt view already filters to the same Client id so it is not needed in the join.
#
# Purpose:
#   1) Takes user inputs from parameters and filters:
#         profit_and_loss.parameter_display_time_dimension - use either Year, Quarter or Period for timeframes in report
#         profit_and_loss.parameter_compare_to - - compare timeframes selected to either same period(s) last year, most recent period(s) prior or no comparison
#         profit_and_loss.parameter_aggregate - if yes, all timeframes selected will be aggregated into Reporting/Comparison Period else each timeframe selected will be displayed in report
#         profit_and_loss.filter_fiscal_timeframe - select one or more fiscal periods to include in Income Statement report
#
#   2) Using Liquid, builds SQL statement on the fly based on values selected for above parameters
#      and combines "Reporting" and "Comparison" rows using UNION ALL
#
#   3) Derives new dimensions:
#         alignment_group_name -- if parameter_aggregate = 'Yes' assign list of timeframes selected else
#                            derive with MAX([timeframe]) OVER (glhierarchy, company_code, alignment_group)
#
#                            If multiple timeframes selected and Aggregate = 'No', each set of comparisons will be given a unique group number
#                            e.g., if user selects 2024.001 and 2024.002 to compare to same periods last year and Aggregate = 'No', two alignment groups will be defined as:
#                            alignment group 1 = 2024.001 compared to 2023.001 and alignment_group_name = 2024.001
#                            alignment group 2 = 2024.002 compared to 2023.002 and alignment_group_name = 2024.002
#
#                            If multiple timeframes selected and Aggregate = 'Yes', all timeframes will be combined into 1 alignment group.
#                            e.g., if user selects 2024.001 and 2024.002 to compare to same periods last year, two alignment groups with focus_timeframe labels will be defined as:
#                            alignment group 1 = 2024.001 + 2024.002 compared to 2023.001 + 2023.002
#                            and alignment_group_name = 2024.001, 2024.002
#
#        reporting_timeframes_list -- captures the values selected in filter_fiscal_timeframe as a string (e.g., 2024.001, 2024.002, 2024.003)
#        is_partial_timeframe -- Value of true if selected_timeframe (fiscal_year/fiscal_year_quarter) is incomplete else false. Note does not check if fiscal_year_period is incomplete
#        is_partial_timeframe_in_alignment_group -- If any of the timeframes in the alignment_group are incomplete then true else false
#
#   4) Defines reporting measures:
#         reporting_amount
#         comparison_amount
#         difference_value
#         difference_percent
#
##########################################################}

include: "/views/profit_and_loss_0*.view"

view: profit_and_loss_03_selected_fiscal_periods_sdt {
  label: "Reporting vs. Comparison Period"
  fields_hidden_by_default: yes

  derived_table: {
    sql:
      {% assign comparison_type = profit_and_loss.parameter_compare_to._parameter_value %}
      {% assign time_level = profit_and_loss.parameter_display_time_dimension._parameter_value | slice: 0 %}
      {% assign tp_list = _filters['profit_and_loss.filter_fiscal_timeframe'] | sql_quote | remove: '"' | remove: "'" | replace: ",",", " | split: ", " %}
      {% assign tp_list = tp_list | sort | join: ", " %}
      {% assign aggregate = profit_and_loss.parameter_aggregate._parameter_value %}
      {% assign window_alignment = "(PARTITION BY glhierarchy, company_code, alignment_group)" %}
      {% if time_level == "f" %}{% assign time_level_sql = "Fiscal Year Period"%}{%elsif time_level == "q"%}{% assign time_level_sql = "Fiscal Quarter"%}{%elsif time_level == "y" %}{% assign time_level_sql = "Fiscal Year"%}{% else %}{% assign time_level_sql = "None"%}{%endif%}
      {% if aggregate == 'Yes' %}{% assign alignment_group_name_sql = "'" | append: tp_list | append: "'" %}
        {% else %}{% assign alignment_group_name_sql = "MAX(selected_timeframe) OVER (window_alignment)" %}
      {% endif %}
    {% if profit_and_loss.filter_fiscal_timeframe._is_filtered %}
      SELECT  glhierarchy,
              company_code,
              fiscal_year,
              fiscal_period,
              fiscal_year_quarter,
              fiscal_year_period,
              fiscal_reporting_group,
              alignment_group,
              {{alignment_group_name_sql}} AS alignment_group_name,
              selected_timeframe,
              is_partial_timeframe,
              '{{time_level_sql}}' as selected_time_level,
              MAX(is_partial_timeframe) OVER (window_alignment) AS is_partial_timeframe_in_alignment_group,
              MAX(fiscal_year_period) OVER (PARTITION BY glhierarchy, company_code, selected_timeframe) AS max_fiscal_year_period_selected_timeframe,
              '{{tp_list}}' as reporting_timeframes_list
      FROM (
            SELECT
                    glhierarchy,
                    company_code,
                    fiscal_year,
                    fiscal_period,
                    fiscal_year_quarter,
                    fiscal_year_period,
                    fiscal_reporting_group,
                    alignment_group,
                    selected_timeframe,
                    is_partial_timeframe
            FROM ${profit_and_loss_01_reporting_fiscal_periods_sdt.SQL_TABLE_NAME} cur
        {% if comparison_type != 'none'  %}
            UNION ALL
            SELECT
                    glhierarchy,
                    company_code,
                    fiscal_year,
                    fiscal_period,
                    fiscal_year_quarter,
                    fiscal_year_period,
                    fiscal_reporting_group,
                    alignment_group,
                    selected_timeframe,
                    is_partial_timeframe
            FROM ${profit_and_loss_02_comparison_fiscal_periods_sdt.SQL_TABLE_NAME} comp
        {% endif %}
            ) combine
            WINDOW window_alignment AS {{window_alignment}}
    {% else %}
        SELECT
          CAST(NULL AS STRING) AS glhierarchy,
          CAST(NULL AS STRING) AS company_code,
          CAST(NULL AS STRING) AS fiscal_year,
          CAST(NULL AS STRING) AS fiscal_period,
          CAST(NULL AS STRING) AS fiscal_year_quarter,
          CAST(NULL AS STRING) AS fiscal_year_period,
          CAST(NULL AS STRING) AS fiscal_reporting_group,
          CAST(NULL AS STRING) AS alignment_group,
          CAST(NULL AS STRING) AS alignment_group_name,
          CAST(NULL AS STRING) AS selected_timeframe,
          CAST(NULL AS BOOLEAN) AS is_partial_timeframe,
          CAST(NULL AS BOOLEAN) AS is_partial_timeframe_in_alignment_group,
          CAST(NULL AS STRING) AS reporting_timeframes_list
    {% endif %}
      ;;
  }

  dimension: key {
    type: string
    hidden: yes
    primary_key: yes
    sql: CONCAT(${glhierarchy},${company_code},${fiscal_reporting_group},${fiscal_year},${fiscal_period}) ;;
  }

  dimension: glhierarchy {
    type: string
    sql: ${TABLE}.glhierarchy ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.fiscal_period ;;
  }

  dimension: fiscal_year_period {
    type: string
    sql: ${TABLE}.fiscal_year_period ;;
  }

  dimension: selected_timeframe {
    type: string
    hidden: no
    description: "Returns value reflecting either Fiscal Year, Fiscal Year Quarter or Fiscal Year Period as defined by parameter Display Year, Quarter or Period."
    sql:  ${TABLE}.selected_timeframe;;
  }

  dimension: selected_time_level {
    type: string
    hidden: no
    description: "Returns selected value of parameter Display Year, Quarter or Period."
    sql:  ${TABLE}.selected_time_level;;
  }

  dimension: max_fiscal_year_period_selected_timeframe {
    sql: ${TABLE}.max_fiscal_year_period_selected_timeframe ;;
  }

  dimension: reporting_timeframes_list {
    type: string
    hidden: no
    description: "List of fiscal timeframes selected by user with filter Select Fiscal Timeframes. Example lists include 2024.001, 2024.002 or 2023.Q3, 2023.Q4, 2024.Q1"
    sql: ${TABLE}.reporting_timeframes_list ;;
  }

  dimension: reporting_timeframes_list_with_partial_indicator {
    type: string
    hidden: yes
    description: "List of fiscal timeframes selected by user with filter Select Fiscal Timeframes. Example lists include 2024.001, 2024.002 or 2023.Q3, 2023.Q4, 2024.Q1. An '*' is appended to end if one of the timeframes is incomplete."
    sql: CASE WHEN ${is_partial_timeframe_in_alignment_group} THEN CONCAT(${TABLE}.reporting_timeframes_list,'*') ELSE ${TABLE}.reporting_timeframes_list END ;;
  }

  dimension: fiscal_reporting_group {
    type: string
    hidden: no
    description: "Identifies the Reporting or Comparison reporting group. In fiscal reporting, the Reporting group is determined by the values selected in the Select Fiscal Timeframes filter, while the Comparison group is defined by the Compare To parameter, which can be set to either Year Ago or Prior Timeframe."
    sql:  ${TABLE}.fiscal_reporting_group;;
  }

  dimension: alignment_group {
    type: number
    hidden: yes
    sql: ${TABLE}.alignment_group ;;
  }

  dimension: alignment_group_name {
    type: string
    hidden: no
    description: "Name for Grouped Timeframes Included in the same Reporting vs. Comparison set. For example, if Period 2024.001 is to be compared to a Year Ago, the periods 2024.001 and 2023.001 are assigned to same alignment group and given the label 2024.001."
    sql: ${TABLE}.alignment_group_name ;;
    order_by_field: alignment_group
  }

  dimension: alignment_group_name_with_partial_indicator {
    type: string
    hidden: no
    description: "Name for Grouped Timeframes Included in the same Reporting vs. Comparison set. For example, if Period 2024.001 is to be compared to a Year Ago, the periods 2024.001 and 2023.001 are assigned to same alignment group and given the label 2024.001. If a partial Year or Quarter is selected, then an '*' is appended to name"
    # sql: ${TABLE}.alignment_group_name ;;
    sql: CASE WHEN ${is_partial_timeframe_in_alignment_group} THEN CONCAT(${TABLE}.alignment_group_name,'*') ELSE ${TABLE}.alignment_group_name END ;;
    order_by_field: alignment_group
  }

  dimension: is_partial_timeframe {
    type: yesno
    hidden: no
    description: "Selected timeframe of either Fiscal Year or Fiscal Quarter is incomplete. Note, Fiscal Period is not flagged as incomplete."
    sql: ${TABLE}.is_partial_timeframe ;;
  }

  dimension: is_partial_timeframe_in_alignment_group {
    type: yesno
    hidden: no
    description: "At least one timeframe in the Alignment Group is incomplete. Note, Fiscal Period is not flagged as incomplete."
    sql: ${TABLE}.is_partial_timeframe_in_alignment_group ;;
  }

  dimension: selected_timeframe_label {
    type: string
    hidden: yes
    description: "If the timeframe reflects a partial period then an '*' is appended to the timeframe description."
    group_label: "Reporting vs. Comparison Period"
    sql: CASE WHEN ${is_partial_timeframe} THEN CONCAT(${selected_timeframe},"*") ELSE ${selected_timeframe} END ;;
  }

  dimension: selected_timeframe_comparison {
    type: string
    hidden: yes
    sql: case when ${fiscal_reporting_group} = "Comparison" then ${selected_timeframe_label} end ;;
  }

  dimension: selected_timeframe_reporting {
    type: string
    hidden: yes
    sql: case when ${fiscal_reporting_group} = "Reporting" then ${selected_timeframe_label} end ;;
  }

  dimension: fiscal_year_period_comparison {
    type: string
    hidden: yes
    sql: case when ${fiscal_reporting_group} = "Comparison" then ${fiscal_year_period} end ;;
  }

  dimension: fiscal_year_period_reporting {
    type: string
    hidden: yes
    sql: case when ${fiscal_reporting_group} = "Reporting" then ${fiscal_year_period} end ;;
  }

  measure: reporting_amount {
    type: sum_distinct
    hidden: no
    # Label is Reporting Amount by default. If filter_fiscal_timeframe in query and parameter_compare_to = 'none' then leave label blank"
    label: "{% assign compare = profit_and_loss.parameter_compare_to._parameter_value %}{% if profit_and_loss.filter_fiscal_timeframe._in_query and compare == 'none'%} {% else %}Reporting Amount{% endif %}"
    description: "Amount in Global Currency for the Reporting fiscal reporting group."
    sql_distinct_key: ${profit_and_loss.key} ;;
    sql: ${profit_and_loss.amount_in_target_currency} ;;
    filters: [fiscal_reporting_group: "Reporting"]
    value_format_name: decimal_0
    html: @{negative_format} ;;
  }

  measure: comparison_amount {
    type: sum_distinct
    hidden: no
    # Label is Comparison Amount by default. If filter_fiscal_timeframe in query, then Label is Year Ago Amount, Prior Amount or None based on parameter_compare_to
    label: "{% if profit_and_loss.filter_fiscal_timeframe._in_query%}{% assign compare = profit_and_loss.parameter_compare_to._parameter_value %}{% if compare == 'yoy' %}{%assign compare_label = 'Year Ago Amount' %}{%elsif compare == 'prior'%}{%assign compare_label = 'Prior Amount'%}{% else %}{% assign compare_label = 'None' %}{%endif%}{{compare_label}}{%else%}Comparison Amount{%endif%}"
    description: "Amount in Global Currency for the Comparison fiscal reporting group."
    sql_distinct_key: ${profit_and_loss.key} ;;
    sql: {% if profit_and_loss.parameter_compare_to._parameter_value != 'none' %}${profit_and_loss.amount_in_target_currency}{%else%}NULL{%endif%} ;;
    filters: [fiscal_reporting_group: "Comparison"]
    value_format_name: decimal_0
    html: {% if profit_and_loss.parameter_compare_to._parameter_value != 'none' %}@{negative_format}{%else%} {%endif%} ;;
  }

  measure: difference_value {
    type: number
    hidden: no
    label: "Variance Amount"
    description: "Reporting Amount - Comparison Amount"
    sql: {% if profit_and_loss.parameter_compare_to._parameter_value != 'none' %}${reporting_amount} - ${comparison_amount}{%else%}NULL{%endif%} ;;
    value_format_name: decimal_0
    html: {% if profit_and_loss.parameter_compare_to._parameter_value != 'none' %}@{negative_format}{%else%} {%endif%} ;;
  }

  measure: difference_percent {
    type: number
    hidden: no
    label: "Variance %"
    description: "Percent difference between Reporting Amount and Comparison Amount."
    sql: SAFE_DIVIDE( (${reporting_amount} - ${comparison_amount}),ABS(${comparison_amount})) ;;
    value_format_name: percent_1
    html: {% if profit_and_loss.parameter_compare_to._parameter_value != 'none' %}@{negative_format}{%else%} {%endif%} ;;
  }

  measure: any_timeframe_is_partial {
    type: yesno
    hidden: yes
    sql: MAX(${is_partial_timeframe});;
  }

  measure: max_partial_timeframe_reporting {
    type: string
    sql: MAX(CASE WHEN ${fiscal_reporting_group} = 'Reporting' AND ${is_partial_timeframe} THEN ${selected_timeframe} END) ;;
  }

  measure: max_partial_timeframe_comparison {
    type: string
    sql: MAX(CASE WHEN ${fiscal_reporting_group} = 'Comparison' AND ${is_partial_timeframe} THEN ${selected_timeframe} END) ;;
  }

  measure: max_fiscal_period_in_partial_timeframe_reporting {
    type: string
    sql: MAX(CASE WHEN ${fiscal_reporting_group} = 'Reporting' AND ${is_partial_timeframe} THEN ${fiscal_period} END) ;;
  }

  measure: max_fiscal_period_in_partial_timeframe_comparison {
    type: string
    sql: MAX(CASE WHEN ${fiscal_reporting_group} = 'Comparison' THEN ${fiscal_period} END) ;;
  }

# used in Income Statement dashboard; add to a single-value visualization
  measure: title_income_statement {
    type: number
    description: "Add this measure to a single-value visualization. Returns a Summary visualization with Company, Global Currency, Reporting Fiscal Timeframes and Total Net Income."
    hidden: no
    sql: 1 ;;
    html:
      <div  style="font-size:100pct; background-color:rgb((169,169,169,.5); text-align:center; font-family:'google sans' ; line-height: .8; font-color: #808080">
          <a style="font-size:16px;color: black"><b>Income Statement</b></a><br>
          <a style= "font-size:14px;color: black">{{profit_and_loss.company_text._value}}</a><br>
          <a style= "font-size:14px;color: black">Reporting Fiscal Timeframe:   {{reporting_timeframes_list_with_partial_indicator._value}}&nbsp;&nbsp;&nbsp; Net Income: {{profit_and_loss.net_income._rendered_value}}M</a>
          <br>
          <a style= "font-size: 10px; text-align:center;color: black"> Amounts in {{profit_and_loss.target_currency_tcurr}} </a>
       </div>
      ;;
  }

# used in Income Statement dashboard; add to a single-value visualization
  measure: footnote_partial_timeframe {
    type: string
    hidden: no
    description: "Add this measure to a single-value visualization. Returns a footnote indicating if a partial timeframe is included in the report and if so, it's max fiscal period. Should be added to a single value visualization."
    sql: MAX('1') ;;
    html: {% if any_timeframe_is_partial._value == 'Yes' %}{% assign time_level = selected_time_level._value %}{% assign compare_to = profit_and_loss.parameter_compare_to._parameter_value %}
          {% assign note = '*' | append: time_level | append: ' To Date:' %}{% assign reporting_time = max_partial_timeframe_reporting._value %}{% assign reporting_max = ' through period ' | append: max_fiscal_period_in_partial_timeframe_reporting._value %}
          {% assign compare_max = ' through period ' | append: max_fiscal_period_in_partial_timeframe_comparison._value %}
          {% assign reporting_note = ' Reporting ' | append: reporting_time %}
          {% if compare_to == 'none' %}{% assign comparison_note = reporting_max %}
            {% elsif compare_to == 'yoy' or time_level == 'Fiscal Year' %}{% assign comparison_note = ' & Year Ago comparison through period ' | append: reporting_max %}
            {% elsif compare_to == 'prior' and time_level != 'Fiscal Year' %}{% assign comparison_note = reporting_max | append: ' & Comparison ' | append: max_partial_timeframe_comparison._value | append: ' through period ' | append: compare_max %}
            {% else %}{% assign comparison_note = ' '%}
          {% endif %}
            <div style="font-size:11px; text-align:left; font-family:'verdana'; line-height: 2; font-color: #808080">
            <a>{{note}}{{reporting_note}}{{comparison_note}}</a><br>
          {% else %} {%endif%}
          ;;
  }

}
