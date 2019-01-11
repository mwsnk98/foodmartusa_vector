view: product_class {
  sql_table_name: actian.product_class ;;

  dimension: product_class_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_class_id ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: product_family {
    type: string
    sql: ${TABLE}.product_family ;;
  }

  dimension: product_subcategory {
    type: string
    sql: ${TABLE}.product_subcategory ;;
  }

  measure: count {
    type: count
    drill_fields: [product_class_id, product.count]
  }
}
