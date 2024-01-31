<h1><span style="color:#2d7eea">Google Cloud Cortex Framework for SAP</span></h1>

<h2><span style="color:#2d7eea">What does this Looker Block do for me?</span></h2>

Gain faster insights into your Order to Cash, Finance, and Inventory data with these Dashboards and Explores based on the SAP Cortex Data Foundation. Leverage or customize this Looker model to:
* Identify trends and patterns in your data
* Spot potential problems early on
* Make better decisions faster

<h2><span style="color:#2d7eea">Included Dashboards by Subject Area</span></h2>

<h3> Order to Cash </h3>

- **Orders Fulfillment** - Monitor current delivery status, highlight late deliveries and compare pending deliveries with current stock.
- **Order Snapshot** - Monitor the health of the orders including product delivery efficiency.
- **Order Details** - See order details including status.
- **Sales Performance** - Review the sales performance of products, divisions, sales organizations and distribution channels.
- **Billing and Pricing** - Review price variations by customer and product.

<h3>Finance</h3>

- **Accounts Receivable** - Analyze total receivables, overdue receivables, days outstanding, and top companies with highest receivables.
- **Accounts Payable** - Find financial information such as accounts payable, accounts payable turnover, overdue payables, accounts payable aging, and cash discount utilization.
- **Vendor Performance** - Analyze vendor performance including delivery, lead time, price variance, purchase order status.
- **Spend Analysis** - Review Key Performance Indicators (KPIs) like total spend, active vendor count and cleared invoices. Breakdown spend by purchase organization, purchase group, vendor country, and material type.


<h3>Inventory</h3>

- **Inventory Management** - Review inventory value over time (in total and by material type). Highlight other important KPIs including:
  * Inventory Turn
  * Days of Supply
  * Obsolete Inventory Value
  * Slow Moving Inventory Value

<h3>Balance Sheet</h3>

> ⚠️ available beginning with [Google Cloud Cortex Framework 5.3](https://github.com/GoogleCloudPlatform/cortex-data-foundation).

View the balance sheet as of a selected fiscal period, compared to the same period last year, the previous fiscal period, or a different fiscal period. And display 3-levels of the selected hierarchy for a user-specified chart of accounts and company. Two dashboards using different table styles are included.


- **Balance Sheet Marketplace Report** - This report uses an easy-to-read table style designed for finance reports. To use this dashboard, a Looker Admin must install the [Report Table](https://marketplace.looker.com/marketplace/detail/viz-report_table) plug-in/visualization type from Looker Marketplace. Refer to Looker documentation for [Using Looker Marketplace](https://cloud.google.com/looker/docs/marketplace).

- **Balance Sheet Subtotals Report** - This report uses Looker's built-in table visualization with subtotals (no special installation required).


<h2><span style="color:#2d7eea">Required Data</span></h2>

Get the required BigQuery datasets for this block by following the installation instructions for [Google Cloud Cortex Framework](https://github.com/GoogleCloudPlatform/cortex-data-foundation).

<h2><span style="color:#2d7eea">Installation Instructions</span></h2>

Manually install this LookML Model following one of the options below.

<h4><span style="color:#2d7eea">Option A: Marketplace Install via Git</span></h4>

Refer to the Looker documentation for [Installing a Tool from Marketplace](https://cloud.google.com/looker/docs/marketplace#installing_a_tool_from_a_git_url). Provide values for the required prompts as outlined in next section **Required Parameters**.

<h4><span style="color:#2d7eea">Option B: Manual Install via Fork of this Repository</span></h4>

  * [Fork this GitHub repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository)
  * [Create a blank LookML project](https://cloud.google.com/looker/docs/create-projects#creating_a_blank_project) with any name (e.g., cortex_sap_operational)
  * [Connect the new LookML project to the forked repository](https://cloud.google.com/looker/docs/setting-up-git-connection)
  * Update the values of constants in the `manifest.lkml` file as described in the next section **Required Parameters**
  * [Commit and deploy changes to production](https://cloud.google.com/looker/docs/version-control-and-deploying-changes#getting_your_changes_to_production)

With the Looker project based on your forked repository, you can customize the LookML to fit your unique business needs.

<h2><span style="color:#2d7eea"> Required Parameters</span></h2>
> ⚠️ These required values are configured during the Marketplace Installation process, or if this Block was installed from a forked Git repository, you will update the values for these constants in the `manifest.lkml` file for the project.

- **Connection**: Value of the BigQuery CONNECTION_NAME allowing Looker to query the Cortex REPORTING dataset. Note, to use Balance Sheet reporting [Persistent Derived Tables](https://cloud.google.com/looker/docs/db-config-google-bigquery#persistent-derived-tables-on-a-connection) must be enabled.

- **GCP Project ID**: The GCP project where the SAP reporting dataset resides in BigQuery (i.e., GCP project ID). [Identifying Project ID](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects).

- **Reporting Dataset**: The deployed Cortex Data Foundation REPORTING dataset where the SAP views reside within the GCP BigQuery project.

- **Client**: The SAP Client number (mandt) to use for Reporting.


<h2><span style="color:#2d7eea"> Required User Attributes</span></h2>

Dashboards require four Looker [user attributes](https://cloud.google.com/looker/docs/admin-panel-users-user-attributes) to work properly.

A Looker Admin should create the following user attributes and set their default values.
> ⚠️ Name each user attribute exactly as listed below:

| **Required User Attribute Name** | **Label**                            | **Data Type** | **User Access** | **Hide Value** | **Default Value** |
|----------------------------------|--------------------------------------|---------------|-----------------|----------------|-------------------|
| default_value_currency_required  | SAP Default Currency to Display      | String        | Edit            | No             | `USD` or _desired currency like EUR, CAD or JPY_ |
| client_id_rep                    | SAP Client Id (mandt) for Reporting  | String        | Edit            | No             | Enter your _SAP Client ID_ or `100` if using the provided test data |
| sap_use_demo_data                | SAP: Use Demo Data (Yes or No)       | String        | Edit            | No             | Enter `Yes` if using the provided test data. Otherwise, enter `No` |
| sap_sql_flavor                   | SAP: SQL Flavor (ECC or S4)          | String        | View            | No             | Enter `ECC` or `S4` as required for your SAP system |

Each dashboard user can personalize these values by following these [instructions](https://cloud.google.com/looker/docs/user-account).


<h2><span style="color:#2d7eea">Other Considerations</span></h2>

- **Persistent Derived Tables**: Required for using Balance Sheet dasbhoards. And if using this block with production data, you may want to convert some derived tables to [Persistent Derived Tables (PDTs)](https://cloud.google.com/looker/docs/derived-tables#use_cases_for_pdts) to improve query performance. Ensure your BigQuery Connection has enabled PDTs, then update any derived table syntax with the desired [persistence strategy](https://cloud.google.com/looker/docs/derived-tables#persistence_strategies).

- **Locale**: The Looker user [locale](https://cloud.google.com/looker/docs/model-localization#assigning_users_to_a_locale) setting (as seen in account profile) maps to SAP language code for _BalanceSheet_, _Materials_MD_, _Vendor Performance_, and _Inventory Metrics Overview_ views and determines material text language. See [language_map](views/language_map.view.lkml) for details.

- **BI Engine Optimization**: Some calculations perform better with [BI Engine Optimization](https://cloud.google.com/blog/products/data-analytics/faster-queries-with-bigquery-bi-engine) enabled in BigQuery.

- **Liquid Templating Language**: Some constants, views, explores and dashboard use liquid templating language. For more information, see Looker's [Liquid Variable Reference](https://cloud.google.com/looker/docs/liquid-variable-reference) documentation.

- **(Optional) Unhide additional dimensions and measures**: Many dimensions and measures are hidden for simplicity. If you find anything valuable missing, update the field's `hidden` parameter value **No** in the relevant views.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
- [Looker Best Practices](https://cloud.google.com/looker/docs/best-practices/home)
- [Looker/Google Cloud Training](https://www.cloudskillsboost.google/catalog)
