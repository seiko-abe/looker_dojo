view: store_master {
  # sql_table_name: "DATA_SETS"."Store_Master" ;;
  derived_table: {
      sql:
      SELECT
       *
      FROM
        "DATA_SETS"."Store_Master"
      WHERE
      store_category = {% condition select_store_category %} store_category {% endcondition %};;
    }
  filter: select_store_category {
    label: "店舗区分"
    type: string
    # sql: ${TABLE}."Store_Category" ;;
  }
  :
  dimension: store_id {
    primary_key: yes
    type: string
    label: "店舗ID"
    sql: ${TABLE}."Store_ID" ;;
  }
  dimension: store_category {
    type: string
    label: "店舗区分"
    sql: ${TABLE}."Store_Category" ;;
  }
  dimension: area_id {
    type: string
    label: "地域ID"
    sql: ${TABLE}."Area_ID" ;;
  }
  dimension: store_name {
    type: string
    label: "店舗名"
    sql: ${TABLE}."Store_Name" ;;
  }
  dimension: store_number {
    type: number
    label: "店舗番号"
    sql: ${TABLE}."Store_number" ;;
  }
  dimension: street_address_store {
    type: string
    label: "町村番地(店舗)"
    sql: ${TABLE}."Street_Address_Store" ;;
  }
  dimension: store_prefecture {
    type: string
    label: "店舗都道府県"
    sql: ${TABLE}."Store_Prefecture" ;;
  }
  dimension: store_city_town_village {
    type: string
    label: "店舗市区町村"
    sql: ${TABLE}."Store_city_town_village" ;;
  }
  dimension: store_prefecture_city {
    type: string
    label: "店舗都道府県_市区町村"
    sql: ${store_prefecture} || ', ' || ${store_city_town_village} ;;
  }
  dimension: latitude {
    type: number
    label: "緯度"
    sql: ${TABLE}."Latitude" ;;
  }
  dimension: longitude {
    type: number
    label: "経度"
    sql: ${TABLE}."Longitude" ;;
  }
  dimension: customer_location {
    type: location
    sql_latitude: ${TABLE}."Latitude"  ;;
    sql_longitude: ${TABLE}."Longitude";;
  }
  dimension: zip_code_store {
    type: number
    label: "郵便番号(店舗)"
    sql: ${TABLE}."Zip_Code_Store" ;;
  }
  dimension: store_area {
    type: string
    label: "店舗エリア"
    sql: ${TABLE}."Store_Area" ;;
  }
  dimension: store_manager {
    type: string
    label: "店舗マネージャー"
    sql: ${TABLE}."Store_Manager" ;;
  }
  dimension: phone_number_store {
    type: string
    label: "電話番号(店舗)"
    sql: ${TABLE}."Phone_Number_Store" ;;
  }
  dimension: fax_number_store {
    type: string
    label: "FAX番号(店舗)"
    sql: ${TABLE}."Fax_Number_Store" ;;
  }
  dimension: opening_date {
    type: string
    label: "開店日"
    sql: ${TABLE}."Opening_Date" ;;
  }
  dimension: last_remodeling_date {
    type: string
    label: "最終改装日"
    sql: ${TABLE}."Last_Remodeling_Date" ;;
  }
  dimension: store_floor_space {
    type: number
    label: "店舗面積"
    sql: ${TABLE}."Store_floor_space" ;;
  }
  dimension: area_of_grocery_department {
    type: number
    label: "食料雑貨部門面積"
    sql: ${TABLE}."Area_of_grocery_department" ;;
  }
  dimension: area_of_frozen_food_department {
    type: number
    label: "冷凍食品部門面積"
    sql: ${TABLE}."Area_of_Frozen_Food_Department" ;;
  }
  dimension: meat_department_area {
    type: number
    label: "肉部門面積"
    sql: ${TABLE}."Meat_Department_Area" ;;
  }
  dimension: coffee_bar {
    type: number
    label: "コーヒーバー"
    sql: ${TABLE}."Coffee_Bar" ;;
  }
  dimension: video_store {
    type: number
    label: "ビデオストア"
    sql: ${TABLE}."Video_Store" ;;
  }
  dimension: salad_bar {
    type: number
    label: "サラダバー"
    sql: ${TABLE}."Salad_Bar" ;;
  }
  dimension: delicatessen {
    type: number
    label: "惣菜"
    sql: ${TABLE}."Delicatessen" ;;
  }
  dimension: flower_shop {
    type: number
    label: "花屋"
    sql: ${TABLE}."Flower_shop" ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id, area_id, .count]
  }
}
