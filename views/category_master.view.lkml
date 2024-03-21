view: category_master {
  sql_table_name: "DATA_SETS"."Category_Master" ;;

  dimension: category_id {
    type: number
    sql: ${TABLE}."category_ID" ;;
  }
  dimension: product_category {
    type: string
    sql: ${TABLE}."product_category" ;;
  }
  measure: count {
    type: count
  }
}
