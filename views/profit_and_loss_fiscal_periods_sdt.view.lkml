#########################################################{
# PURPOSE
# Finds the Fiscal Years and Periods available in Profit and Loss
# And derives the following fields:
# - fiscal_year_period
# - year ago fiscal period
# - max fiscal period in a fiscal year (used to identify YTD selections)
# - max periods in a quarter (used for identify QTD selections)
#
# SOURCE
# Table @{GCP_PROJECT}.@{REPORTING_DATASET}.ProfitAndLoss
#
# REFERENCED BY
# View profit_and_loss_01_reporting_fiscal_periods_sdt
# View profit_and_loss_02_comparison_fiscal_periods_sdt
#
# NOTE
# This view is only referenced in other views and does not define any dimensions or measures.
#########################################################}

view: profit_and_loss_fiscal_periods_sdt {
  derived_table: {
    sql:
        SELECT
          CONCAT(glhierarchy,company_code,fiscal_year,fiscal_period) as unique_id,
          glhierarchy,
          company_code,
          fiscal_year,
          fiscal_quarter,
          fiscal_period,
          CONCAT(fiscal_year,'.Q',fiscal_quarter) AS fiscal_year_quarter,
          CONCAT(fiscal_year,'.',fiscal_period) as fiscal_year_period,
          RANK() over (PARTITION by glhierarchy, company_code order by CONCAT(fiscal_year,'.',fiscal_period) desc) as fiscal_year_period_rank,
          DENSE_RANK() over (PARTITION by glhierarchy, company_code order by CONCAT(fiscal_year,'.',fiscal_quarter) desc) as fiscal_year_quarter_rank,
          DENSE_RANK() over (PARTITION by glhierarchy, company_code order by fiscal_year desc) as fiscal_year_rank,
          --prior fiscal year, quarter and period
          CAST(PARSE_NUMERIC(fiscal_year) - 1 AS STRING) as prior_fiscal_year,
          LAG(CONCAT(fiscal_year,'.Q',fiscal_quarter),3) OVER (PARTITION BY glhierarchy, company_code ORDER BY fiscal_year, fiscal_quarter) as prior_fiscal_year_quarter,
          LAG(CONCAT(fiscal_year,'.',fiscal_period)) OVER (PARTITION BY glhierarchy, company_code ORDER BY fiscal_year, fiscal_period) as prior_fiscal_year_period,
          --yoy period
          CONCAT(PARSE_NUMERIC(fiscal_year) - 1,'.',fiscal_period) as yoy_fiscal_year_period,
          --derive max fiscal period for year, max number of periods in quarter and period order in quarter (will be used to identify partial/incomplete time periods)
          MAX(fiscal_period) OVER (PARTITION BY glhierarchy, company_code) as max_fiscal_period_in_year,
          COUNT (DISTINCT fiscal_period) OVER (PARTITION BY glhierarchy, company_code, fiscal_quarter) as max_periods_in_quarter,
          COUNT (DISTINCT fiscal_period) OVER (PARTITION BY glhierarchy, company_code, fiscal_quarter) > COUNT (DISTINCT fiscal_period) OVER (PARTITION BY glhierarchy, company_code, fiscal_year, fiscal_quarter) as is_qtd,
          MAX(fiscal_period) OVER (PARTITION BY glhierarchy, company_code) > MAX(fiscal_period) OVER (PARTITION BY glhierarchy, company_code, fiscal_year) as is_ytd,
          RANK() OVER (PARTITION BY glhierarchy, company_code, fiscal_year, fiscal_quarter ORDER by fiscal_period) as period_order_in_quarter
        FROM (
            SELECT
              GLHierarchy as glhierarchy,
              CompanyCode as company_code,
              FiscalYear as fiscal_year,
              FiscalQuarter as fiscal_quarter,
              FiscalPeriod as fiscal_period
            FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.ProfitAndLoss`  AS pl
            WHERE Client = '@{CLIENT}'
            GROUP BY
              glhierarchy,
              company_code,
              fiscal_year,
              fiscal_quarter,
              fiscal_period

      ) p
      ;;
  }

  dimension: unique_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.unique_id ;;
  }

  dimension: glhierarchy {
    type: string
    sql: ${TABLE}.glhierarchy ;;
  }

  dimension: company_code {
    type: string
    sql: ${TABLE}.company_code ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_period {
    type: string
    sql: ${TABLE}.fiscal_period ;;
  }

  dimension: fiscal_year_quarter {
    type: string
    sql: ${TABLE}.fiscal_year_quarter ;;
  }

  dimension: fiscal_year_period {
    type: string
    sql: ${TABLE}.fiscal_year_period ;;
    # order_by_field: negative_fiscal_year_period_number
  }

  dimension: fiscal_year_period_number {
    type: number
    sql: PARSE_NUMERIC(${fiscal_year_period}) ;;
    # order_by_field: negative_fiscal_year_period_number
  }

  dimension: prior_fiscal_year {
    type: string
    sql: ${TABLE}.prior_fiscal_year ;;
  }

  dimension: prior_fiscal_year_quarter {
    type: string
    sql: ${TABLE}.prior_fiscal_year_quarter ;;
  }

  dimension: prior_fiscal_year_period {
    type: string
    sql: ${TABLE}.prior_fiscal_year_period ;;
  }

  dimension: yoy_fiscal_year_period {
    type: string
    sql: ${TABLE}.yoy_fiscal_year_period ;;
  }


}
