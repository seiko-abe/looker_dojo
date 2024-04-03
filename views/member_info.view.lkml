view: member_info {
  sql_table_name: "DATA_SETS"."Member_Info" ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: number
    label: "顧客ID"
    sql: ${TABLE}."Customer_ID" ;;
  }
  dimension: gender {
    type: string
    label: "性別"
    sql: ${TABLE}."Gender" ;;
  }
  dimension: birthday {
    type: string
    label: "誕生日"
    sql: ${TABLE}."Birthday" ;;
  }
  dimension: customer_city {
    type: string
    label: "顧客市区町村"
    sql: ${TABLE}."Customer_City" ;;
  }

  dimension: customer_prefecture {
    type: string
    label: "顧客都道府県"
    sql: ${TABLE}."Customer_Prefecture" ;;
  }

  dimension: member_registration_date {
    type: string
    label: "会員登録日"
    sql: ${TABLE}."Member_Registration_Date" ;;
  }
  dimension: number_of_members {
    type: number
    label: "会員数"
    sql: ${TABLE}."Number_of_Members" ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_id,]
  }
}
