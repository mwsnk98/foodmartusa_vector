view: sales_fact {
  sql_table_name: actian.sales_fact ;;

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: promotion_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.promotion_id ;;
  }

  dimension_group: sales {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sales_date ;;
  }

  dimension: store_cost {
    type: number
    sql: ${TABLE}.store_cost ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.store_id ;;
  }

  dimension: store_sales {
    type: string
    sql: ${TABLE}.store_sales ;;
  }

  dimension: unit_sales {
    type: string
    sql: ${TABLE}.unit_sales ;;
  }

  dimension: current_time_to_avoid_caching {
    type: date_time
    sql: current_timestamp;;
  }

 dimension: version {
  type: string
  sql: dbmsinfo(' VERSION');;
 }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_store_sales {
    type: average
    sql: ${store_sales} ;;
    drill_fields: [detail*]
  }

  measure: average_unit_sales {
    type: average
    sql: ${unit_sales} ;;
    drill_fields: [detail*]
  }

  measure: average_store_cost {
    type: average
    sql: ${store_cost} ;;
    drill_fields: [detail*]
  }

  measure: total_store_sales {
    type: sum
    sql: ${store_sales} ;;
    drill_fields: [sales_fact.total_store_sales,sales_fact.sales_year,product_class.product_category]
    #link: {
    #url: "{{link}}&pivots=product_class.product_category&fill_fields=sales_fact.sales_year&sorts=sales_fact.sales_year+desc,product_class.product_category&limit=500&query_timezone=America%2FLos_Angeles&vis=%7B%22stacking%22%3A%22normal%22%2C%22color_application%22%3A%7B%22collection_id%22%3A%22legacy%22%2C%22palette_id%22%3A%22mixed_neutrals%22%7D%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22legend_position%22%3A%22center%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_view_names%22%3Atrue%2C%22point_style%22%3A%22none%22%2C%22series_colors%22%3A%7B%7D%2C%22series_types%22%3A%7B%7D%2C%22limit_displayed_rows%22%3Afalse%2C%22y_axis_combined%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22type%22%3A%22looker_column%22%7D&filter_config=%7B%7D&origin=share-expanded"}
    # Added by Bruce.  You can add additional links to other dashboards if you want.
    link: {
      label: "Yearly Product Sales"
      url: "/dashboards/11?Region={{ region.name._value | encode_uri }}&Product%20Family={{ product_class.product_family._value | encode_uri }}"
      icon_url: "/favicon.ico"
    }
  }

  measure: total_unit_sales {
    type: sum
    sql: ${unit_sales} ;;
    drill_fields: [detail*]
  }

  measure: total_store_cost {
    type: sum
    sql: ${store_cost} ;;
    drill_fields: [detail*]
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      product.product_id,
      product.brand_name,
      product.product_name,
      customer.fname,
      customer.lname,
      customer.customer_id,
      customer.fullname,
      promotion.promotion_id,
      promotion.promotion_name,
      store.store_id,
      store.name
    ]
  }
}
