<h1><span style="color:#2d7eea">Google Cloud Cortex Framework for SAP</span></h1>

<h2><span style="color:#2d7eea">Data Foundation Order to Cash</span></h2>

What does this Looker Block do for me?

There are several high-level dashboards included:
- **1. Orders Fulfillment Dashboard** - Monitor current delivery status, highlight late deliveries and compare pending deliveries with current stock.
- **2. Order Snapshot Dashboard** - To monitor the health of the orders and also how efficient our Orders vs Deliveries.
- **3. Order Details** - Find all the information about your order in one place and their status.
- **4. Sales Performance** - Review the sales performance of Products, Division, Sales organization and Distribution channel.
- **5. Billing and Pricing** - All the information related to the customer and products focused on price variations.

These 5 dashboards are accompanied by 14 supplemental dashboards with pertinent drill information. The dashboards have been organized by relationship to one of the 5 primary dashboards.
(For example, dashboards related to "1. Order Fullfillment" will have titles following this pattern "1_a" "1_b").

<h2><span style="color:#2d7eea">Data Foundation Finance</span></h2>

What does this Looker Block do for me?
- **Accounts Receivable Dashboard** - Find all the information regarding the companies finance such as Accounts Receivable, Overdue Receivables, Day Sales Outstanding.
- **Accounts Payable Dashboard** - Find all the information regarding the companies finance such as Accounts Payables, Accounts Payalable Turnover, Overdue Payables, Accounts Payable Aging and Cash Discount Utilization.
- **Vendor Performance Dashboard** - Find all the information regarding the Vendor Performance in terms of delivery and other important indicators like Vendor Lead time , Purchase price variance , Purchase Order status.
- **Spend Analysis Dashboard** - Find all the information regarding the major indicators like Total Spend, Spend Analysis, Total number of Suppliers to check spend across different Purchase orgs, Purchase groups, Vendor Countries, Material Types.

<h2><span style="color:#2d7eea">Required Data</span></h2>
The datasets required by this block can be obtained by following the installation and configuration instructions for the <a href="https://github.com/GoogleCloudPlatform/cortex-data-foundation">Google Cloud Cortex Framework</a> application. The related <a href="https://github.com/llooker/cortex_data_foundation">Google Cloud Cortex Framework for SAP</a> LookML Block also leverages these same datasets.

<h2><span style="color:#2d7eea">Required Customizations</span></h2>

>   ❕ Required Constant Values are configured during the Installation process

- **Connection**: In the manifest.lkml file, update the value of the CONNECTION_NAME constant and Client ID.

- **GCP Project**: The GCP project name where the SAP reporting dataset resides in BigQuery (not project id).

- **Reporting Dataset**: The deployed Cortex Data Foundation _REPORTING dataset where the SAP views reside within the GCP BigQuery project.

- **ClientId/Constant**: The SAP Client number (mandt) the dashboards will utilize to display data. 

- **Persistent Derived Tables**: Enable <a href="https://cloud.google.com/looker/docs/derived-tables#persistent_derived_tables_(pdts)">Persistent Derived Tables</a> using check box under CONNECTION settings accessible through Admin > Databases > Connections.

>   ❕ Required User Attributes are configured separately within the Looker instance

- **Default Currency**: In the Looker User Profile, create and set the value of name = default_value_currency_required, label = "Default Value Currency Required" to the desired default currency.

- **Client Id Rep**: In the Looker User Profile, create and set the value of name = client_id_rep, label = "Default Value for Client Id Rep Required" to the desired default client_id_rep.

- **Language**: In the Looker User Profile, create and set the value of name = language, label = "Default Value for language Required" to the desired default language.
  
  NOTE - The dashboards will not load properly without the default currency set. Users may override this attribute in their preferred local currency. Some calculations perform better with BI Engine Optimization feature in Looker. It can be enabled via Looker admin --> Labs

**(Optional)** Unhide additional dimensions and measure: Most dimensions and measures have been hidden to simplify reporting and data understanding. However should you find anything valuable missing, simply update the hidden parameters to No in the relevant views.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
- [Looker User Guide](https://looker.com/guide)
- [Looker Help Center](https://help.looker.com)
- [Looker University](https://training.looker.com/)
