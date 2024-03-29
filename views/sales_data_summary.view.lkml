view: sales_data_summary {
  derived_table: {
    sql:
      SELECT
        Sales_Data."store_id" AS shop_id,
        DATE_TRUNC('MONTH', DATE(Sales_Data."sales_date", 'YYYY/MM/DD')) AS "売上日",
        SUM(Sales_Data."sales") AS "売上"
      FROM
        "DATA_SETS"."Sales_Data" AS sales_data
      GROUP BY
        shop_id, sales_date
    ;;
  }

  dimension: sales_day_2019 {
    type: date
    label: "2019年売上日"
    sql: ${TABLE}."sales_date";;
  }

  dimension: sales_day_2020 {
    type: date
    label: "2020年売上日"
    sql:DATEADD(year, 1, sales_data_summary."sales_date");;
  }

  measure: sales_amount_2019 {
    type: sum
    label: "2019年売上金額"
    sql: ${TABLE}."sales";;
  }

  measure: sales_amount_2020 {
    type: sum
    label: "2020年売上金額"
    sql: ${TABLE}."sales";;
  }
}
