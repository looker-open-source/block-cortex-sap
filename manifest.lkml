constant: CONNECTION_NAME {
  value: "cortex"
  export: override_required
}

constant: GCP_PROJECT {
  value: "stabby-stabby"
  export: override_required
}

constant: REPORTING_DATASET {
  value: "1repo"
  export: override_required
}

constant: CLIENT {
  value: "100"
  export: override_required
}

visualization: {
  id: "report_table"
  label: "Report Table"
  file: "report_table.js"
}
