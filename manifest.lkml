constant: CONNECTION_NAME {
  value: "poc-cortex-aurora"
  export: override_required
}

constant: GCP_PROJECT {
  value: "poc-sap-cortex-400818"
  export: override_required
}

constant: REPORTING_DATASET {
  value: "REPORTING"
  export: override_required
}

constant: CLIENT {
  value: "400"
  export: override_required
}

#############################
# Additional Constants used for formatting and other logic
#{

# to show negative values in red, at this constant to the html: parameter
# For example:
#         measure: profit {
#            type: number
#            sql: ${total_sales} - ${total_cost} ;;
#            html: @{negative_format} ;;
#         }

constant: negative_format {
  value: "{% if value < 0 %}<p style='color:red;'>{{rendered_value}}</p>{% else %} {{rendered_value}} {% endif %}"
}

# enter the max number of fiscal periods in a fiscal year.
# used to derive previous previous period when 1st period is selected
constant: max_fiscal_period {
  value: "12"
  export: override_optional
}

# comparison period derived based on select_comparison_type parameter:
#     if yoy then subtract year from period
#     if prior then subtract 1 from period (if period = 01 or 001 then substract 1 year and use max_fiscal_period for period)
#     if custom then use value from select_custom_comparison_period
#     if none use ''
constant: derive_comparison_period {
  value: "{% assign comparison_type = select_comparison_type._parameter_value %}
          {% assign fp = select_fiscal_period._parameter_value %}
          {% assign cp = select_custom_comparison_period._parameter_value %}
          {% assign max_fp_size = '@{max_fiscal_period}' | remove_first: '0' | size | times: 1 %}
          {% assign max_fp_size_neg = max_fp_size | times: -1 %}
          {% assign pad = '' %}
          {% for i in (1..max_fp_size) %}
              {% assign pad = pad | append: '0' %}
          {% endfor %}
          {% if comparison_type == 'custom' %}
               {% if fp == cp %}{% assign comparison_type = 'none' %}
               {% elsif cp == '' %}{% assign comparison_type = 'yoy' %}
               {% endif %}
          {% endif %}

        {% if comparison_type == 'prior' or comparison_type == 'yoy' %}
            {% assign p_array = fp | split: '.' %}
                {% if comparison_type == 'prior' %}
                    {% if p_array[1] == '001' or p_array[1] == '01' %}
                        {% assign m = '@{max_fiscal_period}' %}{% assign sub_yr = 1 %}
                    {% else %}
                        {% assign m = p_array[1] | times: 1 | minus: 1 | prepend: pad | slice: max_fp_size_neg, max_fp_size %}{% assign sub_yr = 0 %}
                    {% endif %}
                {% else %}
                  {% assign m = p_array[1] %}{% assign sub_yr = 1 %}
                {% endif %}
            {% assign yr = p_array[0] | times: 1 | minus: sub_yr %}
            {% assign cp =  yr | append: '.'| append: m %}
        {% elsif comparison_type == 'none' %} {% assign cp = '' %}
        {% endif %}"
}

#} end additional constants
