# The name of this view in Looker is "Data Intelligence Ar"
view: data_intelligence_ar {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.AccountingDocumentsReceivable`
    ;;

  parameter: Aging_Interval {
    type: number
    default_value: "10"
  }

  parameter: Currency_Required{
    type: string
    suggest_explore: global_currency_list_pdt
    suggest_dimension: global_currency_list_pdt.to_currency_tcurr
    default_value: "USD"
  }

  parameter: Day_Sales_Outstanding {
    type: number
    description: "Enter the No.of Period"
    default_value: "2"
  }

  parameter: Key_Date {
    type: date
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Accounting Document Number Belnr" in Explore.

  dimension: key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${Client_ID},${Accounting_Document},${Company_Code},${fiscal_year_gjahr},${Accounting_Document_Items});;
  }


  dimension: Past_Due_Interval{
    type: string
    sql: if((date_diff(cast({% parameter Key_Date %} as Date),${TABLE}.NetDueDate, DAY)>0 and date_diff(cast({% parameter Key_Date %} as Date),${TABLE}.NetDueDate, DAY)<({% parameter Aging_Interval %}+1)),concat('1- ',({% parameter Aging_Interval %}),' Days'),
        (if((date_diff(cast({% parameter Key_Date %} as Date),${TABLE}.NetDueDate, DAY)<(({% parameter Aging_Interval %}*2)+1)),concat(({% parameter Aging_Interval %}+1),'-',({% parameter Aging_Interval %}*2),' Days'),
        (if((date_diff(cast({% parameter Key_Date %} as Date),${TABLE}.NetDueDate, DAY)<(({% parameter Aging_Interval %}*3)+1)),concat(({% parameter Aging_Interval %}*2+1),'-',({% parameter Aging_Interval %}*3),' Days'),
        (if((date_diff(cast({% parameter Key_Date %} as Date),${TABLE}.NetDueDate, DAY)>(({% parameter Aging_Interval %}*3)+1)),concat('> ',({% parameter Aging_Interval %}*3),' Days'),'Due after Key Date' )) )) )) ) ;;
  }

  dimension: Local_Currency_Key{
    type: string
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: Accounts_Receivable_Global_Currency {
    type: number
    sql: round(${Accounts_Receivable_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Sold_to_Party_Country {
    type:  string
    sql: ${TABLE}.CountryKey_LAND1 ;;
  }

  dimension: Sold_to_Party_Name {
    type:  string
    sql: ${TABLE}.NAME1_NAME1 ;;
  }

  dimension: Sold_to_Party_City {
    type:  string
    sql: ${TABLE}.City_ORT01;;
  }

  dimension: Company_City {
    type:  string
    sql: ${TABLE}.Company_City;;
  }

  dimension: Company_Name {
    type: string
    sql: ${TABLE}.CompanyText_BUTXT ;;
  }

  dimension: Company_Country {
    type:  string
    sql: ${TABLE}.Company_Country ;;
  }

  dimension: Accounting_Document {
    type: string
    sql: ${TABLE}.AccountingDocumentNumber_BELNR ;;
  }

  dimension: Accounts_Receivable_Local_Currency{
    type: number
    sql: ${TABLE}.AccountsReceivable ;;
  }

  dimension: Bad_Debt_Local_Currency {
    type: number
    sql: ${TABLE}.BadDebt_DMBTR ;;
  }

  dimension: Bad_Debt_Global_Currency {
    type: number
    sql: round(${Bad_Debt_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Billing_Document {
    type: string
    sql: ${TABLE}.BillingDocument_VBELN ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: Cash_Discount_1 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CashDiscountDate1 ;;
  }

  dimension_group: Cash_Discount_2 {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.CashDiscountDate2 ;;
  }

  dimension: Cleared_after_Due_date_Local_Currency{
    type: number
    sql: ${TABLE}.ClearedAfterDueDate ;;
  }

  dimension: Cleared_after_Due_date_Global_Currency {
    type: number
    sql: round(${Cleared_after_Due_date_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Cleared_on_or_before_Due_date_Local_Currency {
    type: number
    sql: ${TABLE}.ClearedOnOrBeforeDueDate ;;
  }

  dimension: Cleared_on_or_before_Due_date_Global__Currency {
    type: number
    sql: round(${Cleared_on_or_before_Due_date_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Client_ID {
    type: string
    sql: ${TABLE}.Client_MANDT ;;
  }

  dimension: Company_Code {
    type: string
    sql: ${TABLE}.CompanyCode_BUKRS ;;
  }

  dimension: Sold_to_Party_Number {
    type: string
    sql: ${TABLE}.CustomerNumber_KUNNR ;;
  }

  dimension_group: Document {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DocumentDateInDocument_BLDAT ;;
  }

  dimension: Doubtful_Receivables_Local_Currency {
    type: number
    sql: ${TABLE}.DoubtfulReceivables ;;
  }

  dimension: Doubtful_Receivables_Global_Currency{
    type: number
    sql: round(${Doubtful_Receivables_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Exchange_Rate_Type {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  dimension: fiscal_year_gjahr {
    label: "Fiscal Year"
    type: string
    hidden: no
    sql: ${TABLE}.FiscalYear_GJAHR ;;
  }

  dimension: Invoice_to_which_the_Transaction_belongs {
    type: string
    sql: ${TABLE}.InvoiceToWhichTheTransactionBelongs_REBZG ;;
  }

  dimension_group: Net_Due {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.NetDueDate ;;
  }

  dimension: Accounting_Document_Items {
    type: string
    sql: ${TABLE}.NumberOfLineItemWithinAccountingDocument_BUZEI ;;
  }

  dimension: Open_and_Not_Due_Local_Currency {
    type: number
    sql: ${TABLE}.OpenAndNotDue ;;
  }

  dimension: Open_and_Not_Due_Global_Currency{
    type: number
    sql: round(${Open_and_Not_Due_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Open_and_Over_Due_Local_Currency{
    type: number
    sql: ${TABLE}.OpenAndOverDue ;;
  }

  dimension: Open_and_Over_Due_Global_Currency{
    type: number
    sql: round(${Open_and_Over_Due_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension_group: Posting {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.PostingDateInTheDocument_BUDAT ;;
  }



  dimension: Sales_Local_Currency {
    type: number
    sql: ${TABLE}.Sales ;;
  }


  dimension: Sales_Global_Currency{
    type: number
    sql: round(${Sales_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Written_off_Amount_Local_Currency {
    type: number
    sql: ${TABLE}.WrittenOffAmount_DMBTR ;;
  }

  dimension: Written_off_Amount {
    type: number
    sql: round(${Written_off_Amount_Local_Currency} * ${currency_conversion_new.ukurs},2) ;;
  }

  dimension: Days_in_Arrear {
    type: number
    sql: date_diff(${Net_Due_date},cast({% parameter Key_Date %} as date),Day) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: Sales_Total_DSO {
    type: sum
    hidden: yes
    sql:
      CASE
        when CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)<= CAST(CURRENT_DATE() as Date) and CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)>= DATE_SUB(CAST(CURRENT_DATE() as Date),INTERVAL {% parameter Day_Sales_Outstanding %} MONTH )
      THEN ${Sales_Global_Currency}
      END;;
    #sql:
    #CASE
    #when CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)<= CAST(CURRENT_DATE() as Date) and CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)>= DATE_SUB(${Current_Fiscal_Date_date},INTERVAL {% parameter Day_Sales_Outstanding %} MONTH )
    #THEN ${Sales_Global_Currency}
    #END;;
    }

  measure: AccountsRecievables_Total_DSO {
    type: sum
    hidden: yes
    sql:
    CASE
      when CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)<= CAST(CURRENT_DATE() as Date) and CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)>= DATE_SUB(CAST(CURRENT_DATE() as Date),INTERVAL {% parameter Day_Sales_Outstanding %} MONTH )
    THEN ${Accounts_Receivable_Global_Currency}
    END;;
  #sql:
  #CASE
  #when CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)<= CAST(CURRENT_DATE() as Date) and CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)>= DATE_SUB(${Current_Fiscal_Date_date},INTERVAL {% parameter Day_Sales_Outstanding %} MONTH )
  #THEN ${Accounts_Receivable_Global_Currency}
  #END;;
    }

  dimension: PeriodCalc {
    label: "Fiscal Year / Period"
    description: "Fiscal Year + Period in format YYYYPPP"
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: Fiscal_Period {
    type: string
    sql: SUBSTRING(${PeriodCalc}, 6,2) ;;
  }

  dimension_group: Fiscal_Date {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql:PARSE_DATE('%m/%Y',  Concat(cast(Cast(SUBSTRING(${PeriodCalc},6,2) as int) as string),'/',SUBSTRING(${PeriodCalc},1,4)));;
  }

  dimension: Current_PeriodCalc {
    hidden: yes
    type: string
    sql: ${TABLE}.Current_Period ;;
  }

  dimension: Current_Fiscal_Year {
    hidden: yes
    type: string
    sql: SUBSTRING(${Current_PeriodCalc}, 1,4) ;;
  }

  dimension: Current_Fiscal_Period {
    hidden: yes
    type: string
    sql: SUBSTRING(${Current_PeriodCalc}, 6,2) ;;
  }

  dimension_group: Current_Fiscal_Date {
    type: time
    hidden: yes
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql:PARSE_DATE('%m/%Y',  Concat(cast(Cast(SUBSTRING(${Current_PeriodCalc},6,2) as int) as string),'/',SUBSTRING(${Current_PeriodCalc},1,4)));;
  }

  dimension: Global_Currency_Key {
    type: string
    sql: {% parameter Currency_Required %} ;;
  }

  dimension: Current_Date{
    type: date
    sql: cast((CURRENT_TIMESTAMP()) as timestamp) ;;
    html: {{ rendered_value | date: "%m-%d-%Y" }} ;;
  }

  measure: Current {
    type: date
    sql: ${Current_Date} ;;
  }

  measure: Total_DSO {
    type: number
    sql: floor(if(${Sales_Total_DSO}=0,0,(${AccountsRecievables_Total_DSO}/${Sales_Total_DSO})*{% parameter Day_Sales_Outstanding %}*30)) ;;
    #sql: floor(if(${Sales_Total_DSO}=0,0,(${AccountsRecievables_Total_DSO}/${Sales_Total_DSO})*date_diff(DATE_SUB(${Current_Fiscal_Date_date},INTERVAL {% parameter Day_Sales_Outstanding %} MONTH ),${Current},days))) ;;

    link: {
      label: "Day Sales Outstanding"
      url: "/dashboards/cortex_sap_operational::day_sales_outstanding?"
    }
  }
  measure: DSO{
    type: number
    sql: floor(if(${Sales_Total_DSO}=0,0,(${AccountsRecievables_Total_DSO}/${Sales_Total_DSO})*{% parameter Day_Sales_Outstanding %}*30)) ;;
  }

  measure: Sum_of_Open_and_Over_Due_Local_Currency{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Open_and_Over_Due_Global_Currency};;
#     html: <a href="#drillmenu" target="_self">
#     {% if value < 0 %}
#     {% assign abs_value = value | times: -1.0 %}
#     {% assign pos_neg = '-' %}
#     {% else %}
#     {% assign abs_value = value | times: 1.0 %}
#     {% assign pos_neg = '' %}
#     {% endif %}

#     {% if abs_value >=1000000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#     {% elsif abs_value >=1000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#     {% elsif abs_value >=1000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#     {% else %}
#     {{pos_neg}}{{ abs_value }}
#     {% endif %}
#     ;;
    link: {
      label: "Overdue Recievables"
      url: "/dashboards/cortex_sap_operational::overdue_receivables?"
    }
  }

  measure: Sum_of_Receivables{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Accounts_Receivable_Global_Currency} ;;
#     html: <a href="#drillmenu" target="_self">
#           {% if value < 0 %}
#           {% assign abs_value = value | times: -1.0 %}
#           {% assign pos_neg = '-' %}
#           {% else %}
#           {% assign abs_value = value | times: 1.0 %}
#           {% assign pos_neg = '' %}
#           {% endif %}

#           {% if abs_value >=1000000000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#           {% elsif abs_value >=1000000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#           {% elsif abs_value >=1000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#           {% else %}
#           {{pos_neg}}{{ abs_value }}
#           {% endif %}
#           ;;
  }

  measure: Sum_of_Sales{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Sales_Global_Currency} ;;
#     html: <a href="#drillmenu" target="_self">
#           {% if value < 0 %}
#           {% assign abs_value = value | times: -1.0 %}
#           {% assign pos_neg = '-' %}
#           {% else %}
#           {% assign abs_value = value | times: 1.0 %}
#           {% assign pos_neg = '' %}
#           {% endif %}

#           {% if abs_value >=1000000000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#           {% elsif abs_value >=1000000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#           {% elsif abs_value >=1000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#           {% else %}
#           {{pos_neg}}{{ abs_value }}
#           {% endif %}
#           ;;
  }

  measure: Total_Receivables{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Accounts_Receivable_Global_Currency} ;;
#     html: <a href="#drillmenu" target="_self">
#     {% if value < 0 %}
#     {% assign abs_value = value | times: -1.0 %}
#     {% assign pos_neg = '-' %}
#     {% else %}
#     {% assign abs_value = value | times: 1.0 %}
#     {% assign pos_neg = '' %}
#     {% endif %}

#     {% if abs_value >=1000000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#     {% elsif abs_value >=1000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#     {% elsif abs_value >=1000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#     {% else %}
#     {{pos_neg}}{{ abs_value }}
#     {% endif %}
#     ;;
    link: {
      label: "Total Recievables"
      url: "/dashboards/cortex_sap_operational::total_receivable?"
    }
  }

  measure: Total_Doubtful_Receivables{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Doubtful_Receivables_Global_Currency} ;;
#     html: <a href="#drillmenu" target="_self">
#     {% if value < 0 %}
#     {% assign abs_value = value | times: -1.0 %}
#     {% assign pos_neg = '-' %}
#     {% else %}
#     {% assign abs_value = value | times: 1.0 %}
#     {% assign pos_neg = '' %}
#     {% endif %}

#     {% if abs_value >=1000000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#     {% elsif abs_value >=1000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#     {% elsif abs_value >=1000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#     {% else %}
#     {{pos_neg}}{{ abs_value }}
#     {% endif %}
#     ;;
    link: {
      label: "Doubtful Recievables"
      url: "/dashboards/cortex_sap_operational::doubtful_receivable?"
    }
  }

  measure: Sum_Doubtful_Receivables{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Doubtful_Receivables_Global_Currency} ;;
#     html: <a href="#drillmenu" target="_self">
#           {% if value < 0 %}
#           {% assign abs_value = value | times: -1.0 %}
#           {% assign pos_neg = '-' %}
#           {% else %}
#           {% assign abs_value = value | times: 1.0 %}
#           {% assign pos_neg = '' %}
#           {% endif %}

#           {% if abs_value >=1000000000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#           {% elsif abs_value >=1000000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#           {% elsif abs_value >=1000 %}
#           {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#           {% else %}
#           {{pos_neg}}{{ abs_value }}
#           {% endif %}
#           ;;
  }

  measure: OverDue_Amount{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Open_and_Over_Due_Global_Currency};;
#     html: <a href="#drillmenu" target="_self">
#     {% if value < 0 %}
#     {% assign abs_value = value | times: -1.0 %}
#     {% assign pos_neg = '-' %}
#     {% else %}
#     {% assign abs_value = value | times: 1.0 %}
#     {% assign pos_neg = '' %}
#     {% endif %}

#     {% if abs_value >=1000000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#     {% elsif abs_value >=1000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#     {% elsif abs_value >=1000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#     {% else %}
#     {{pos_neg}}{{ abs_value }}
#     {% endif %};;
  }

  measure: Over_Due_Amount{
    type: sum
    value_format_name: Greek_Number_Format
    sql: ${Open_and_Over_Due_Global_Currency};;
#     html: <a href="#drillmenu" target="_self">
#     {% if value < 0 %}
#     {% assign abs_value = value | times: -1.0 %}
#     {% assign pos_neg = '-' %}
#     {% else %}
#     {% assign abs_value = value | times: 1.0 %}
#     {% assign pos_neg = '' %}
#     {% endif %}

#     {% if abs_value >=1000000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#     {% elsif abs_value >=1000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#     {% elsif abs_value >=1000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#     {% else %}
#     {{pos_neg}}{{ abs_value }}
#     {% endif %};;
  }

  measure: Due_Amount{
    type: number
    value_format_name: Greek_Number_Format
    sql: ${Total_Receivables}-${OverDue_Amount} ;;
#     html: <a href="#drillmenu" target="_self">
#     {% if value < 0 %}
#     {% assign abs_value = value | times: -1.0 %}
#     {% assign pos_neg = '-' %}
#     {% else %}
#     {% assign abs_value = value | times: 1.0 %}
#     {% assign pos_neg = '' %}
#     {% endif %}

#     {% if abs_value >=1000000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
#     {% elsif abs_value >=1000000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
#     {% elsif abs_value >=1000 %}
#     {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
#     {% else %}
#     {{pos_neg}}{{ abs_value }}
#     {% endif %};;
  }

  measure: count {
    type: count
    drill_fields: []
  }
    }
