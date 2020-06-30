view: feb_march {
  sql_table_name: `cci_covid.Feb_March`
    ;;

  dimension: abandoned_call {
    type: yesno
    sql: ${TABLE}.Abandoned_Call ;;
  }

  dimension: agent_change_flag {
    type: number
    sql: ${TABLE}.Agent_Change_Flag ;;
  }

  dimension: agent_id {
    type: string
    sql: ${TABLE}.Agent_ID ;;
  }

  dimension: agent_rating {
    type: number
    sql: ${TABLE}.Agent_Rating ;;
  }

  dimension: buffer_time {
    type: string
    sql: ${TABLE}.Buffer_Time ;;
  }

  dimension: call_duration {
    type: number
    sql: ${TABLE}.Call_Duration ;;
  }

  dimension_group: call_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Call_Start_Time ;;
  }

  dimension_group: call_start_time_stamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Call_Start_TimeStamp ;;
  }

  dimension: caller_id {
    type: string
    sql: ${TABLE}.Caller_ID ;;
  }

  dimension: caller_type {
    type: string
    sql: ${TABLE}.Caller_Type ;;
  }

  dimension: chat_subtopic {
    type: string
    sql: ${TABLE}.Chat_Subtopic ;;
  }

  dimension: chat_topic {
    type: string
    sql: ${TABLE}.Chat_Topic ;;
  }

  dimension: customer_rating {
    type: number
    sql: ${TABLE}.Customer_Rating ;;
  }

  dimension_group: date {
    type: time
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
    sql: ${TABLE}.Date ;;
  }

  dimension: date_change_flag {
    type: number
    sql: ${TABLE}.Date_Change_Flag ;;
  }

  dimension: faq_subtopic {
    type: string
    sql: ${TABLE}.FAQ_Subtopic ;;
  }

  dimension: faq_topic {
    type: string
    sql: ${TABLE}.FAQ_Topic ;;
  }

  dimension: follow_up_counts {
    type: number
    sql: ${TABLE}.Follow_Up_Counts ;;
  }

  dimension: follow_up_requests_ {
    type: yesno
    sql: ${TABLE}.Follow_Up_Requests_ ;;
  }

  dimension: hold_percent {
    type: number
    sql: ${TABLE}.Hold_Percent ;;
  }

  dimension: hold_time {
    type: number
    sql: ${TABLE}.Hold_Time ;;
  }

  dimension: no_of_call_transfers {
    type: number
    sql: ${TABLE}.No_of_call_transfers ;;
  }

  dimension: queue_time {
    type: number
    sql: ${TABLE}.Queue_Time ;;
  }

  dimension: resolution_status {
    type: string
    sql: ${TABLE}.Resolution_Status ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.Session_ID ;;
  }

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.Ticket_ID ;;
  }

  dimension: urgent {
    type: yesno
    sql: ${TABLE}.Urgent ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
