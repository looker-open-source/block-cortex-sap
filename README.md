<h1><span style="color:#2d7eea">Google Cloud Cortex Framework for SAP</span></h1>

<h2><span style="color:#2d7eea">Data Foundation Order to Cash</span></h2>

What does this Looker Block do for me?

There are several high-level dashboards included:
- **1. Orders Fulfillment Dashboard** - Monitor current delivery status, highlight late deliveries and compare pending deliveries with current stock.
- **2. Order Snapshot Dashboard** - To monitor the health of the orders and also how efficient our Orders vs Deliveries.
- **3. Order Details** - Find all the information about your order in one place and their status.
- **4. Sales Performance** - Review the sales performance of Products, Division, Sales organization and Distribution channel.
- **5. Billing and Pricing** - All the information related to the customer and products focused on price variations.
- **6. Accounts Receivable** - Insights into AR by Company, Overdue Accounts, and Sales Outstanding values.

These 6 dashboards are accompanied by 14 supplemental dashboards with pertinent drill information. The dashboards have been organized by relationship to one of the 6 primary dashboards.
(For example, dashboards related to "1. Order Fullfillment" will have titles following this pattern "1_a" "1_b").

<h2><span style="color:#2d7eea">Data Foundation Account Receivables</span></h2>

What does this Looker Block do for me?
- **Account Receivables Dashboard** - Find all the information regarding the companies finance such as Account Receivables, Overdue Receivables, Day Sales Outstanding and Sales

<h2><span style="color:#2d7eea">Required Data</span></h2>
The datasets required by this block can be obtained by following the installation and configuration instructions for the [Google Cloud Cortex Framework](https://github.com/GoogleCloudPlatform/cortex-data-foundation) application. The related [Google Cloud Cortex Framework for SAP](https://github.com/llooker/cortex_data_foundation) LookML Block also leverages these same datasets.

<h2><span style="color:#2d7eea">Required Customizations</span></h2>
>   ❕ Constant Values are configured during the Marketplace Installation process. To make changes to these values, please use the Marketplace "Manage" screen.

- **Connection**: In the manifest.lkml file, update the value of the CONNECTION_NAME constant and Client ID.

- **GCP Project**: The GCP project name where the SAP reporting dataset resides in BigQuery (not project id).

- **Reporting Dataset**: The deployed Cortex Data Foundation _REPORTING dataset where the SAP views reside within the GCP BigQuery project.

- **ClientId/Constant**: The SAP Client number (mandt) the dashboards will utilize to display data. 

**(Optional)** Unhide additional dimensions and measure: Most dimensions and measures have been hidden to simplify reporting and data understanding. However should you find anything valuable missing, simply update the hidden parameters to No in the relevant views.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
- [Looker User Guide](https://looker.com/guide)
- [Looker Help Center](https://help.looker.com)
- [Looker University](https://training.looker.com/)
