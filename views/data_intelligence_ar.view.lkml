view: data_intelligence_ar {
  sql_table_name: `@{GCP_PROJECT}.@{REPORTING_DATASET}.AccountingDocumentsReceivable`
    ;;

  parameter: Aging_Interval {
    type: number
    default_value: "10"
  }

  dimension: key {
    type: string
   primary_key: yes
    sql: CONCAT(${Client_ID},${Accounting_Document},${Company_Code},${fiscal_year},${Accounting_Document_Items});;
  }

  # parameter: Currency_Required{
  #   type: string
  #   allowed_value: {
  #     label: "USD"
  #     value: "USD"
  #   }
  #   allowed_value: {
  #     label: "EUR"
  #     value: "EUR"
  #   }
  #   allowed_value: {
  #     label: "CAD"
  #     value: "CAD"
  #   }
  #   allowed_value: {
  #     label: "JPY"
  #     value: "JPY"
  #   }
  # }

  # dimension: Global_Currency_Key {
  #   type: string
  #   sql: {% parameter Currency_Required %} ;;
  # }

  parameter: Day_Sales_Outstanding {
    type: number
    description: "Enter the No.of Period"
    default_value: "2"
  }

  parameter: Key_Date {
    type: date
  }

  dimension: Past_Due_Interval{
    type: string
    sql: if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)>0 and date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)<({% parameter Aging_Interval %}+1)),concat('1- ',({% parameter Aging_Interval %}),' Days'),
        (if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)<(({% parameter Aging_Interval %}*2)+1)),concat(({% parameter Aging_Interval %}+1),'-',({% parameter Aging_Interval %}*2),' Days'),
        (if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)<(({% parameter Aging_Interval %}*3)+1)),concat(({% parameter Aging_Interval %}*2+1),'-',({% parameter Aging_Interval %}*3),' Days'),
        (if((date_diff(cast(current_date() as Date),${TABLE}.NetDueDate, DAY)>(({% parameter Aging_Interval %}*3)+1)),concat('> ',({% parameter Aging_Interval %}*3),' Days'),'Due after Key Date' )) )) )) ) ;;
  }

  dimension: Local_Currency_Key{
    type: string
   #primary_key: yes
    sql: ${TABLE}.CurrencyKey_WAERS ;;
  }

  dimension: Accounts_Receivable_Global_Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${Accounts_Receivable_Local_Currency} * ${currency_conversion_new.ukurs} ;;
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
    value_format_name: Greek_Number_Format
    sql: ${TABLE}.AccountsReceivable ;;
  }

  dimension: Bad_Debt_Local_Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${TABLE}.BadDebt_DMBTR ;;

  }

  dimension: Bad_Debt_Global_Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${Bad_Debt_Local_Currency} * ${currency_conversion_new.ukurs} ;;
  }

  dimension: Billing_Document {
    type: string
    sql: ${TABLE}.BillingDocument_VBELN ;;
  }

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
    value_format_name: Greek_Number_Format
    sql: ${TABLE}.ClearedAfterDueDate ;;
  }

  dimension: Cleared_after_Due_date_Global_Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${Cleared_after_Due_date_Local_Currency} * ${currency_conversion_new.ukurs} ;;
  }

  dimension: Cleared_on_or_before_Due_date_Local_Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${TABLE}.ClearedOnOrBeforeDueDate ;;
  }

  dimension: Cleared_on_or_before_Due_date_Global__Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${Cleared_on_or_before_Due_date_Local_Currency} * ${currency_conversion_new.ukurs} ;;
  }

  dimension: Client_ID {
    type: string
   #primary_key: yes
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
    value_format_name: Greek_Number_Format
  }

  dimension: Doubtful_Receivables_Global_Currency{
    type: number
    sql: ${Doubtful_Receivables_Local_Currency} * ${currency_conversion_new.ukurs} ;;
    value_format_name: Greek_Number_Format
  }

  dimension: Exchange_Rate_Type {
    type: string
    sql: ${TABLE}.ExchangeRateType_KURST ;;
  }

  dimension: Invoice_to_which_the_Transaction_belongs {
    type: string
    sql: ${TABLE}.InvoiceToWhichTheTransactionBelongs_REBZG ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}.FiscalYear_GJAHR ;;
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
    value_format_name: Greek_Number_Format
  }

  dimension: Open_and_Not_Due_Global_Currency{
    type: number
    sql: ${Open_and_Not_Due_Local_Currency} * ${currency_conversion_new.ukurs} ;;
    value_format_name: Greek_Number_Format
  }

  dimension: Open_and_Over_Due_Local_Currency{
    type: number
    sql: ${TABLE}.OpenAndOverDue ;;
    value_format_name: Greek_Number_Format
  }

  dimension: Open_and_Over_Due_Global_Currency{
    type: number
    sql: ${Open_and_Over_Due_Local_Currency} * ${currency_conversion_new.ukurs} ;;
    value_format_name: Greek_Number_Format
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

  dimension: Posting_date_date {
    type: date
    datatype: date
   #primary_key: yes
    sql: ${Posting_date} ;;
  }



  dimension: Sales_Local_Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${TABLE}.Sales ;;
  }

  dimension: Sales_Global_Currency{
    type: number
    value_format_name: Greek_Number_Format
    sql: ${Sales_Local_Currency} * ${currency_conversion_new.ukurs} ;;
  }

  dimension: Written_off_Amount_Local_Currency {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${TABLE}.WrittenOffAmount_DMBTR ;;
  }

  dimension: Written_off_Amount {
    type: number
    value_format_name: Greek_Number_Format
    sql: ${Written_off_Amount_Local_Currency} * ${currency_conversion_new.ukurs} ;;
  }

  dimension: Days_in_Arrear {
    type: number
    sql: date_diff(${Net_Due_date},cast(current_date() as date),Day) ;;
  }

  measure: Sales_Total_DSO {
    type: sum
    hidden: yes
    value_format_name: Greek_Number_Format
    sql:
      CASE
        when CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)<= CAST(CURRENT_DATE() as Date) and CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)>= DATE_SUB(CAST(CURRENT_DATE() as Date),INTERVAL {% parameter Day_Sales_Outstanding %} MONTH )
      THEN ${Sales_Global_Currency}
      END;;
  }

  measure: AccountsRecievables_Total_DSO {
    type: sum
    hidden: yes
    value_format_name: Greek_Number_Format
    sql:
      CASE
        when CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)<= CAST(CURRENT_DATE() as Date) and CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)>= DATE_SUB(CAST(CURRENT_DATE() as Date),INTERVAL {% parameter Day_Sales_Outstanding %} MONTH )
      THEN ${Accounts_Receivable_Global_Currency}
      END;;
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
    measure: Min_period {
      type: date
      sql: min(${Current_Fiscal_Date_date}) ;;
    }

  dimension: Current_Date{
    type: date
    sql: cast((CURRENT_TIMESTAMP()) as timestamp) ;;
    html: {{ rendered_value | date: "%m-%d-%Y" }} ;;
  }

  measure: Current {
    hidden: yes
    type: max
    sql: ${Current_Date} ;;
  }

  measure: no_of_days {
    hidden: yes
    type: max
    sql:
    CASE
      when CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)<= CAST(CURRENT_DATE() as Date) and CAST(${TABLE}.PostingDateInTheDocument_BUDAT as Date)>= DATE_SUB(CAST(CURRENT_DATE() as Date),INTERVAL {% parameter Day_Sales_Outstanding %} MONTH )
    THEN date_diff(current_date(),${Fiscal_Date_date},DAY)
    END;;
  }

  measure: Total_DSO {
    type: number
    value_format_name: Greek_Number_Format
    sql: floor(if(${Sales_Total_DSO}=0,0,(${AccountsRecievables_Total_DSO}/${Sales_Total_DSO})*{% parameter Day_Sales_Outstanding %}*30)) ;;

    link: {
      label: "Day Sales Outstanding"
      url: "/dashboards/cortex_infosys::sap_finance_ar_06_a_days_sales_outstanding?"
    }
  }
  measure: DSO{
    type: number
    value_format_name: Greek_Number_Format
    sql: floor(if(${Sales_Total_DSO}=0,0,(${AccountsRecievables_Total_DSO}/${Sales_Total_DSO})*{% parameter Day_Sales_Outstanding %}*30)) ;;
  }

  measure: Sum_of_Open_and_Over_Due_global_Currency{
    type: sum
    sql: ${Open_and_Over_Due_Global_Currency};;
    value_format_name: Greek_Number_Format
    link: {
      label: "Overdue Receivables"
      url: "/dashboards/cortex_infosys::sap_finance_ar_06_c_overdue_receivables?"
    }
  }

  measure: Sum_of_Receivables{
    type: sum
    sql: ${Accounts_Receivable_Global_Currency} ;;
    value_format_name: Greek_Number_Format
  }

  measure: Sum_of_Sales{
    type: sum
    sql: ${Sales_Global_Currency} ;;
    value_format_name: Greek_Number_Format
  }

  measure: Total_Receivables{
    type: sum
    sql: ${Accounts_Receivable_Global_Currency} ;;
    value_format_name: Greek_Number_Format
    link: {
      label: "Total Receivables"
      url: "/dashboards/cortex_infosys::sap_finance_ar_06_d_total_receivables?"
      }
    }

  measure: Total_Doubtful_Receivables{
    type: sum
    sql: ${Doubtful_Receivables_Global_Currency} ;;
    value_format_name: Greek_Number_Format
    link: {
      label: "Doubtful Receivables"
      url: "/dashboards/cortex_infosys::sap_finance_ar_06_b_doubtful_receivables?"
    }
  }

  measure: Sum_Doubtful_Receivables{
    type: sum
    sql: ${Doubtful_Receivables_Global_Currency} ;;
    value_format_name: Greek_Number_Format
  }

  measure: OverDue_Amount{
    type: sum
    sql: ${Open_and_Over_Due_Global_Currency};;
    value_format_name: Greek_Number_Format
  }

  measure: Due_Amount{
    type: number
    sql: ${Total_Receivables}-${OverDue_Amount} ;;
    value_format_name: Greek_Number_Format
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
