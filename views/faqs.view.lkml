view: faqs {
  sql_table_name: `cci_covid.FAQs`
    ;;

  dimension: chat_topic {
    type: string
    sql: ${TABLE}.Chat_Topic ;;
  }

  dimension: faq {
    type: string
    sql: ${TABLE}.FAQ ;;
  }

  dimension: temp_col {
    type: number
    sql: ${TABLE}.Temp_col ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
