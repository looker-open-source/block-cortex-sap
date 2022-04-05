<h1><span style="color:#2d7eea">Google Cloud Cortex Framework for SAP</span></h1>

<h2><span style="color:#2d7eea">Data Foundation Order to Cash</span></h2>

What does this Looker Block do for me?
- **Orders Fulfillment Dashboard** - Monitor current delivery status, highlight late deliveries and compare pending deliveries with current stock.
- **Order Snapshot Dashboard** - To monitor the health of the orders and also how efficient our Orders vs Deliveries.
- **Order Details** - Find all the information about your order in one place and their status.
- **Sales Performance** - Review the sales performance of Products, Division, Sales organization and Distribution channel.
- **Billing and Pricing** - All the information related to the customer and products focused on price variations.

<h2><span style="color:#2d7eea">Data Foundation Account Receivables</span></h2>

What does this Looker Block do for me?
- **Account Receivables Dashboard** - Find all the information regarding the companies finance such as Account Receivables, Overdue Receivables, Day Sales Outstanding and Sales


<h2><span style="color:#2d7eea">Required Customizations</span></h2>

- **Connection**: In the manifest.lkml file, update the value of the CONNECTION_NAME constant and Client ID.

- **Dataset/Schema for OTC**: "OTC_DATASET", Set to the name of the OTC dataset using `project_id.name_of_dataset`. For example, _mygcpprojectname.OTC_

- **Dataset/Schema for AR Dashboards**: "FINANCE_DATASET", Set to the name of the reporting dataset using `project_id.name_of_dataset`. For example, _mygcpprojectname.REPORTING_

- **Dataset/Schema for Functions**: "FUNCTIONS_DATASET", Set to the name of the dataset which contains the SAP/Cortex Functions using `project_id.name_of_dataset`. For example, _`mygcpprojectname`.SAP_FUNCTIONS_

- **ClientId/Constant**: In the manifest.lkml file,For OTC Dashboards please update the value of clientID

**(Optional)** Unhide additional dimensions and measure: Most dimensions and measures have been hidden to simplify reporting and data understanding. However should you find anything valuable missing, simply update the hidden parameters to No in the relevant views.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
- [Looker User Guide](https://looker.com/guide)
- [Looker Help Center](https://help.looker.com)
- [Looker University](https://training.looker.com/)
