view: sales_drivers {
  derived_table: {
    sql: --  how many different customers/day combos they appear on.   How many individual sales.
      SELECT p1.product_name AS product_name1, p2.product_name AS product_name2, how_many_sales
      FROM (

      SELECT p_id_1, p_id_2, count(*) AS how_many_sales
      FROM (
      --products by customer and date
      SELECT t1.product_id AS p_id_1, t2.product_id AS p_id_2, t1.sales_date, t1.customer_id
      from
      (SELECT distinct product_id, sales_date, customer_id from sales_fact) AS t1
      JOIN
      (SELECT distinct product_id, sales_date, customer_id from sales_fact) AS t2
      ON (
      t1.sales_date = t2.sales_date AND
      t1.customer_id = t2.customer_id AND
      t1.product_id != t2.product_id AND
      t1.product_id < t2.product_id
      )
      ) t1
    GROUP by t1.p_id_1, t1.p_id_2
    ) t3
    JOIN product p1
      ON t3.p_id_1 = p1.product_id
      JOIN product p2
      ON t3.p_id_2 = p2.product_id
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_name1 {
    type: string
    sql: ${TABLE}.product_name1 ;;
  }

  dimension: product_name2 {
    type: string
    sql: ${TABLE}.product_name2 ;;
  }

  dimension: how_many_sales {
    type: number
    sql: ${TABLE}.how_many_sales ;;
  }

  measure: total_sales_drivers {
    type: sum
    sql: ${how_many_sales} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [product_name1, product_name2, how_many_sales]
  }
}
