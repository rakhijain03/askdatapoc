view: call_info_merged_data {
  sql_table_name: `qp-q-looker-2020-04.cci_covid.Call_Info_Merged_Data`
    ;;
  # drill_fields: [agent_id,average_duration, average_hold_time, average_queue_time,average_customer_rating,average_agent_rating]

  dimension: abandoned_call {
    type: yesno
    sql: ${TABLE}.Abandoned_Call ;;
  }

  dimension: agent_id {
    type: string
    sql: ${TABLE}.Agent_ID ;;
    drill_fields: [average_customer_rating]
  }

  dimension: agent_rating {
    type: number
    sql: ${TABLE}.Agent_Rating ;;
    drill_fields: [average_customer_rating]
  }

  dimension: buffer_time {
    type: number
    sql: ${TABLE}.Buffer_Time ;;
  }

  dimension: call_duration {
    type: number
    sql: ${TABLE}.Call_Duration ;;
    drill_fields: [chat_topic,agent_table.agent_name]
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
      year,
      hour_of_day,
      day_of_week
    ]
    sql: ${TABLE}.Call_Start_Time;;
    drill_fields: [agent_id,agent_table.agent_name,chat_topic, chat_subtopic]
  }

  dimension: day_of_week {
    type: date_day_of_week
    sql: ${TABLE}.Date;;
    # html: {{value | %a}} ;;
  }

  dimension_group: date_est {
    type: time
    datatype: date
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour_of_day,
      day_of_week
    ]
    sql: ${TABLE}.Date;;
    drill_fields: []
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
    drill_fields: [caller_demographics.state, call_duration, queue_time, hold_time]
  }

  dimension: chat_topic {
    type: string
    sql: ${TABLE}.Chat_Topic ;;
    drill_fields: [chat_subtopic]
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
      year,
      day_of_week
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
    drill_fields: [agent_id,agent_table.agent_name,chat_topic, chat_subtopic]
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

#created dimensions
  dimension: is_call_onhold {
    type: yesno
    sql: ${hold_time} is not NULL ;;
  }

  dimension: is_agent_rating_null {
    type: yesno
    sql: ${agent_rating} is NULL ;;
  }

  dimension: is_customer_rating_null {
    type: yesno
    sql: ${customer_rating} is NULL ;;
  }

  dimension: peak_hours {
    type: string
    sql: case
          when ${call_start_hour_of_day} >= 9 and ${call_start_hour_of_day} < 12
          then '9AM-12PM'
         when ${call_start_hour_of_day} >= 12 and ${call_start_hour_of_day} < 15
          then '12PM-3PM'
          when ${call_start_hour_of_day} >= 15 and ${call_start_hour_of_day} < 18
          then '3PM-6PM'
          when ${call_start_hour_of_day} >= 18 and ${call_start_hour_of_day} < 21
          then '6PM-9PM'
          when ${call_start_hour_of_day} >= 21 and ${call_start_hour_of_day} < 24
          then '9PM-12AM'
          when ${call_start_hour_of_day} >= 0 and ${call_start_hour_of_day} < 3
          then '12AM-3AM'
          when ${call_start_hour_of_day} >= 3 and ${call_start_hour_of_day} < 6
          then '3AM-6AM'
          when ${call_start_hour_of_day} >= 6 and ${call_start_hour_of_day} < 9
          then '6AM-9AM' end;;
  }

  dimension: agent_rating_tier {
    type: tier
    tiers: [3,4]
    sql:  ${agent_rating};;
    style: relational
  }

  dimension: customer_rating_tier {
    type: tier
    tiers: [3,4]
    sql:  ${customer_rating};;
    style: relational
    drill_fields: [agent_id, agent_table.agent_name, chat_topic,chat_subtopic]
  }

#end of created dimensions

  measure: count {
    label: "# Calls"
    type: count
    drill_fields: []
    view_label: "Call"
    #label: "# Calls"

    #value_format: "0,\K"
    #html: <p style= "font-size: 25px"> {{ rendered_value }} </p> ;;
  }

#created measures
  measure: calls_answered {
    #html:<p style="font-size:30px">{{ value }}</p>;;
    type: count
    filters: [abandoned_call: "no"]
    #value_format: "0.000,\" K\""
  }

  measure: average_hold_time {
    type: average
    sql: ${hold_time} ;;
    value_format_name: decimal_1
    drill_fields: [agent_id,date_week,call_duration]
    #value_format: "hh:mm:ss"
  }

  measure: average_queue_time {
    type: average
    sql: ${queue_time} ;;
    value_format_name: decimal_1
  }

  measure: average_call_duration {
    type: average
    sql: ${call_duration} ;;
    value_format_name: decimal_1
  }

  measure: total_no_of_transfers {
    type: sum
    sql: ${no_of_call_transfers} ;;
  }

  measure: no_of_days {
    type: count_distinct
    sql: ${date_date} ;;
  }

  measure: average_no_of_transfers {
    type: average
    sql: ${no_of_call_transfers} ;;
    value_format_name: decimal_0
  }

  measure: calls_abandoned {
    type: count
    filters: [abandoned_call: "yes"]
    #value_format: "0,\K"
  }

  measure: abandonment_rate {
    type: number
    value_format_name: percent_1
    sql: 1.0*${calls_abandoned}/NULLIF(${count},0) ;;
  }

  measure: resolved_calls {
    label: "# Resolved Calls"
    type: count
    filters: [resolution_status: "Resolved"]
  }

  measure: Open_calls {
    label: "# Unresolved Calls"
    type: count
    filters: [resolution_status: "Open"]
  }

  measure: total_calls_onhold {
    type: count
    filters: [is_call_onhold: "yes"]
    #value_format: "0,\K"
  }

  measure: average_agent_rating {
    type: average
    sql: ${agent_rating} ;;
    filters: [is_agent_rating_null: "no"]
    value_format_name: decimal_1
  }

  measure: average_customer_rating {
    type: average
    sql: ${customer_rating} ;;
    filters: [is_customer_rating_null: "no"]
    value_format_name: decimal_1
  }

  measure: FCR {
    type: number
    value_format_name: percent_1
    sql: 1.0*${resolved_calls}/NULLIF(${count},0) ;;
    drill_fields: [chat_topic,agent_id]
  }

  measure: resolution_status_count {
    label: "Resolution Status"
    type: count
    filters: {
      field: resolution_status
      value: "Resolved,Open,-NULL"
    }
  }

  measure: chat_topic_count {
    type: count
    filters: {
      field: chat_topic
      value: "-NULL"
    }
  }

  measure: chat_subtopic_count {
    type: count
    filters: {
      field: chat_subtopic
      value: "-NULL"
    }
  }

  measure: average_duration {
    type: average
    sql: ${call_duration} ;;
    value_format_name: decimal_1
  }

  measure:total_followups  {
    type: sum
    sql:  ${follow_up_counts} ;;
    #value_format: "0,\K"
  }

  measure:Avg_followups  {
    type: average
    sql:  ${follow_up_counts} ;;
    value_format_name: decimal_1
  }

  measure:agentcount_distinct  {
    type: count_distinct
    sql:  ${agent_id} ;;
    #value_format: "0,\K"
    drill_fields: [agent_id,agent_table.agent_name,agent_table.date_of_joining_raw,agent_table.contact_center_id,agent_table.manager_name]
  }

  measure:calls_per_agent {
    type:number
    sql:${count}/${agentcount_distinct} ;;
    #value_format: "0,\K"
  }

  measure: calls_per_agent_per_month_avg {
    sql:  ;;
}

measure: longest_talk_time {
  type: max
  sql: ${call_duration} ;;
  drill_fields: [session_id, call_start_date, queue_time, hold_time, call_duration,chat_topic, chat_subtopic]
}

measure: longest_hold_time{
  type: max
  sql: ${hold_time} ;;
  drill_fields: [session_id, call_start_date, queue_time, hold_time, call_duration,chat_topic, chat_subtopic]
}

# parameter to create the TOP N Agents

parameter: Select_TopN {
  type: number
}

dimension: Rank_Limit_TopN {
  type: number
  sql: {% parameter Select_TopN %} ;;
}

# parameter to create the Bottom N Agents

parameter: Select_BottomN {
  type: number
}

dimension: Rank_Limit_BottomN {
  type: number
  sql: {% parameter Select_BottomN %} ;;
}

# parameter to create the metrics

parameter: Select_TopN_Metric {
  type: string
  allowed_value: {
    label: "Agent Rating"
    value: "agent_rating"
  }
  allowed_value: {
    label: "CSR"
    value: "customer_rating"
  }

  allowed_value: {
    label: "Avg Transfers "
    value: "average_no_of_transfers"
  }

  allowed_value: {
    label: "Avg Followups "
    value: "Avg_followups"
  }

  allowed_value: {
    label: "Avg Call Duration"
    value: "average_call_duration"
  }

}

measure: metric_topn {
  label_from_parameter: Select_TopN_Metric
  type: number
  value_format: "0.0"
  sql:
    CASE
      WHEN {% parameter Select_TopN_Metric %} = 'agent_rating'
        THEN ${average_agent_rating}
      WHEN {% parameter Select_TopN_Metric %} = 'customer_rating'
        THEN ${average_customer_rating}
      WHEN {% parameter Select_TopN_Metric %} = 'average_no_of_transfers'
        THEN ${average_no_of_transfers}
      WHEN {% parameter Select_TopN_Metric %} = 'Avg_followups'
        THEN ${Avg_followups}
       WHEN {% parameter Select_TopN_Metric %} = 'average_call_duration'
        THEN ${average_call_duration}
      ELSE NULL
    END ;;
}

# end of parameter to create the TOP N Agents

measure: open_tickets_count {
  type: count_distinct
  sql: ${ticket_id} ;;
  filters: {
    field: resolution_status
    value: "Open"
  }
}

measure: UnKnown_Content {
  type: count
  filters: {
    field: chat_topic
    value: "Other"
  }
}

measure:Unknown_Content_Percent {
  type: number
  sql: if (${calls_answered} <> 0,  (${UnKnown_Content}/${calls_answered}), 0);;
  #value_format_name: percent_1
}

measure: average_followups {
  type: average
  sql: ${follow_up_counts} ;;
}

# dimension: agent_rating_buckets{
#  type: string
#  sql: case when ${average_customer_rating}) < 3.3 then 'Poor'
#  when  ${average_customer_rating}) >=3.3 and ${average_customer_rating}<3.8 then 'Good'
#  when ${average_customer_rating} >=3.8 then 'Excellent' end;;
# }
}
