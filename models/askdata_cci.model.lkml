connection: "gcp-bq-std-q-looker"

# include all the views
include: "/views/**/*.view"

datagroup: askdata_cci_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: askdata_cci_default_datagroup

access_grant: nystateonly {
  allowed_values: ["New York"]
  user_attribute: state_filter
}

explore: call_summary {
  required_access_grants:  [nystateonly]
  from: call_info_merged_data
  join:  caller_demographics{
    sql_on: ${caller_demographics.caller_id} = ${call_summary.caller_id} ;;
    type: left_outer
    relationship: many_to_one

  }

  join: agent_table {
    sql_on: ${agent_table.agent_id} = ${call_summary.agent_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  #join:  faqs{
  #sql_on: ${faqs.chat_topic} = ${call_summary.chat_topic} ;;
  #type: left_outer
  #relationship: many_to_one
  #}

}
