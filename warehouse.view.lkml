view: warehouse {
  sql_table_name: actian.warehouse ;;

  dimension: warehouse_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.warehouse_id ;;
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: address3 {
    type: string
    sql: ${TABLE}.address3 ;;
  }

  dimension: address4 {
    type: string
    sql: ${TABLE}.address4 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: stores_id {
    type: number
    sql: ${TABLE}.stores_id ;;
  }

  dimension: warehouse_class_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.warehouse_class_id ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  measure: count {
    type: count
    drill_fields: [warehouse_id, name, owner_name, warehouse_class.warehouse_class_id, inventory_fact.count]
  }
}
