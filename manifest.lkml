constant: CONNECTION_NAME {
  value: "cortex"
  export: override_required
}

constant: GCP_PROJECT {
  value: "GCP Project Name"
  export: override_required
}

constant: REPORTING_DATASET {
  value: "Reporting Dataset Name"
  export: override_required
}

constant: CLIENT {
  value: "Client ID"
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


#} end additional constants
