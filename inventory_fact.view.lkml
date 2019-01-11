view: inventory_fact {
  sql_table_name: actian.inventory_fact ;;

  dimension_group: inventory {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.inventory_date ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: store_invoice {
    type: number
    sql: ${TABLE}.store_invoice ;;
  }

  dimension: supply_time {
    type: number
    sql: ${TABLE}.supply_time ;;
  }

  dimension: units_ordered {
    type: number
    sql: ${TABLE}.units_ordered ;;
  }

  dimension: units_shipped {
    type: number
    sql: ${TABLE}.units_shipped ;;
  }

  dimension: warehouse_cost {
    type: number
    sql: ${TABLE}.warehouse_cost ;;
  }

  dimension: warehouse_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.warehouse_id ;;
  }

  dimension: warehouse_sales {
    type: number
    sql: ${TABLE}.warehouse_sales ;;
  }

  dimension: current_time_to_avoid_caching {
    type:  date_time
    sql: current_timestamp;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: maximum_warehouse_sales {
    type: max
    sql: ${warehouse_sales} ;;
  }

  measure: minimum_warehouse_sales {
    type: min
    sql: ${warehouse_sales} ;;
  }

  measure: average_warehouse_sales {
    type: average
    sql: ${warehouse_sales} ;;
  }

  measure: total_warehouse_sales  {
    type: sum
    sql: ${warehouse_sales} ;;
  }

  measure: maximum_warehouse_cost {
    type: max
    sql: ${warehouse_cost} ;;
  }

  measure: minimum_warehouse_cost {
    type: min
    sql: ${warehouse_cost} ;;
  }

  measure: average_warehouse_cost {
    type: average
    sql: ${warehouse_cost} ;;
  }

  measure: total_warehouse_cost {
    type: sum
    sql: ${warehouse_cost} ;;
  }

  measure: maximum_units_shipped {
    type: max
    sql: ${units_shipped} ;;
  }

  measure: minimum_units_shipped {
    type: min
    sql: ${units_shipped} ;;
  }

  measure: average_units_shipped {
    type: average
    sql: ${TABLE}.units_shipped ;;
  }

  measure: total_units_shipped {
    type: sum
    sql: ${units_shipped} ;;
  }

  measure: maximum_units_ordered {
    type: max
    sql: ${units_ordered} ;;
  }

  measure: minimum_units_ordered {
    type: min
    sql: ${units_ordered} ;;
}

  measure: average_units_ordered {
    type: average
    sql: ${units_ordered} ;;
  }

  measure: total_units_ordered {
    type: sum
    sql: ${units_ordered} ;;
  }

  measure: maximum_supply_time {
    type: max
    sql: ${supply_time} ;;
  }

  measure: minimum_supply_time {
    type: min
    sql: ${supply_time} ;;
  }

  measure: average_supply_time {
    type: average
    sql: ${TABLE}.supply_time ;;
  }

  measure: total_supply_time {
    type: sum
    sql: ${supply_time} ;;
  }

  measure: maximum_store_invoice {
    type: max
    sql: ${store_invoice} ;;
  }

  measure: minimum_store_invoice {
    type: min
    sql: ${store_invoice} ;;
  }

  measure: average_store_invoice {
    type: average
    sql: ${store_invoice} ;;
  }

  measure: total_store_invoice {
    type: sum
    sql: ${store_invoice} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      warehouse.warehouse_id,
      warehouse.name,
      warehouse.owner_name,
      product.product_id,
      product.brand_name,
      product.product_name,
      store.store_id,
      store.name
    ]
  }
}
