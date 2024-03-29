view: sales_data_summary {
  derived_table: {
    sql:
      SELECT
        Sales_Data."Store_ID" AS shop_id,
        DATE_TRUNC('MONTH', DATE(Sales_Data."Sales_Date", 'YYYY/MM/DD')) AS "売上日",
        SUM(Sales_Data."Sales") AS "売上"
      FROM
        "DATA_SETS"."Sales_Data" AS sales_data
      GROUP BY
        shop_id,"売上日"
    ;;
  }

  dimension: sales_day_2019 {
    type: date
    label: "2019年売上日"
    sql: ${TABLE}."売上日";;
  }

  dimension: sales_day_2020 {
    type: date
    label: "2020年売上日"
    sql:DATEADD('year', 1, ${sales_data_summary.sales_day_2019});;
  }
  measure: sales_amount_2019 {
    type: sum
    label: "2019年売上金額"
    sql: ${TABLE}."売上";;
  }

  measure: sales_amount_2020 {
    type: sum
    label: "2020年売上金額"
    sql: ${TABLE}."売上";;
  }
}
