#########################################################{
# this Persistent Derived Table (pdt) derives the full path to a node (e.g., Net Income (P&L)/Operating Income/Gross Margin)
#
# Uses RECURSIVE to navigate the parent-child relationships and derive the full path
# This view is only referenced in the view profit_and_loss_hierarchy_selection_sdt
#########################################################}

view: profit_and_loss_path_to_node_pdt {
  derived_table: {
    datagroup_trigger: profit_and_loss_node_count
    create_process: {
      sql_step:

      CREATE OR REPLACE TABLE ${SQL_TABLE_NAME} as
      WITH
        RECURSIVE n AS (
        SELECT
          Client,
          ChartOfAccounts,
          GLHierarchy,
          LanguageKey_SPRAS,
          GLLevel,
          CAST(GLLevel AS INT64) AS LevelNumber,
          GLParent,
          COALESCE(GLParentText,GLParent) AS GLParentText,
          GLNode,
          COALESCE(GLNodeText,GLNode) AS GLNodeText,
          GLIsLeafNode
        FROM
          `@{GCP_PROJECT}.@{REPORTING_DATASET}.ProfitAndLoss`
        GROUP BY
          Client,
          ChartOfAccounts,
          GLHierarchy,
          LanguageKey_SPRAS,
          GLLevel,
          CAST(GLLevel AS INT64),
          GLParent,
          COALESCE(GLParentText,GLParent),
          GLNode,
          COALESCE(GLNodeText,GLNode),
          GLIsLeafNode
          ),
        iterations AS (
        SELECT
          Client,
          ChartOfAccounts,
          GLHierarchy,
          LanguageKey_SPRAS,
          GLLevel,
          LevelNumber,
          GLIsLeafNode,
          GLNode,
          GLNodeText,
          GLParent,
          GLParentText,
          0 AS LevelSequenceNumber,
          GLnodeText AS NodeTextPath_String,
          GLNode AS NodePath_String,
          CAST(LevelNumber as STRING) AS NodeLevelPath_String
        FROM
          n
        WHERE
          LevelNumber = 2
        UNION ALL
        SELECT
          n.Client,
          n.ChartOfAccounts,
          n.GLHierarchy,
          n.LanguageKey_SPRAS,
          n.GLLevel,
          n.LevelNumber,
          n.GLIsLeafNode,
          n.GLNode,
          n.GLNodeText,
          n.GLParent,
          n.GLParentText,
          LevelSequenceNumber+1 AS LevelSequenceNumber,
          CONCAT(NodeTextPath_String, '-->',n.GLNodeText) AS NodeTextPath_String,
          CONCAT(NodePath_String, '-->',n.GLNode) AS NodePath_String,
          CONCAT(NodeLevelPath_String, '-->',CAST(n.LevelNumber AS STRING)) AS NodeLevelPath_String
        FROM
          n
        JOIN
          iterations i
        ON
          i.GLNode = n.GLParent
          AND i.Client = n.Client
          AND i.ChartOfAccounts = n.ChartOfAccounts
          AND i.GLHierarchy = n.GLHierarchy
          AND i.LanguageKey_SPRAS = n.LanguageKey_SPRAS
          AND i.LevelSequenceNumber < 12
          )
      SELECT Client,
             ChartOfAccounts,
             GLHierarchy,
             LanguageKey_SPRAS,
             GLLevel,
             GLIsLeafNode,
             GLNode,
             GLNodeText,
             GLParent,
             GLParentText,
             LevelNumber,
             LevelSequenceNumber,
             MAX(LevelNumber) OVER (PARTITION BY Client,ChartOfAccounts,GLHierarchy) AS MaxLevelNumber,
             NodeTextPath_String,
             NodePath_String,
             NodeLevelPath_String,
             SPLIT(NodeTextPath_String,'-->') AS NodeTextPath,
             SPLIT(NodePath_String,'-->') AS NodePath,
             SPLIT(NodeLevelPath_String,'-->') AS NodeLevelPath
      FROM iterations
       ;;
    }
  }
}
