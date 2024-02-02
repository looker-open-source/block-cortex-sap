######################
# Finds the Fiscal Years and Periods available in Balance Sheet
#
# Used as source for Fiscal Period parameter or filter selections
# Depending on max_fp_size, fiscal_year_period will display either YYYY.PP or YYYY.PPP
# includes dimension negative_fiscal_year_period_number which:
#   - is used as an order_by_field for fiscal_year_period
#   - allows the fiscal_year_period to be displayed in descending order in paramter/filter drop-down selectors
######################

view: fiscal_periods_sdt {
  derived_table: {
    sql:
      select
        FiscalYear as fiscal_year,
        FiscalPeriod as fiscal_period,
        concat(b.FiscalYear,'.Q',b.FiscalQuarter) as fiscal_year_quarter,
        concat(b.FiscalYear,'.',b.FiscalPeriod)  AS fiscal_year_period,
        parse_numeric(concat(b.FiscalYear,b.FiscalPeriod)) * -1 as negative_fiscal_year_period_number,
        parse_numeric(concat(b.FiscalYear,b.FiscalQuarter)) * -1 as negative_fiscal_year_quarter_number
      FROM `@{GCP_PROJECT}.@{REPORTING_DATASET}.BalanceSheet`  AS b
      GROUP BY
        fiscal_year,
        fiscal_period,
        fiscal_year_quarter,
        fiscal_year_period,
        negative_fiscal_year_period_number,
        negative_fiscal_year_quarter_number;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.fiscal_year ;;
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
    primary_key: yes
    sql: ${TABLE}.fiscal_year_period ;;
    order_by_field: negative_fiscal_year_period_number
  }

  dimension: negative_fiscal_year_period_number {
    hidden: yes
    type: number
    sql: ${TABLE}.negative_fiscal_year_period_number ;;
  }

  dimension: negative_fiscal_year_quarter_number {
    hidden: yes
    type: number
    sql: ${TABLE}.negative_fiscal_year_quarter_number ;;
  }


}
