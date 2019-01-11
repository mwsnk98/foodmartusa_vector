view: product {
  sql_table_name: actian.product ;;

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: cases_per_pallet {
    type: number
    sql: ${TABLE}.cases_per_pallet ;;
  }

  dimension: gross_weight {
    type: number
    sql: ${TABLE}.gross_weight ;;
  }

  dimension: low_fat {
    type: yesno
    sql: ${TABLE}.low_fat ;;
  }

  dimension: net_weight {
    type: number
    sql: ${TABLE}.net_weight ;;
  }

  dimension: product_class_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_class_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: recyclable_package {
    type: yesno
    sql: ${TABLE}.recyclable_package ;;
  }

  dimension: shelf_depth {
    type: number
    sql: ${TABLE}.shelf_depth ;;
  }

  dimension: shelf_height {
    type: number
    sql: ${TABLE}.shelf_height ;;
  }

  dimension: shelf_width {
    type: number
    sql: ${TABLE}.shelf_width ;;
  }

  dimension: sku {
    type: number
    sql: ${TABLE}.sku ;;
  }

  dimension: srp {
    type: string
    sql: ${TABLE}.srp ;;
  }

  dimension: units_per_case {
    type: number
    sql: ${TABLE}.units_per_case ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product_id,
      brand_name,
      product_name,
      product_class.product_class_id,
      inventory_fact.count,
      sales_fact.count
    ]
  }
}
