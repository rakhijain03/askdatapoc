view: caller_demographics {
  sql_table_name: `qp-q-looker-2020-04.cci_covid.Caller_Demographics`
    ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }

  dimension: caller_id {
    type: string
    primary_key: yes
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
    drill_fields: [gender, chronic_condition, ethnicity,travel_history, profession,life_style]
  }

  dimension: travel_history {
    type: string
    sql: ${TABLE}.Travel_History ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  dimension: region {
    type: string
    drill_fields: [gender, chronic_condition, ethnicity,travel_history,profession,life_style]
    sql: case when state in ('Connecticut','Maine','Massachusetts','New Hampshire','Rhode Island','Vermont','New Jersey','New York','Pennsylvania') then 'East'
        when state in ('Arizona','Colorado','Idaho','Montana','Nevada','New Mexico','Utah','Wyoming','Alaska','California','Hawaii','Oregon','Washington') then 'West'
        when state in ('Delaware','Florida','Georgia','Maryland','North Carolina','South Carolina','Virginia','District of Columbia','West Virginia','Alabama','Kentucky','Mississipi','Tennessee','Arkansas','Lousiana','Oklahama','Texas') then 'South'
        when state in ('Illinois','Indiana','Michigan','Ohio','Wisconsin','Iowa','Kansas','Minnesota','Missouri','Nebraska','North Dakota','South Dakota') then 'Central' end;;
  }
}
