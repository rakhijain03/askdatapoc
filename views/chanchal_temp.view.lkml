view: chanchal_temp {
  sql_table_name: `cci_covid.chanchal_temp`
    ;;

  dimension: avg_cost {
    type: number
    sql: ${TABLE}.avg_cost ;;
  }

  dimension: avg_query_time {
    type: number
    sql: ${TABLE}.avg_query_time ;;
  }

  dimension: avg_slot_ms {
    type: number
    sql: ${TABLE}.avg_slot_ms ;;
  }

  dimension: complexity {
    type: string
    sql: ${TABLE}.complexity ;;
  }

  dimension: job_ids {
    type: string
    sql: ${TABLE}.job_ids ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_count {
    type: number
    sql: ${TABLE}.query_count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
