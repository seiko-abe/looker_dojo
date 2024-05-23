view: store_filters {
  derived_table: {
    sql:
            SELECT
              *
            FROM
              "DATA_SETS"."Store_Master"
            WHERE
              "Store_Area"  = {% parameter parameter_area %}
          ;;
  }
  parameter: parameter_area {
    type: string
  }
  dimension: store_id {
    # primary_key: yes
    type: string
    label: "店舗ID"
    sql: ${TABLE}."Store_ID" ;;
  }
  dimension: store_name {
    type: string
    label: "店舗名"
    sql: ${TABLE}."Store_Name" ;;
  }
  dimension: store_area {
    type: string
    label: "店舗エリア"
    sql: ${TABLE}."Store_Area" ;;
  }
}
