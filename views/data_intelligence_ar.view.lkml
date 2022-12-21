# The name of this view in Looker is "Data Intelligence Ar"
view: data_intelligence_ar {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.AccountingDocumentsReceivables`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.
  parameter: Aging_Interval {
    type: number
    default_value: "10"
  }
  parameter: Currency_Required{
    type: string
    allowed_value: {
      label: "USD"
      value: "USD"
    }
    allowed_value: {
      label: "EUR"
      value: "EUR"
    }
    allowed_value: {
      label: "CAD"
      value: "CAD"
    }
    allowed_value: {
      label: "JPY"
      value: "JPY"
    }
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
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Accounts_Receivable_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Accounts_Receivable_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
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
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Bad_Debt_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Bad_Debt_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
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
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Cleared_after_Due_date_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Cleared_after_Due_date_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }

  dimension: Cleared_on_or_before_Due_date_Local_Currency {
    type: number
    sql: ${TABLE}.ClearedOnOrBeforeDueDate ;;
  }

  dimension: Cleared_on_or_before_Due_date_Global__Currency {
    type: number
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Cleared_on_or_before_Due_date_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Cleared_on_or_before_Due_date_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
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
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Doubtful_Receivables_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Doubtful_Receivables_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }

  dimension: Exchange_Rate_Type {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  #dimension: Fiscal_Year {
   # type: string
   # sql: ${TABLE}.FiscalYear_GJAHR ;;
  #}

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
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Open_and_Not_Due_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Open_and_Not_Due_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }

  dimension: Open_and_Over_Due_Local_Currency{
    type: number
    sql: ${TABLE}.OpenAndOverDue ;;
  }

  dimension: Open_and_Over_Due_Global_Currency{
    type: number
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Open_and_Over_Due_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Open_and_Over_Due_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
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
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Sales_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Sales_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
  }

  dimension: Written_off_Amount_Local_Currency {
    type: number
    sql: ${TABLE}.WrittenOffAmount_DMBTR ;;
  }

  dimension: Written_off_Amount {
    type: number
    sql: Round(if(${Local_Currency_Key}={% parameter Currency_Required %}  ,${Written_off_Amount_Local_Currency},`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Conversion( ${Client_ID},${Exchange_Rate_Type} ,${Local_Currency_Key},{% parameter Currency_Required %},${Posting_date},${Written_off_Amount_Local_Currency})),ifnull(CAST(`@{GCP_PROJECT}`.@{REPORTING_DATASET}.Currency_Decimal({% parameter Currency_Required %}) AS int),2)) ;;
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
    hidden: yes
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: Fiscal_Year {
    type: string
    sql: split(Period,'|')[OFFSET(0)] ;;
  }

  dimension: Fiscal_Period {
    type: string
    sql: split(Period,'|')[OFFSET(1)] ;;
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
    sql:PARSE_DATE('%m/%Y',  Concat(cast(Cast(split(Period,'|')[OFFSET(1)] as int) as string),'/',split(Period,'|')[OFFSET(0)]));;
    }

    dimension: Current_PeriodCalc {
      hidden: yes
      type: string
      sql: ${TABLE}.Current_Period ;;
    }

    dimension: Current_Fiscal_Year {
      hidden: yes
      type: string
      sql: split(Current_Period,'|')[OFFSET(0)] ;;
    }

    dimension: Current_Fiscal_Period {
      hidden: yes
      type: string
      sql: split(Current_Period,'|')[OFFSET(1)] ;;
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
      sql:PARSE_DATE('%m/%Y',  Concat(cast(Cast(split(Current_Period,'|')[OFFSET(1)] as int) as string),'/',split(Current_Period,'|')[OFFSET(0)]));;
      }

  dimension: Global_Currency_Key {
    type: string
    sql: {% parameter Currency_Required %} ;;
  }

  dimension: Current_Date{
    type: date
    sql: current_date() ;;
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
    sql: ${Open_and_Over_Due_Global_Currency};;
    html: <a href="#drillmenu" target="_self">
    {% if value < 0 %}
    {% assign abs_value = value | times: -1.0 %}
    {% assign pos_neg = '-' %}
    {% else %}
    {% assign abs_value = value | times: 1.0 %}
    {% assign pos_neg = '' %}
    {% endif %}

    {% if abs_value >=1000000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
    {% elsif abs_value >=1000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
    {% elsif abs_value >=1000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
    {% else %}
    {{pos_neg}}{{ abs_value }}
    {% endif %}
    ;;
    link: {
      label: "Overdue Recievables"
      url: "/dashboards/cortex_sap_operational::overdue_receivables?"
    }
  }

  measure: Sum_of_Receivables{
    type: sum
    sql: ${Accounts_Receivable_Global_Currency} ;;
    html: <a href="#drillmenu" target="_self">
          {% if value < 0 %}
          {% assign abs_value = value | times: -1.0 %}
          {% assign pos_neg = '-' %}
          {% else %}
          {% assign abs_value = value | times: 1.0 %}
          {% assign pos_neg = '' %}
          {% endif %}

          {% if abs_value >=1000000000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
          {% elsif abs_value >=1000000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
          {% elsif abs_value >=1000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
          {% else %}
          {{pos_neg}}{{ abs_value }}
          {% endif %}
          ;;
  }

  measure: Sum_of_Sales{
    type: sum
    sql: ${Sales_Global_Currency} ;;
    html: <a href="#drillmenu" target="_self">
          {% if value < 0 %}
          {% assign abs_value = value | times: -1.0 %}
          {% assign pos_neg = '-' %}
          {% else %}
          {% assign abs_value = value | times: 1.0 %}
          {% assign pos_neg = '' %}
          {% endif %}

          {% if abs_value >=1000000000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
          {% elsif abs_value >=1000000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
          {% elsif abs_value >=1000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
          {% else %}
          {{pos_neg}}{{ abs_value }}
          {% endif %}
          ;;
  }

  measure: Total_Receivables{
    type: sum
    sql: ${Accounts_Receivable_Global_Currency} ;;
    html: <a href="#drillmenu" target="_self">
    {% if value < 0 %}
    {% assign abs_value = value | times: -1.0 %}
    {% assign pos_neg = '-' %}
    {% else %}
    {% assign abs_value = value | times: 1.0 %}
    {% assign pos_neg = '' %}
    {% endif %}

    {% if abs_value >=1000000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
    {% elsif abs_value >=1000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
    {% elsif abs_value >=1000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
    {% else %}
    {{pos_neg}}{{ abs_value }}
    {% endif %}
    ;;
    link: {
      label: "Total Recievables"
      url: "/dashboards/cortex_sap_operational::total_receivable?"
      }
    }

  measure: Total_Doubtful_Receivables{
    type: sum
    sql: ${Doubtful_Receivables_Global_Currency} ;;
    html: <a href="#drillmenu" target="_self">
    {% if value < 0 %}
    {% assign abs_value = value | times: -1.0 %}
    {% assign pos_neg = '-' %}
    {% else %}
    {% assign abs_value = value | times: 1.0 %}
    {% assign pos_neg = '' %}
    {% endif %}

    {% if abs_value >=1000000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
    {% elsif abs_value >=1000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
    {% elsif abs_value >=1000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
    {% else %}
    {{pos_neg}}{{ abs_value }}
    {% endif %}
    ;;
    link: {
      label: "Doubtful Recievables"
      url: "/dashboards/cortex_sap_operational::doubtful_receivable?"
    }
  }

  measure: Sum_Doubtful_Receivables{
    type: sum
    sql: ${Doubtful_Receivables_Global_Currency} ;;
    html: <a href="#drillmenu" target="_self">
          {% if value < 0 %}
          {% assign abs_value = value | times: -1.0 %}
          {% assign pos_neg = '-' %}
          {% else %}
          {% assign abs_value = value | times: 1.0 %}
          {% assign pos_neg = '' %}
          {% endif %}

          {% if abs_value >=1000000000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
          {% elsif abs_value >=1000000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
          {% elsif abs_value >=1000 %}
          {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
          {% else %}
          {{pos_neg}}{{ abs_value }}
          {% endif %}
          ;;
  }

  measure: OverDue_Amount{
    type: sum
    sql: ${Open_and_Over_Due_Global_Currency};;
    html: <a href="#drillmenu" target="_self">
    {% if value < 0 %}
    {% assign abs_value = value | times: -1.0 %}
    {% assign pos_neg = '-' %}
    {% else %}
    {% assign abs_value = value | times: 1.0 %}
    {% assign pos_neg = '' %}
    {% endif %}

    {% if abs_value >=1000000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
    {% elsif abs_value >=1000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
    {% elsif abs_value >=1000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
    {% else %}
    {{pos_neg}}{{ abs_value }}
    {% endif %};;
  }

  measure: Over_Due_Amount{
    type: sum
    sql: ${Open_and_Over_Due_Global_Currency};;
    html: <a href="#drillmenu" target="_self">
    {% if value < 0 %}
    {% assign abs_value = value | times: -1.0 %}
    {% assign pos_neg = '-' %}
    {% else %}
    {% assign abs_value = value | times: 1.0 %}
    {% assign pos_neg = '' %}
    {% endif %}

    {% if abs_value >=1000000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
    {% elsif abs_value >=1000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
    {% elsif abs_value >=1000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
    {% else %}
    {{pos_neg}}{{ abs_value }}
    {% endif %};;
  }

  measure: Due_Amount{
    type: number
    sql: ${Total_Receivables}-${OverDue_Amount} ;;
    html: <a href="#drillmenu" target="_self">
    {% if value < 0 %}
    {% assign abs_value = value | times: -1.0 %}
    {% assign pos_neg = '-' %}
    {% else %}
    {% assign abs_value = value | times: 1.0 %}
    {% assign pos_neg = '' %}
    {% endif %}

    {% if abs_value >=1000000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000000.0 | round: 2 }}B
    {% elsif abs_value >=1000000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000000.0 | round: 2 }}M
    {% elsif abs_value >=1000 %}
    {{pos_neg}}{{ abs_value | divided_by: 1000.0 | round: 2 }}K
    {% else %}
    {{pos_neg}}{{ abs_value }}
    {% endif %};;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}