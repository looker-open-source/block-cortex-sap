datagroup: balance_sheet_node_count {
  sql_trigger:
  SELECT COUNT(0)
  FROM (
       SELECT
          Client,
          ChartOfAccounts,
          HierarchyName,
          Level,
          Node
        FROM
          `@{GCP_PROJECT}.@{REPORTING_DATASET}.BalanceSheet`
        GROUP BY
          1, 2, 3, 4, 5) t ;;

  description: "Triggered when the Number of Distinct Client, Chart of Accounts, HierarchyName, Level and Nodes changes"
}

datagroup: monthly_on_day_1 {
  sql_trigger: select EXTRACT(MONTH from CURRENT_DATE) ;;
  description: "Triggers on first day of the month"
}

datagroup: profit_and_loss_node_count {
  sql_trigger:
  SELECT COUNT(0)
  FROM (
       SELECT
          Client,
          ChartOfAccounts,
          GLHierarchy,
          GLLevel,
          GLNode
        FROM
          `@{GCP_PROJECT}.@{REPORTING_DATASET}.ProfitAndLoss`
        GROUP BY
          1, 2, 3, 4, 5) t ;;

  description: "Triggered when the Number of Distinct Client, Chart of Accounts, GLHierarchy, GLLevel and GLNodes changes"
}
