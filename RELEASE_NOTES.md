## Release v5.0.1
*	Updated all views to have a single primary key dimension. For some views, added a _key_ dimension to concatenate multiple dimensions making up the primary key
*	Edited `sales_orders` Explore to remove unnecessary join between `currency_conversion_new` and `sales_order_pricing`
*	Replaced `currency_conversion_pricing` with `currency_conversion_new ` in dashboards and view `sales_orders`
* In view and Explore `sales_orders`:
  *   removed SQL_DISTINCT_KEY parameter from measure _sales_order_netvalue_glob_curr_1_ as its no longer necessary
  *   added USD as default for parameter _Currency_Required_
  *   added value of parameter _Currency_Required_ to join condition for `currency_conversion_new`
*	Updated LookML Dashboard file 6d_Total_Receivable to use _PeriodCalc_ dimension instead of _Fiscal_Year_
*	Added measure _total_actual_billed_quantity_fkimg_ to view `billing`
*	In view and Explore `data_intelligence_ar`:
    *  added `currency_conversion_new` to the Explore
    *  replaced SQL function Currency Conversion with `currency_conversion_new`
    *  added USD as default for parameter _Currency_Required_
    *  replaced Split function with Substring function for several dimensions derived from _PeriodCalc_
