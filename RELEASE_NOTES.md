## Release v5.3.1
* Balance Sheet Updates:
  * Added the Persistent Derived Table (PDT) view `balance_sheet_path_to_node_pdt` and Datagroup `balance_sheet_node_count`. This PDT finds the full hierarchy path to each Balance Sheet node (e.g., Assets/Current Assets/Cash & Equivalents). This PDT will regenerate if the count of Client, Chart of Accounts, Hierarchy Name, Level, and Node changes. Requires BigQuery connection used for this LookML model to have [Persistent Derived Tables](https://cloud.google.com/looker/docs/db-config-google-bigquery#persistent-derived-tables-on-a-connection) enabled.
  * Updated Balance Sheet dashboards by:
    *   including three levels of the hierarchy as specified by user
    *   adding filter for Ledger
    *   renaming dashboards and select filters to more business-friendly terms
    *   modifying the sort order for columns and rows
    *   adding defaults for select filters based on user attributes for SQL Flavor (S4 or ECC) and Use of Test Data (Yes or No)
  * Added the following user attributes to set default values for select filters used in the balance sheet dashboard. A Looker Admin will need to add these user attributes to Looker (see README doc for more details) or update LookML dashboards to use other defaults.
    *   `sap_use_demo_data`: set to _Yes_ if using the test data included with the Cortex Framework
    *   `sap_sap_sql_flavor`: set to either _S4_ or _ECC_ depending upon your SAP system

* Accounts Receivable Updates:
  * Added the Persistent Derived Table (PDT) view `global_currency_list_pdt`, an Explore based on this view and a Datagroup named `monthly_on_day_1`. Generated on the 1st day of the month, this PDT provides a unique list of _ToCurrency_TCURR_ values that are used for filter suggestions. To adjust the update frequency of a particular PDT, a Looker developer or admin can modify the associated Datagroup trigger.
  * In the `data_intelligence_ar` view, for the _Currency_Required_ parameter, replaced the allowed values with the suggest_dimension _global_currency_list_pdt.to_currency_tcurr_.

## Release v5.3
* Added views, explores and dashboards to support `Balance Sheet` reporting
* Added constants to the `manifest` to allow for the reuse of HTML value formatting and comparison period logic used in the Balance Sheet.
* Note the manifest and the Balance Sheet views and explores leverage liquid templating language. For more information, refer to Looker's [Liquid Variable Reference](https://cloud.google.com/looker/docs/liquid-variable-reference) documentation.


## Release v5.0.1
* Updated all views to have a single primary key dimension. For some views, added a _key_ dimension to concatenate multiple dimensions making up the primary key
* Edited `sales_orders` Explore to remove unnecessary join between `currency_conversion_new` and `sales_order_pricing`
* Replaced `currency_conversion_pricing` with `currency_conversion_new ` in dashboards and view `sales_orders`
* In view and Explore `sales_orders`:
  *   removed SQL_DISTINCT_KEY parameter from measure _sales_order_netvalue_glob_curr_1_ as its no longer necessary
  *   added USD as default for parameter _Currency_Required_
  *   added value of parameter _Currency_Required_ to join condition for `currency_conversion_new`
* Updated LookML Dashboard file 6d_Total_Receivable to use _PeriodCalc_ dimension instead of _Fiscal_Year_
* Added measure _total_actual_billed_quantity_fkimg_ to view `billing`
* In view and Explore `data_intelligence_ar`:
    *  added `currency_conversion_new` to the Explore
    *  replaced SQL function Currency Conversion with `currency_conversion_new`
    *  added USD as default for parameter _Currency_Required_
    *  replaced Split function with Substring function for several dimensions derived from _PeriodCalc_
