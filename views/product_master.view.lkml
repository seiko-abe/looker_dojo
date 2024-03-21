view: product_master {
  sql_table_name: "DATA_SETS"."Product_Master" ;;

  dimension: category_id {
    type: number
    sql: ${TABLE}."Category_ID" ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}."Product_ID" ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}."Product_Name" ;;
  }
  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
