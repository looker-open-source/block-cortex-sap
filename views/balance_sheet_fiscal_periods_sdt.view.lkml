#########################################################{
# PURPOSE
# Finds the Fiscal Years and Periods available in Balance Sheet
# And derives the following fields:
# - fiscal_year_period
# - yoy_fiscal_year_period
# - prior_fiscal_year_period
#
# SOURCE
# Table @{GCP_PROJECT}.@{REPORTING_DATASET}.BalanceSheet
#
# REFERENCED BY
# View balance_sheet_fiscal_periods_selected to identify comparison period based on user selections
#
# NOTE
# This view is only referenced in another view and does not define any dimensions or measures.
#########################################################}

view: balance_sheet_fiscal_periods_sdt {
  derived_table: {
    sql:
      SELECT
        CONCAT(hierarchy_name,company_code,fiscal_year,fiscal_period) AS unique_id,
        hierarchy_name,
        company_code,
        fiscal_year,
       -- fiscal_quarter,
        fiscal_period,
        CONCAT(fiscal_year,'.',fiscal_period) as fiscal_year_period,
      --yoy and prior period
        CONCAT(PARSE_NUMERIC(fiscal_year) - 1,'.',fiscal_period) AS yoy_fiscal_year_period,
        LAG(CONCAT(fiscal_year,'.',fiscal_period)) OVER (PARTITION BY hierarchy_name, company_code ORDER BY fiscal_year, fiscal_period) AS prior_fiscal_year_period
      FROM (
            SELECT
              HierarchyName AS hierarchy_name,
              CompanyCode AS company_code,
              FiscalYear AS fiscal_year,
              FiscalPeriod AS fiscal_period
            FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.BalanceSheet`
            WHERE Client = '@{CLIENT}'
            GROUP BY
              hierarchy_name,
              company_code,
              fiscal_year,
              fiscal_period
            ) p
            ;;
  }


}
