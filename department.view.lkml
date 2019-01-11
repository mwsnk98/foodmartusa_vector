view: department {
  sql_table_name: actian.department ;;

  dimension: department_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension: department_description {
    type: string
    sql: ${TABLE}.department_description ;;
  }

  measure: count {
    type: count
    drill_fields: [department_id, employee.count]
  }
}
