view: Navigation_Bar {
  derived_table: {
    sql: Select 'Order Fullfilment' AS Dashboard_Name
      UNION ALL Select 'Order Status Snapshort' AS Dashboard_Name
      UNION ALL Select 'Sales Order Metrics' AS Dashboard_Name
      UNION ALL Select 'Sales Performance' AS Dashboard_Name
      UNION ALL Select 'Billing And Pricing' AS Dashboard_Name
       ;;
  }

  measure: dash_nav {
    hidden: no
    label: "Navigation Bar"
    type: string
    sql: "";;
    html:
    <div style="background-color: #FFFFFF; height:525px;width:100%"></div>
      <div style="background-color: #FFFFFF; border: solid 1px #4285F4; border-radius: 5px; padding: 5px 10px; height: 60px; width:100%">
        <nav style="font-size: 18px; color: #4285F4">
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::order_fulfillment?">Order Fulfillment</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::order_status_snapshot?">Order Status Snapshot</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::order_details?">Order Details</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::sales_performance?">Sales Performance</a>
          <a style="padding: 5px; float: center; line-height: 40px; margin-left: 8px; color: #4285F4" href="/dashboards/cortex_sap_operational::billing_and_pricing?">Billing and Pricing</a>
        </nav>
        </nav>
      </div>
    <div style="background-color: #FFFFFF; height:500px;width:100%"></div>;;
  }

}