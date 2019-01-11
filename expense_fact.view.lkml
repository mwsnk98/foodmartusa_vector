view: expense_fact {
  sql_table_name: actian.expense_fact ;;

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: category_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.category_id ;;
  }

  dimension: currency_id {
    type: number
    sql: ${TABLE}.currency_id ;;
  }

  dimension_group: expense {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.expense_date ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: current_time_to_avoid_caching {
    type:  date_time
    sql: current_timestamp;;
  }

  measure: count {
    type: count
    drill_fields: [store.store_id, store.name, account.account_id, category.category_id]
  }

  measure: maximum_amount {
    type: max
    sql: ${amount} ;;
  }

  measure: minimum_amount {
    type: min
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

}
