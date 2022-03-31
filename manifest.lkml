constant: CONNECTION_NAME {
  value: "kittycorn_infy_reporting"
  export: override_required
}

constant: DATASET {
  value: "kittycorn-dev-infy.DATA_INTELLIGENCE_OTC"
  export: override_required
}

constant: DATASET1 {
  value: "kittycorn-dev-infy.DATA_INTELLIGENCE_FIN"
  export: override_required
}


visualization: {
  id: "radial_gauge"
  label: "Radial Gauge"
  file: "Visualization/radialgauge_v2.js"
}

constant: CLIENT {
  value: "050"
  export: override_required
}
