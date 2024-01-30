datagroup: balance_sheet_node_count {
  sql_trigger:
  SELECT count(0)
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
