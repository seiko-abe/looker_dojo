view: member_info {
  drill_fields: [customer_id]
    derived_table: {
      sql:
          SELECT
            *
          FROM
            "DATA_SETS"."Member_Info"
          WHERE
          --DATE(BIRTH) >= {% parameter period_start %} AND DATE(BIRTH) <= {% parameter period_end %}
          {% condition filter_birthday %} DATE("Birthday") {% endcondition %}
      ;;
    }
  filter: filter_birthday {
    type: date
  }
  # "Customer_Prefecture" = {% parameter parameter_prefecture %}
  # parameter: parameter_prefecture {
  #   label: "顧客都道府県(フィルター用)"
  #   type: string
  #   suggestions: ["宮城県", "千葉県", "新潟県"]
  #   suggest_explore: Member_Info
  #   suggest_dimension: customer_prefecture
  # }
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
  # dimension: birthday {
  #   type: string
  #   label: "誕生日"
  #   sql:${TABLE}."Birthday";;
  # }
  dimension: birthday {
    type: date
    label: "誕生日"
    sql: TO_DATE(${TABLE}."Birthday", 'YYYY/MM/DD');;
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
  measure: member_amount {
    type: sum
    label: "合計会員数"
    sql: abs(${TABLE}."Number_of_Members");;
  }

  measure: female_members {
    type: sum
    label: "女性会員数"
    sql: CASE WHEN ${TABLE}."Gender" = '女性' THEN ${TABLE}."Number_of_Members" ELSE 0 END ;;
  }

  measure: male_members {
    type: sum
    label: "男性会員数"
    sql: CASE WHEN ${TABLE}."Gender" = '男性' THEN ${TABLE}."Number_of_Members" ELSE 0 END ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_id,]
  }
}
