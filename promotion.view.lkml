view: promotion {
  sql_table_name: actian.promotion ;;

  dimension: promotion_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: cost {
    type: string
    sql: ${TABLE}.cost ;;
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

  dimension: media_type {
    type: string
    sql: ${TABLE}.media_type ;;
  }

  dimension: promotion_district_id {
    type: number
    sql: ${TABLE}.promotion_district_id ;;
  }

  dimension: promotion_name {
    type: string
    sql: ${TABLE}.promotion_name ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    type: count
    drill_fields: [promotion_id, promotion_name, sales_fact.count]
  }
}
