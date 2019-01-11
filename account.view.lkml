view: account {
  sql_table_name: actian.account ;;

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_description {
    type: string
    sql: ${TABLE}.account_description ;;
  }

  dimension: account_parent {
    type: number
    sql: ${TABLE}.account_parent ;;
  }

  dimension: account_rollup {
    type: string
    sql: ${TABLE}.account_rollup ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: custom_members {
    type: string
    sql: ${TABLE}.custom_members ;;
  }

  measure: count {
    type: count
    drill_fields: [account_id, expense_fact.count]
  }
}
