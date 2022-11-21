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

constant: big_numbers {
  value: "<a href=\"#drillmenu\" target=\"_self\">
  {% if value > 1000000000 %}
    {{ value | divided_by: 1000000000 | round:2 }}B
  {% elsif value >= 1000000 and value < 1000000000 %}
   {{ value | divided_by: 1000000 | round:2 }}M
  {% elsif value >= 1000 and value < 1000000 %}
    {{ value | divided_by: 1000 | round:2 }}K
  {% elsif value >= 0 and value < 1000 %}
    {{ value | round:2 }}
  {% elsif value > -1000 and value < 0 %}
    -{{ value | round:2 | times: -1 }}
  {% elsif value > -1000000 and value <= -1000 %}
    -{{ value | divided_by: -1000 | round:2 }}K
  {% elsif value > -1000000000 and value <= -1000000 %}
    -{{ value | divided_by: -1000000 | round:2 }}M
  {% elsif value <= -1000000000 %}
    -{{ value | divided_by: -1000000000 | round:2 }}B
  {% else %}
    'fail'
  {% endif %}
  </a>"
}
