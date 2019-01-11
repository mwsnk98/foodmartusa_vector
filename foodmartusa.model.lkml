connection: "vectorfoodmartusa"

# include all the views
include: "*.view"

datagroup: foodmartusa_default_datagroup {
  sql_trigger: SELECT CURRENT_TIMESTAMP;;
  max_cache_age: "0 seconds"
}


persist_with: foodmartusa_default_datagroup

explore: account {}

explore: category {}

explore: customer {
  join: region {
    type: left_outer
    sql_on: ${customer.region_id} = ${region.region_id} ;;
    relationship: many_to_one
  }
}

explore: department {}

explore: employee {
  join: store {
    type: left_outer
    sql_on: ${employee.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: position {
    type: left_outer
    sql_on: ${employee.position_id} = ${position.position_id} ;;
    relationship: many_to_one
  }

  join: department {
    type: left_outer
    sql_on: ${employee.department_id} = ${department.department_id} ;;
    relationship: many_to_one
  }

  join: region {
    type: left_outer
    sql_on: ${store.region_id} = ${region.region_id} ;;
    relationship: many_to_one
  }
}

explore: expense_fact {
  join: store {
    type: left_outer
    sql_on: ${expense_fact.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: account {
    type: left_outer
    sql_on: ${expense_fact.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }

  join: category {
    type: left_outer
    sql_on: ${expense_fact.category_id} = ${category.category_id} ;;
    relationship: many_to_one
  }

  join: region {
    type: left_outer
    sql_on: ${store.region_id} = ${region.region_id} ;;
    relationship: many_to_one
  }
}

explore: inventory_fact {
  join: warehouse {
    type: left_outer
    sql_on: ${inventory_fact.warehouse_id} = ${warehouse.warehouse_id} ;;
    relationship: many_to_one
  }

  join: product {
    type: left_outer
    sql_on: ${inventory_fact.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }

  join: store {
    type: left_outer
    sql_on: ${inventory_fact.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: warehouse_class {
    type: left_outer
    sql_on: ${warehouse.warehouse_class_id} = ${warehouse_class.warehouse_class_id} ;;
    relationship: many_to_one
  }

  join: product_class {
    type: left_outer
    sql_on: ${product.product_class_id} = ${product_class.product_class_id} ;;
    relationship: many_to_one
  }

  join: region {
    type: left_outer
    sql_on: ${store.region_id} = ${region.region_id} ;;
    relationship: many_to_one
  }
}

explore: position {}

explore: product {
  join: product_class {
    type: left_outer
    sql_on: ${product.product_class_id} = ${product_class.product_class_id} ;;
    relationship: many_to_one
  }
}

explore: product_class {}

explore: promotion {}

explore: region {}

explore: sales_fact {
  join: product {
    type: left_outer
    sql_on: ${sales_fact.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }

  join: customer {
    type: left_outer
    sql_on: ${sales_fact.customer_id} = ${customer.customer_id} ;;
    relationship: many_to_one
  }

  join: promotion {
    type: left_outer
    sql_on: ${sales_fact.promotion_id} = ${promotion.promotion_id} ;;
    relationship: many_to_one
  }

  join: store {
    type: left_outer
    sql_on: ${sales_fact.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: product_class {
    type: left_outer
    sql_on: ${product.product_class_id} = ${product_class.product_class_id} ;;
    relationship: many_to_one
  }

  join: region {
    type: left_outer
    sql_on: ${customer.region_id} = ${region.region_id} ;;
    relationship: many_to_one
  }
}

explore: store {
  join: region {
    type: left_outer
    sql_on: ${store.region_id} = ${region.region_id} ;;
    relationship: many_to_one
  }
}


explore: warehouse {
  join: warehouse_class {
    type: left_outer
    sql_on: ${warehouse.warehouse_class_id} = ${warehouse_class.warehouse_class_id} ;;
    relationship: many_to_one
  }
}

explore: warehouse_class {}

# Commented out by bruce to get through validation
# explore: basket_drivers {}

explore: sales_drivers {}

explore: db_version{}
