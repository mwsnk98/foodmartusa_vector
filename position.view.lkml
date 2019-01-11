view: position {
  sql_table_name: actian.position ;;

  dimension: position_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.position_id ;;
  }

  dimension: management_role {
    type: string
    sql: ${TABLE}.management_role ;;
  }

  dimension: max_scale {
    type: string
    sql: ${TABLE}.max_scale ;;
  }

  dimension: min_scale {
    type: string
    sql: ${TABLE}.min_scale ;;
  }

  dimension: pay_type {
    type: string
    sql: ${TABLE}.pay_type ;;
  }

  dimension: position_title {
    type: string
    sql: ${TABLE}.position_title ;;
  }

  measure: count {
    type: count
    drill_fields: [position_id, employee.count]
  }
}
