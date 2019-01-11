view: warehouse_class {
  sql_table_name: actian.warehouse_class ;;

  dimension: warehouse_class_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.warehouse_class_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  measure: count {
    type: count
    drill_fields: [warehouse_class_id, warehouse.count]
  }
}
