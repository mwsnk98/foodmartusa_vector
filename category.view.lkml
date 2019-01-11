view: category {
  sql_table_name: actian.category ;;

  dimension: category_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.category_id ;;
  }

  dimension: category_description {
    type: string
    sql: ${TABLE}.category_description ;;
  }

  dimension: category_parent {
    type: string
    sql: ${TABLE}.category_parent ;;
  }

  measure: count {
    type: count
    drill_fields: [category_id, expense_fact.count]
  }
}
