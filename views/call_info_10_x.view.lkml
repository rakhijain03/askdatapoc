view: call_info_10_x {
  sql_table_name: `cci_covid.Call_Info_10X`
    ;;

  dimension: abandoned_call {
    type: yesno
    sql: ${TABLE}.abandoned_call ;;
  }

  dimension: agent_id {
    type: string
    sql: ${TABLE}.agent_id ;;
  }

  dimension: agent_rating {
    type: number
    sql: ${TABLE}.agent_rating ;;
  }

  dimension: call_duration {
    type: number
    sql: ${TABLE}.call_duration ;;
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
    sql: ${TABLE}.call_start_time ;;
  }

  dimension: caller_id {
    type: string
    sql: ${TABLE}.caller_id ;;
  }

  dimension: caller_type {
    type: string
    sql: ${TABLE}.caller_type ;;
  }

  dimension: chat_subtopic {
    type: string
    sql: ${TABLE}.chat_subtopic ;;
  }

  dimension: chat_topic {
    type: string
    sql: ${TABLE}.chat_topic ;;
  }

  dimension: customer_rating {
    type: number
    sql: ${TABLE}.customer_rating ;;
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
    sql: ${TABLE}.date ;;
  }

  dimension: faq_subtopic {
    type: string
    sql: ${TABLE}.faq_subtopic ;;
  }

  dimension: faq_topic {
    type: string
    sql: ${TABLE}.faq_topic ;;
  }

  dimension: follow_up_counts {
    type: number
    sql: ${TABLE}.follow_up_counts ;;
  }

  dimension: follow_up_requests {
    type: yesno
    sql: ${TABLE}.follow_up_requests ;;
  }

  dimension: hold_time {
    type: number
    sql: ${TABLE}.hold_time ;;
  }

  dimension: no_of_call_transfers {
    type: number
    sql: ${TABLE}.no_of_call_transfers ;;
  }

  dimension: queue_time {
    type: number
    sql: ${TABLE}.queue_time ;;
  }

  dimension: resolution_status {
    type: string
    sql: ${TABLE}.resolution_status ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: ticket_id {
    type: string
    sql: ${TABLE}.ticket_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
