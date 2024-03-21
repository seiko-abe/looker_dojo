view: member_info {
  sql_table_name: "DATA_SETS"."Member_Info" ;;

  dimension: birthday {
    type: string
    sql: ${TABLE}."Birthday" ;;
  }
  dimension: customer_city {
    type: string
    sql: ${TABLE}."Customer_City" ;;
  }
  dimension: customer_id {
    type: number
    sql: ${TABLE}."Customer_ID" ;;
  }
  dimension: customer_prefecture {
    type: string
    sql: ${TABLE}."Customer_Prefecture" ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}."Gender" ;;
  }
  dimension: member_registration_date {
    type: string
    sql: ${TABLE}."Member_Registration_Date" ;;
  }
  dimension: number_of_members {
    type: number
    sql: ${TABLE}."Number_of_Members" ;;
  }
  measure: count {
    type: count
  }
}
