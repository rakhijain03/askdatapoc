view: feb_demographics {
  sql_table_name: `cci_covid.Feb_Demographics`
    ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: caller_id {
    type: string
    sql: ${TABLE}.Caller_ID ;;
  }

  dimension: chronic_condition {
    type: string
    sql: ${TABLE}.Chronic_Condition ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: dependents {
    type: number
    sql: ${TABLE}.Dependents ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.Ethnicity ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: life_style {
    type: string
    sql: ${TABLE}.Life_Style ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.Marital_Status ;;
  }

  dimension: nationality {
    type: string
    sql: ${TABLE}.Nationality ;;
  }

  dimension: no_of_people_interacted {
    type: number
    sql: ${TABLE}.No_of_people_Interacted ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.Phone_Number ;;
  }

  dimension: profession {
    type: string
    sql: ${TABLE}.Profession ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: travel_history {
    type: string
    sql: ${TABLE}.Travel_History ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
