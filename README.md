<h1><span style="color:#2d7eea">Google Cloud Cortex Framework for SAP</span></h1>

<h2><span style="color:#2d7eea">What does this Looker Block do for me?</span></h2>

<h3> Data Foundation - Order to Cash </h3>

- **Orders Fulfillment Dashboard** - Monitor current delivery status, highlight late deliveries and compare pending deliveries with current stock.
- **Order Snapshot Dashboard** - Monitor the health of the orders and also how efficient our Orders vs Deliveries.
- **Order Details** - See order details including status.
- **Sales Performance** - Review the sales performance of Products, Division, Sales organization and Distribution channel.
- **Billing and Pricing** - Review price variations by customer and product.

<h3>Data Foundation - Finance</h3>

- **Accounts Receivable Dashboard** - Analyze total receivables, overdue receivables, days outstanding, and top companies with highest receivables.
- **Accounts Payable Dashboard** - Find financial information such as accounts payable, accounts payable turnover, overdue payables, accounts payable aging, and cash discount utilization.
- **Vendor Performance Dashboard** - Analyze vendor performance including delivery, lead time, price variance, purchase order status.
- **Spend Analysis Dashboard** - Review key kpis like total spend, active vendor count and cleared invoices. Breakdown spend by purchase organization, purchase group, vendor country, and material type.


<h3>Data Foundation - Inventory</h3>

- **Inventory Management Dashboard** - This block gives the high level information to Inventory Manager about various stock categories and other important Key Performance Indicators including Inventory Turn, Days of Supply, Obsolete Inventory and Slow Moving Inventory.

<h2><span style="color:#2d7eea">Required Data</span></h2>

Get the required datasets for this block by following the [Google Cloud Cortex Framework](https://github.com/GoogleCloudPlatform/cortex-data-foundation).

<h2><span style="color:#2d7eea">Installation Instructions</span></h2>

Manually install this LookML Model following the one of the options below.

<h4><span style="color:#2d7eea">Option A: Marketplace Install via Git</span></h4>

Refer to the Looker documentation for [Installing a Tool from Marketplace](https://cloud.google.com/looker/docs/marketplace#installing_a_tool_from_a_git_url). Provide values for the required prompts as outlined in next section **Required Parameters**.

<h4><span style="color:#2d7eea">Option B: Manual Install via Fork of this Repository</span></h4>
  - [Fork this GitHub repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository)
  - [Create a blank LookML project](https://cloud.google.com/looker/docs/create-projects#creating_a_blank_project) with any name (e.g., cortex_demand_sensing)
  - [Connect the new LookML project to the forked repository](https://cloud.google.com/looker/docs/setting-up-git-connection)
  - Update the values of constants in the `manifest.lkml` file as described in the next section **Required Parameters**
  - [Commit and deploy changes to production](https://cloud.google.com/looker/docs/version-control-and-deploying-changes#getting_your_changes_to_production)

<h2><span style="color:#2d7eea"> Required Parameters</span></h2>
> ⚠️ These required values are configured during the Marketplace Installation process, or if this Block was installed from a forked Git repository, you will update the values for these constants in the `manifest.lkml` file for the project.

- **Connection**: Value of the BigQuery CONNECTION_NAME allowing Looker to query the Cortex REPORTING dataset.

- **GCP Project ID**: The GCP project where the SAP reporting dataset resides in BigQuery (i.e., GCP project ID). [Identifying Project ID](https://cloud.google.com/resource-manager/docs/creating-managing-projects#identifying_projects).

- **Reporting Dataset**: The deployed Cortex Data Foundation REPORTING dataset where the SAP views reside within the GCP BigQuery project.

- **Client**: The SAP Client number (mandt) to use for Reporting.


<h2><span style="color:#2d7eea"> Required User Attributes</span></h2>

Dashboards require two Looker [user attributes](https://cloud.google.com/looker/docs/admin-panel-users-user-attributes) to work properly.

A Looker Admin should create the following user attributes and set their default values.
> ⚠️ Name each user attribute exactly as listed below:

| **Required User Attribute Name** | **Label**                            | **Data Type** | **User Access** | **Hide Value** | **Default Value** |
|----------------------------------|--------------------------------------|---------------|-----------------|----------------|-------------------|
| default_value_currency_required  | SAP Default Currency to Display      | String        | Edit            | No             | `USD` or _desired currency like EUR, CAD or JPY_ |
| client_id_rep                    | SAP Client Id (mandt) for Reporting  | String        | Edit            | No             | _Enter your SAP Client ID_ or `100` if using the provided test data |

Each dashboard user can personalize these values by following these [instructions](https://cloud.google.com/looker/docs/user-account).


<h2><span style="color:#2d7eea">Other Considerations</span></h2>

- **Persistent Derived Tables**: Enable <a href="https://cloud.google.com/looker/docs/derived-tables#persistent_derived_tables_(pdts)">Persistent Derived Tables</a> using check box under CONNECTION settings accessible through Admin > Databases > Connections.
- **Locale**: Each user's [Locale setting](https://cloud.google.com/looker/docs/model-localization#assigning_users_to_a_locale) in their Looker User Profile will be used to map to SAP language code and filter material text language for Sales Order, Vendor Performance and Inventory Metrics Overview views. See the [language_map](views/language_map.view.lkml) view for details on the mapping.
- **BI Engine Optimization**: Some calculations perform better with [BI Engine Optimization](https://cloud.google.com/blog/products/data-analytics/faster-queries-with-bigquery-bi-engine) feature in Looker.
- **(Optional) Unhide additional dimensions and measure**: Most dimensions and measures have been hidden to simplify reporting and data understanding. However should you find anything valuable missing, simply update the hidden parameters to No in the relevant views.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
- [Looker Best Practices](https://cloud.google.com/looker/docs/best-practices/home)
- [Looker/Google Cloud Training](https://www.cloudskillsboost.google/catalog)
