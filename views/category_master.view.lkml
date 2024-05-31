include: "/views/product_master.view.lkml"

view: product_inheritance {
  extends: [product_master]

  dimension: category_id {hidden: yes}
  }

view: category_master {
  drill_fields: [category_id]
  derived_table: {
    sql:
          SELECT
            *
          FROM
            "DATA_SETS"."Category_Master"
          ;;
  }
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
  dimension: category_source {
    type: yesno
    label: "製品カテゴリ(フィルター用)"
    sql:${TABLE}."product_category" = 'ジャム','キャンディ' ;;
  }
  measure: count {
    type: count
    drill_fields: [category_id]
  }
}
