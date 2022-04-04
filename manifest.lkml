constant: CONNECTION_NAME {
  value: "Looker connection name" 
  export: override_required
}

constant: DATASET {
  value: "Order to Cash Dataset Name"
  export: override_required
}

constant: DATASET1 {
  value: "Finance Dataset Name"
  export: override_required
}

constant: DATASETFUNCTION {
  value: "Function Dataset Name"
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
