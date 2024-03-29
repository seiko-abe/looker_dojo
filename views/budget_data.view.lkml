view: budget_data {
  sql_table_name: "DATA_SETS"."Budget_Data" ;;
  drill_fields: [store_id]

  dimension: store_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."store_id" ;;
  }
  dimension: budget_year {
    type: string
    sql: ${TABLE}."budget_year" ;;
  }
  dimension: budget_amount {
    type: number
    label: "合計予算"
    sql: ${TABLE}."budget_amount" ;;
  }
  measure: budget_total {
    type: sum
    label: "合計予算額"
    sql: ${TABLE}."budget_amount";;
  }
  measure: count {
    type: count
    drill_fields: [store_id]
  }
}
