view: store {
  sql_table_name: actian.store ;;

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.store_id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: coffee_bar {
    type: yesno
    sql: ${TABLE}.coffee_bar ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension_group: first_opened {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_opened_date ;;
  }

  dimension: florist {
    type: yesno
    sql: ${TABLE}.florist ;;
  }

  dimension: frozen_sqft {
    type: number
    sql: ${TABLE}.frozen_sqft ;;
  }

  dimension: grocery_sqft {
    type: number
    sql: ${TABLE}.grocery_sqft ;;
  }

  dimension_group: last_remodel {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_remodel_date ;;
  }

  dimension: manager {
    type: string
    sql: ${TABLE}.manager ;;
  }

  dimension: meat_sqft {
    type: number
    sql: ${TABLE}.meat_sqft ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: prepared_food {
    type: yesno
    sql: ${TABLE}.prepared_food ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.region_id ;;
  }

  dimension: salad_bar {
    type: yesno
    sql: ${TABLE}.salad_bar ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: store_number {
    type: number
    sql: ${TABLE}.store_number ;;
  }

  dimension: store_sqft {
    type: number
    sql: ${TABLE}.store_sqft ;;
  }

  dimension: store_type {
    type: string
    sql: ${TABLE}.store_type ;;
  }

  dimension: video_store {
    type: yesno
    sql: ${TABLE}.video_store ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      store_id,
      name,
      region.region_id,
      region.name,
      employee.count,
      expense_fact.count,
      inventory_fact.count,
      sales_fact.count
    ]
  }
}
