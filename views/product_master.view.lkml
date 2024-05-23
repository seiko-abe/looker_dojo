view: product_master {
  drill_fields: [product_id]
  derived_table: {
    sql:
      SELECT
        *
      FROM
        "DATA_SETS"."Product_Master"
    ;;
  }
  dimension: category_id {
    type: number
    label: "カテゴリID"
    sql: ${TABLE}."Category_ID" ;;
  }
  dimension: product_id {
    primary_key: yes
    type: number
    label: "製品ID"
    sql: ${TABLE}."Product_ID" ;;
  }
  dimension: product_name {
    type: string
    label: "製品名"
    sql: ${TABLE}."Product_Name" ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, category_id, .count]
  }
}
