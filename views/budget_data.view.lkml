view: budget_data {
  sql_table_name: "DATA_SETS"."Budget_Data" ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: string
    label: "店舗ID"
    sql: ${TABLE}."Store_ID" ;;
  }
  dimension: budget_year {
    type: string
    label: "予算年月"
    sql: ${TABLE}."Budget_Year" ;;
  }
  dimension: budget_amount {
    type: number
    label: "予算額"
    sql: ${TABLE}."Budget_Amount" ;;
  }
  measure: budget_total {
    type: sum
    label: "合計予算"
    sql: ${TABLE}."Budget_Amount";;
  }
  measure: count {
    type: count
    drill_fields: [store_id]
  }
}
