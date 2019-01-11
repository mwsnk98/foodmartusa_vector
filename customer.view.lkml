view: customer {
  sql_table_name: actian.customer ;;

  dimension: customer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: account_num {
    type: number
    sql: ${TABLE}.account_num ;;
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

  dimension_group: birthdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.birthdate ;;
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

  dimension_group: date_accnt_opened {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_accnt_opened ;;
  }

  dimension: education {
    type: string
    sql: ${TABLE}.education ;;
  }

  dimension: fname {
    type: string
    sql: ${TABLE}.fname ;;
  }

  dimension: fullname {
    type: string
    sql: ${TABLE}.fullname ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: houseowner {
    type: string
    sql: ${TABLE}.houseowner ;;
  }

  dimension: lname {
    type: string
    sql: ${TABLE}.lname ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.marital_status ;;
  }

  dimension: member_card {
    type: string
    sql: ${TABLE}.member_card ;;
  }

  dimension: mi {
    type: string
    sql: ${TABLE}.mi ;;
  }

  dimension: num_cars_owned {
    type: number
    sql: ${TABLE}.num_cars_owned ;;
  }

  dimension: num_children_at_home {
    type: number
    sql: ${TABLE}.num_children_at_home ;;
  }

  dimension: occupation {
    type: string
    sql: ${TABLE}.occupation ;;
  }

  dimension: phone1 {
    type: string
    sql: ${TABLE}.phone1 ;;
  }

  dimension: phone2 {
    type: string
    sql: ${TABLE}.phone2 ;;
  }

  dimension: region_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.region_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: total_children {
    type: number
    sql: ${TABLE}.total_children ;;
  }

  dimension: yearly_income {
    type: string
    sql: ${TABLE}.yearly_income ;;
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
      customer_id,
      fname,
      lname,
      fullname,
      region.region_id,
      region.name,
      sales_fact.count
    ]
  }
}
