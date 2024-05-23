view: category_master {
  sql_table_name: "DATA_SETS"."Category_Master" ;;
  drill_fields: [category_id]

  dimension: category_id {
    type: number
    label: "カテゴリID"
    sql: ${TABLE}."category_ID" ;;
  }
  dimension: product_category {
    type: string
    label: "製品カテゴリ"
    sql: ${TABLE}."product_category" ;;
  }

  measure: count {
    type: count
    drill_fields: [category_id]
  }
}
