- dashboard: foodmart_vwss_looker_productivity_comparison__actian_vector_versus_the_other_guys
  title: 'FOODMART (vw,ss): Looker Productivity Comparison - Actian Vector Versus
    The Other Guys'
  layout: newspaper
  refresh: 3 minutes
  elements:
  - name: Actian Vector
    type: text
    title_text: Actian Vector
    subtitle_text: World's Fastest Analytic Database
    body_text: ''
    row: 0
    col: 0
    width: 8
    height: 2
  - name: The Other Guys
    type: text
    title_text: The Other Guys
    row: 8
    col: 0
    width: 8
    height: 2
  - title: 'The Other Guys: Sales by Product Family by Region'
    name: 'The Other Guys: Sales by Product Family by Region'
    model: foodmartusa_sqlserver
    explore: sales_fact
    type: looker_column
    fields: [product_class.product_family, sales_fact.total_store_sales, region.name]
    pivots: [region.name]
    sorts: [sales_fact.total_store_sales desc 0, region.name]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    color_application:
      collection_id: legacy
      palette_id: black_to_gray
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 10
    col: 7
    width: 9
    height: 6
  - title: 'The Other Guys: Top Market Basket'
    name: 'The Other Guys: Top Market Basket'
    model: foodmartusa_sqlserver
    explore: sales_drivers
    type: looker_bar
    fields: [sales_drivers.product_name1, sales_drivers.total_sales_drivers]
    sorts: [sales_drivers.total_sales_drivers desc]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: row()<=10,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    query_timezone: America/Los_Angeles
    stacking: ''
    color_application:
      collection_id: legacy
      palette_id: black_to_gray
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [calculation_1]
    hidden_points_if_no: [calculation_1]
    listen: {}
    row: 10
    col: 16
    width: 8
    height: 6
  - title: Vector Version (live)
    name: Vector Version (live)
    model: foodmartusa
    explore: db_version
    type: single_value
    fields: [db_version.version]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    series_types: {}
    listen: {}
    row: 18
    col: 0
    width: 12
    height: 2
  - title: The Other Guys Version (live)
    name: The Other Guys Version (live)
    model: foodmartusa_sqlserver
    explore: db_version
    type: single_value
    fields: [db_version.version]
    sorts: [db_version.version]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen: {}
    row: 18
    col: 12
    width: 12
    height: 2
  - name: Store Unit Sales SQL
    type: text
    title_text: Store Unit Sales SQL
    body_text: "SELECT \nTOP 500 \n\tstore.state  AS \"store.state\",\n\tCOALESCE(SUM(sales_fact.unit_sales\
      \ ), 0) AS \"sales_fact.total_unit_sales\"\nFROM actian.sales_fact  AS sales_fact\n\
      LEFT JOIN actian.store  AS store ON sales_fact.store_id = store.store_id \n\n\
      GROUP BY 1\nORDER BY 2 DESC"
    row: 28
    col: 0
    width: 7
    height: 5
  - name: Sales By Product Region SQL
    type: text
    title_text: Sales By Product Region SQL
    body_text: "SELECT * FROM (\nSELECT *, DENSE_RANK() OVER (ORDER BY z___min_rank)\
      \ as z___pivot_row_rank, RANK() OVER (PARTITION BY z__pivot_col_rank ORDER BY\
      \ z___min_rank) as z__pivot_col_ordering FROM (\nSELECT *, MIN(z___rank) OVER\
      \ (PARTITION BY \"product_class.product_family\") as z___min_rank FROM (\nSELECT\
      \ *, RANK() OVER (ORDER BY CASE WHEN z__pivot_col_rank=1 THEN (CASE WHEN \"\
      sales_fact.total_store_sales\" IS NOT NULL THEN 0 ELSE 1 END) ELSE 2 END, CASE\
      \ WHEN z__pivot_col_rank=1 THEN \"sales_fact.total_store_sales\" ELSE NULL END\
      \ DESC, \"sales_fact.total_store_sales\" DESC, z__pivot_col_rank, \"product_class.product_family\"\
      ) AS z___rank FROM (\nSELECT *, DENSE_RANK() OVER (ORDER BY CASE WHEN \"region.name\"\
      \ IS NULL THEN 1 ELSE 0 END, \"region.name\") AS z__pivot_col_rank FROM (\n\
      SELECT \n\tregion.name  AS \"region.name\",\n\tproduct_class.product_family\
      \  AS \"product_class.product_family\",\n\tCOALESCE(SUM(sales_fact.store_sales\
      \ ), 0) AS \"sales_fact.total_store_sales\"\nFROM actian.sales_fact  AS sales_fact\n\
      LEFT JOIN actian.product  AS product ON sales_fact.product_id = product.product_id\
      \ \nLEFT JOIN actian.customer  AS customer ON sales_fact.customer_id = customer.customer_id\
      \ \nLEFT JOIN actian.product_class  AS product_class ON product.product_class_id\
      \ = product_class.product_class_id \nLEFT JOIN actian.region  AS region ON customer.region_id\
      \ = region.region_id \n\nGROUP BY 1,2) ww\n) bb WHERE z__pivot_col_rank <= 16384\n\
      ) aa\n) xx\n) zz\n WHERE z___pivot_row_rank <= 500 OR z__pivot_col_ordering\
      \ = 1 ORDER BY z___pivot_row_rank"
    row: 28
    col: 7
    width: 9
    height: 11
  - name: Top Market Basket
    type: text
    title_text: Top Market Basket
    body_text: "WITH sales_drivers AS (SELECT p1.product_name AS roduct_name1, p2.product_name\
      \ AS product_name2, how_many_sales      FROM (\n      SELECT p_id_1, p_id_2,\
      \ count(*) AS how_many_sales      FROM (\n      --products by customer and date\n\
      \      SELECT t1.product_id AS p_id_1, t2.product_id AS p_id_2, t1.sales_date,\
      \ t1.customer_id      from\n      (**SELECT distinct product_id, sales_date,\
      \ customer_id from sales_fact) AS t1\n      JOIN\n      (SELECT distinct product_id,\
      \ sales_date, customer_id from sales_fact) AS t2**\n      ON (\n      t1.sales_date\
      \ = t2.sales_date AND\n      t1.customer_id = t2.customer_id AND\n      t1.product_id\
      \ != t2.product_id AND\n      t1.product_id < t2.product_id\n      )      )\
      \ t1\n    GROUP by t1.p_id_1, t1.p_id_2\n    ) t3\n    JOIN product p1\n   \
      \   ON t3.p_id_1 = p1.product_id\n      JOIN product p2\n      ON t3.p_id_2\
      \ = p2.product_id\n )\nSELECT \nTOP 500  sales_drivers.product_name1  AS sales_drivers.product_name1\"\
      ,\n\tCOALESCE(SUM(sales_drivers.how_many_sales ), 0) AS \"sales_drivers.total_sales_drivers\"\
      \ FROM sales_drivers\nGROUP BY sales_drivers.product_name1 \nORDER BY 2 DESC"
    row: 28
    col: 16
    width: 7
    height: 8
  - title: 'The Other Guys: Store Unit Sales'
    name: 'The Other Guys: Store Unit Sales'
    model: foodmartusa_sqlserver
    explore: sales_fact
    type: looker_map
    fields: [sales_fact.total_unit_sales, store.state]
    sorts: [sales_fact.total_unit_sales desc]
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: dark
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen: {}
    row: 10
    col: 0
    width: 7
    height: 6
  - name: Sales Fact Table Structure
    type: text
    title_text: Sales Fact Table Structure
    body_text: "Column Name                Type              \nproduct_id        \
      \               integer            \nsales_date                       ansidate\
      \                \ncustomer_id                    integer             \npromotion_id\
      \                  integer    \nstore_id                            integer\
      \          \nstore_sales                       money                       \n\
      store_cost                        decimal(10, 4)   \nunit_sales            \
      \             integer"
    row: 20
    col: 8
    width: 10
    height: 6
  - title: 'Vector: Store Unit Sales'
    name: 'Vector: Store Unit Sales'
    model: foodmartusa
    explore: sales_fact
    type: looker_map
    fields: [store.state, sales_fact.total_unit_sales]
    sorts: [sales_fact.total_unit_sales desc]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    listen: {}
    row: 2
    col: 0
    width: 7
    height: 6
  - title: 'Vector: Sales By Product Family By Region'
    name: 'Vector: Sales By Product Family By Region'
    model: foodmartusa
    explore: sales_fact
    type: looker_column
    fields: [product_class.product_family, sales_fact.total_store_sales, region.name,
      sales_fact.time_marker_v2]
    pivots: [region.name]
    sorts: [sales_fact.total_store_sales desc 0, region.name]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    color_application:
      collection_id: legacy
      palette_id: random
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      S. California - sales_fact.total_store_sales: "#36B38D"
      Gulf States - sales_fact.total_store_sales: "#D98541"
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [sales_fact.time_marker_v2]
    listen: {}
    row: 2
    col: 7
    width: 9
    height: 6
  - title: 'Vector: Top Market Basket'
    name: 'Vector: Top Market Basket'
    model: foodmartusa
    explore: sales_drivers
    type: looker_bar
    fields: [sales_drivers.product_name1, sales_drivers.total_sales_drivers, sales_drivers.time_marker_v3]
    sorts: [sales_drivers.total_sales_drivers desc]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: row()<=10,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      sales_drivers.total_sales_drivers: "#a31e67"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_points_if_no: [calculation_1]
    hidden_fields: [sales_drivers.time_marker_v3]
    listen: {}
    row: 2
    col: 16
    width: 8
    height: 6
  - name: Databases Used (live)
    type: text
    title_text: Databases Used (live)
    row: 16
    col: 0
    width: 24
    height: 2
  - name: SQL Used
    type: text
    title_text: SQL Used
    row: 26
    col: 0
    width: 24
    height: 2
  - name: Main Fact Table Structure
    type: text
    title_text: Main Fact Table Structure
    row: 20
    col: 0
    width: 8
    height: 6
  - title: 'The Other Guys: Sales Fact Row Count (live)'
    name: 'The Other Guys: Sales Fact Row Count (live)'
    model: foodmartusa_sqlserver
    explore: sales_fact
    type: single_value
    fields: [sales_fact.count]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    refresh: 30 seconds
    listen: {}
    row: 8
    col: 8
    width: 8
    height: 2
  - title: 'Vector: Sales Fact Row Count (live)'
    name: 'Vector: Sales Fact Row Count (live)'
    model: foodmartusa
    explore: sales_fact
    type: single_value
    fields: [sales_fact.count]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: false
    hidden_fields: []
    series_types: {}
    refresh: 30 seconds
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 2
  - title: 'The Other Guys: Concurrency Metrics'
    name: 'The Other Guys: Concurrency Metrics'
    model: foodmartusa_sqlserver
    explore: ccmetrics
    type: looker_single_record
    fields: [ccmetrics.queries_served, ccmetrics.average_execution_seconds]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    series_types: {}
    refresh: 10 seconds
    listen: {}
    row: 8
    col: 16
    width: 8
    height: 2
  - title: 'Vector: Concurrency Metrics'
    name: 'Vector: Concurrency Metrics'
    model: foodmartusa
    explore: ccmetrics
    type: looker_single_record
    fields: [ccmetrics.queries_served, ccmetrics.average_execution_seconds]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    series_types: {}
    refresh: 10 seconds
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 2
