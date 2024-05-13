view: sales_data {
  sql_table_name: "DATA_SETS"."Sales_Data" ;;
  drill_fields: [store_id]

  dimension: store_id {
    type: number
    label: "店舗ID"
    sql: ${TABLE}."Store_ID" ;;
  }
  dimension: customer_id {
    primary_key: yes
    type: number
    label: "顧客ID"
    sql: ${TABLE}."Customer_ID" ;;
  }
  dimension: product_id {
    type: number
    label: "製品ID"
    sql: ${TABLE}."Product_ID" ;;
  }
  # dimension: sales_date {
  #   type: string
  #   label: "売上日"
  #   sql: ${TABLE}."Sales_Date" ;;
  # }

  dimension_group: period {
    type: time
    datatype: datetime
    timeframes: [
      date,
      week,
      month
    ]
    sql: DATE_TRUNC('month', TO_DATE(${TABLE}."Sales_Date", 'YYYY/MM/DD')) ;;
  }

  dimension: sales_date {
    type: date
    label: "売上月"
    sql: DATE_TRUNC('month', TO_DATE(${TABLE}."Sales_Date", 'YYYY/MM/DD')) ;;
  }

  dimension: cost_of_sales {
    type: string
    label: "原価"
    sql: ${TABLE}."Cost_of_Sales" ;;
  }
  dimension: cost_of_sales_comparison {
    type: yesno
    sql:  ${TABLE}."Cost_of_Sales" >= 500 ;;
  }
  dimension: gross_profit {
    type: string
    label: "荒利"
    sql: ${TABLE}."Gross_Profit" ;;
  }
  dimension: quantity {
    type: string
    label: "数量"
    sql: ${TABLE}."Quantity" ;;
  }
  dimension: sales {
    type: string
    label: "売上"
    sql: ${TABLE}."Sales" ;;
  }

  dimension: voucher_number {
    type: string
    label: "伝票番号"
    sql: ${TABLE}."Voucher_Number" ;;
  }
  dimension: order_date_key {
    type: number
    label: "受注日付KEY"
    sql: ${TABLE}."Order_date_KEY" ;;
  }

  measure: sales_amount {
    type: sum
    label: "売上金額"
    sql: abs(${TABLE}."Sales");;
  }
  measure: quantity_amount {
    type: sum
    label: "売上数量"
    sql: abs(${TABLE}."Quantity");;
  }
  measure: count {
    type: count
    drill_fields: [store_id, product_id, customer_id, .count]
  }
}
