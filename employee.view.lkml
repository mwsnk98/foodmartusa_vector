view: employee {
  sql_table_name: actian.employee ;;

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.employee_id ;;
  }

  dimension_group: birth {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.birth_date ;;
  }

  dimension: department_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.department_id ;;
  }

  dimension: education_level {
    type: string
    sql: ${TABLE}.education_level ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_date ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: hire {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.hire_date ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: management_role {
    type: string
    sql: ${TABLE}.management_role ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension: position_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.position_id ;;
  }

  dimension: position_title {
    type: string
    sql: ${TABLE}.position_title ;;
  }

  dimension: salary {
    type: string
    sql: ${TABLE}.salary ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: supervisor_id {
    type: number
    sql: ${TABLE}.supervisor_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      employee_id,
      full_name,
      first_name,
      last_name,
      store.store_id,
      store.name,
      position.position_id,
      department.department_id
    ]
  }
}
