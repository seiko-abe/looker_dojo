view: store_filters {
  derived_table: {
    sql: SELECT
          store_id AS "店舗ID",
          store_prefecture AS "店舗都道府県",
      FROM "DATA_SETS"."Store_Master"
      WHERE {% condition select_resion %} Store_Master.store_prefecture {% endcondition %}
      GROUP BY
          1,
          2 ;;
  }
  filter: store_prefecture {
    label: "店舗都道府県(フィルター用)"
    type: string
  }
  :
}
