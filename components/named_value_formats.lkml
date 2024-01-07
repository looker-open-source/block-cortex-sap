named_value_format: format_large_numbers_d1 {
  value_format: "[>=1000000000]0.0,,,\"B\";[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
  strict_value_format: yes
}

named_value_format: format_large_numbers_d2 {
  value_format: "[>=1000000000]0.00,,,\"B\";[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"
}


named_value_format: millions_d1 {
  value_format: "#,##0.00,,;-#,##0.00,,"
}

named_value_format: millions_d1_m {
  value_format: "#,##0.00,,\"M\";-#,##0.00,,\"M\""
}
