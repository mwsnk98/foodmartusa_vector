view: region {
  sql_table_name: actian.region ;;

  dimension: region_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.region_id ;;
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

  dimension: district {
    type: string
    sql: ${TABLE}.district ;;
  }

  dimension: district_id {
    type: number
    sql: ${TABLE}.district_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  measure: count {
    type: count
    drill_fields: [region_id, name, customer.count, store.count]
  }
}
