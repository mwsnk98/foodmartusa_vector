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

  measure: count {
    type: count
  }

  measure: average_executiontime {
    type: average
    sql: ${executiontimeseconds} ;;
  }


}
