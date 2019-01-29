view: ccmetrics {
  sql_table_name: actian.ccmetrics ;;

  dimension: queryloopuser {
    type: string
    # hidden: yes
    sql: ${TABLE}.queryloopuser ;;
  }

  dimension: executiontimeseconds {
    type: number
    # hidden: yes
    sql: ${TABLE}.executiontimeseconds ;;
  }

  measure: queries_served {
    type: count
  }

  measure: average_execution_seconds {
    type: average
    sql: ${executiontimeseconds} ;;
  }


}
