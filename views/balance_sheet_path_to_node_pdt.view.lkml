#########################################################
# this Persistent Derived Table (pdt) derives the full path to a node (e.g., Assets/Current Assets/Cash & Equivalents)
#
# Uses RECURSIVE to navigate the parent-child relationships and derive the full path
# This view is only referenced in the view balance_sheet_hierarchy_selection_sdt
#########################################################

view: balance_sheet_path_to_node_pdt {
  derived_table: {
    datagroup_trigger: balance_sheet_node_count
    create_process: {
      sql_step:

      CREATE OR REPLACE TABLE ${SQL_TABLE_NAME} as
      WITH
        RECURSIVE n AS (
        SELECT
          Client,
          ChartOfAccounts,
          HierarchyName,
          LanguageKey_SPRAS,
          CAST(Level AS INT64) AS LevelNumber,
          Parent,
          COALESCE(REGEXP_REPLACE(ParentText,'Non[- ]Current','Noncurrent'),Parent) AS ParentText,
          Node,
          COALESCE(REGEXP_REPLACE(NodeText,'Non[- ]Current','Noncurrent'),Node) AS NodeText
        FROM
          `@{GCP_PROJECT}.@{REPORTING_DATASET}.BalanceSheet`
        GROUP BY
          1, 2, 3, 4, 5, 6, 7, 8, 9 ),
        iterations AS (
        SELECT
          Client,
          ChartOfAccounts,
          HierarchyName,
          LanguageKey_SPRAS,
          LevelNumber,
          Node,
          NodeText,
          Parent,
          ParentText,
          0 AS LevelSequenceNumber,
          nodeText AS NodeTextPath_String,
          Node AS NodePath_String
        FROM
          n
        WHERE
          LevelNumber = 2
        UNION ALL
        SELECT
          n.Client,
          n.ChartOfAccounts,
          n.HierarchyName,
          n.LanguageKey_SPRAS,
          n.LevelNumber,
          n.Node,
          n.NodeText,
          n.Parent,
          n.ParentText,
          LevelSequenceNumber+1 AS LevelSequenceNumber,
          CONCAT(NodeTextPath_String, '/',n.NodeText) AS NodeTextPath_String,
          CONCAT(NodePath_String, '/',n.Node) AS NodePath_String
        FROM
          n
        JOIN
          iterations i
        ON
          i.node = n.Parent
          AND i.Client = n.Client
          AND i.ChartOfAccounts = n.ChartOfAccounts
          AND i.HierarchyName = n.HierarchyName
          AND i.LanguageKey_SPRAS = n.LanguageKey_SPRAS
          )
      select Client,
             ChartOfAccounts,
             HierarchyName,
             LanguageKey_SPRAS,
             Node,
             NodeText,
             ParentText,
             LevelNumber,
             LevelSequenceNumber,
             max(LevelNumber) over (partition by Client,ChartOfAccounts,HierarchyName) as MaxLevelNumber,
             NodeTextPath_String,
             NodePath_String,
             split(NodeTextPath_String,'/') as NodeTextPath,
             split(NodePath_String,'/') as NodePath
      from iterations

        ;;
    }
  }
}
