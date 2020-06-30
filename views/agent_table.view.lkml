view: agent_table {
  sql_table_name: `qp-q-looker-2020-04.cci_covid.Agent_Table`
    ;;

  dimension: agent_id {
    view_label: ""
    type: string
    sql: ${TABLE}.Agent_ID ;;
    primary_key: yes
    drill_fields: [agent_name,date_of_joining_date,manager_name]
  }

  dimension: agent_name {
    type: string
    sql: ${TABLE}.Agent_Name ;;
    view_label: ""
    drill_fields: [agent_id,date_of_joining_date,manager_name]
  }

  dimension: contact_center_id {
    type: string
    sql: ${TABLE}.Contact_Center_ID ;;
  }

  dimension_group: date_of_joining {
    type: time
    view_label: ""
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date_of_Joining ;;
  }

  dimension: manager_name {
    type: string
    view_label: ""
    sql: ${TABLE}.Manager_Name ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  measure: count {
    type: count
    drill_fields: [agent_name, manager_name]
  }
}
