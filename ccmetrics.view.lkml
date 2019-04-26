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

  measure: queries_served_guage {
    type: count
    value_format: "#####"
    #html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chma=10,0,0,0&chxt=y&chco=635189,B1A8C4,1EA8DF,8ED3EF&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
    #html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chtt=#+Queries+Served&chts=20&chma=10,0,0,0&chxt=y&chco=FF0000,FF8040,FFFF00,00FF00,00FFFF,0000FF,800080&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
    #html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chtt=Mary&chma=10,0,0,0&chxt=y&chco=FF0000,FF8040,FFFF00,00FF00,00FFFF,0000FF,800080&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
    #html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chma=10,0,0,0&chxt=y&chxr=0,1000&chco=FF0000,FF8040,FFFF00,00FF00,00FFFF,0000FF&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
    html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&&chma=10,0,0,0&chxt=y&chxr=0,0,500,250&chco=635189,B1A8C4,1EA8DF,8ED3EF&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
}

  measure: average_execution_guage {
    type: average
    sql: ${executiontimeseconds} ;;
    value_format: "###.##"
    #html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chma=10,0,0,0&chxt=y&chco=635189,B1A8C4,1EA8DF,8ED3EF&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
    #html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chtt=#+Queries+Served&chts=20&chma=10,0,0,0&chxt=y&chco=FF0000,FF8040,FFFF00,00FF00,00FFFF,0000FF,800080&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
    #html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chtt=Mary&chma=10,0,0,0&chxt=y&chco=FF0000,FF8040,FFFF00,00FF00,00FFFF,0000FF,800080&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
    html:   <img src="https://chart.googleapis.com/chart?chs=200x125&cht=gom&chtt=AvgExecutionSecs&chma=10,0,0,0&chxt=y&chxr=0,0,5&chxl=0:|fast|average|slow&chco=00FF00,FFFF00,FF8040,FF0000&chf=bg,s,FFFFFF00&chl={{ rendered_value }}&chd=t:{{ value }}">;;
  }

}
