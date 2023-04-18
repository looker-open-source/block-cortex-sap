<h1><span style="color:#2d7eea">Google Cloud Cortex Framework for SAP</span></h1>

<h2><span style="color:#2d7eea">What does this Looker Block do for me?</span></h2>

<h3> Data Foundation - Order to Cash </h3>

- **Orders Fulfillment Dashboard** - Monitor current delivery status, highlight late deliveries and compare pending deliveries with current stock.
- **Order Snapshot Dashboard** - To monitor the health of the orders and also how efficient our Orders vs Deliveries.
- **Order Details** - Find all the information about your order in one place and their status.
- **Sales Performance** - Review the sales performance of Products, Division, Sales organization and Distribution channel.
- **Billing and Pricing** - All the information related to the customer and products focused on price variations.

<h3>Data Foundation - Finance</h3>

- **Accounts Receivable Dashboard** - Find all the information regarding the companies' finance such as Accounts Receivable, Overdue Receivables, Day Sales Outstanding.
- **Accounts Payable Dashboard** - Find all the information regarding the companies' finance such as Accounts Payables, Accounts Payalable Turnover, Overdue Payables, Accounts Payable Aging and Cash Discount Utilization.
- **Vendor Performance Dashboard** - Find all the information regarding the Vendor Performance in terms of delivery and other important indicators like Vendor Lead time , Purchase price variance , Purchase Order status.
- **Spend Analysis Dashboard** - Find all the information regarding the major indicators like Total Spend, Spend Analysis, Total number of Suppliers to check spend across different Purchase orgs, Purchase groups, Vendor Countries, Material Types.

<h3>Data Foundation - Inventory</h3>

- **Inventory Management Dashboard** - This block gives the high level information to Inventory Manager about various stock categories and other important Key Performance Indicators including Inventory Turn, Days of Supply, Obsolete Inventory and Slow Moving Inventory.

<h2><span style="color:#2d7eea">Setting up the dashboards for the first time</span></h2>

There are 2 ways to setting up these dashboards:

- Use "Install from Git URL" functionality from Looker Marketplace. See [instructions](https://cloud.google.com/looker/docs/marketplace#installing_a_tool_from_a_git_url).
- (Advanced) Use a Git connection. See [Instructions](https://cloud.google.com/looker/docs/setting-up-git-connection).

<h2><span style="color:#2d7eea">Required Data</span></h2>

The datasets required by this block can be obtained by following the installation and configuration instructions for the [Google Cloud Cortex Framework](https://github.com/GoogleCloudPlatform/cortex-data-foundation) application. The related [Google Cloud Cortex Framework for SAP](https://github.com/llooker/cortex_data_foundation) LookML Block also leverages these same datasets.

<h2><span style="color:#2d7eea">Required Customizations</span></h2>

<h3>Constant Values</h3>

>   ❕ Required Constant Values are configured during the Installation process. 

>   ❕ This step is completed automatically if you use ["Install from Git URL" functionality](https://cloud.google.com/looker/docs/marketplace#installing_a_tool_from_a_git_url) from Looker Marketplace.


- **Connection**: In the manifest.lkml file, update the value of the CONNECTION_NAME constant and Client ID.
- **GCP Project**: The GCP project name where the SAP reporting dataset resides in BigQuery (not project id).
- **Reporting Dataset**: The deployed Cortex Data Foundation _REPORTING dataset where the SAP views reside within the GCP BigQuery project.
- **ClientId/Constant**: The SAP Client number (mandt) the dashboards will utilize to display data. 

<h3> User Attributes </h3>

>   ❕ The dashboards will not load properly if any of the following required user attributes is not set. 

- **Default Currency**: In the Looker User Profile, create and set the value of name = default_value_currency_required, label = "Default Value Currency Required" to the desired default currency.
- **Client Id Rep**: In the Looker User Profile, create and set the value of name = client_id_rep, label = "Default Value for Client Id Rep Required" to the desired default client_id_rep.

<h3> Other considerations </h3>

- **Persistent Derived Tables**: Enable <a href="https://cloud.google.com/looker/docs/derived-tables#persistent_derived_tables_(pdts)">Persistent Derived Tables</a> using check box under CONNECTION settings accessible through Admin > Databases > Connections.
- **Locale**: Each user's [Locale setting](https://cloud.google.com/looker/docs/model-localization#assigning_users_to_a_locale) in their Looker User Profile will be used to map to SAP language code and filter material text language for Sales Order, Vendor Performance and Inventory Metrics Overview views. See the [language_map](views/language_map.view.lkml) view for details on the mapping.
- **BI Engine Optimization**: Some calculations perform better with [BI Engine Optimization](https://cloud.google.com/blog/products/data-analytics/faster-queries-with-bigquery-bi-engine) feature in Looker. 
- **(Optional) Unhide additional dimensions and measure**: Most dimensions and measures have been hidden to simplify reporting and data understanding. However should you find anything valuable missing, simply update the hidden parameters to No in the relevant views.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:

- [Looker User Guide](https://looker.com/guide)
- [Looker Help Center](https://help.looker.com)
- [Looker University](https://training.looker.com/)
