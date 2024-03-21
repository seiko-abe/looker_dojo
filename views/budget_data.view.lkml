view: budget_data {
  sql_table_name: "DATA_SETS"."Budget_Data" ;;
  drill_fields: [store_id]

  dimension: store_id {
    type: string
    sql: ${TABLE}."店舗ID" ;;
  }
  dimension: budget_year {
    type: string
    sql: ${TABLE}."予算年月" ;;
  }
  dimension: budget_amount {
    type: number
    label: "合計予算"
    sql: ${TABLE}."予算額" ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id]
  }
}
