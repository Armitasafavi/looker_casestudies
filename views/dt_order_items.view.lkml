view: dt_order_items {
  derived_table: {
    sql: select
    order_items.user_id as user_id,
    count(*) as total_lifetime_items,
    count( distinct order_items.order_id) as total_lifetime_orders,
    sum(order_items.sale_price) as total_lifetime_revenue,
    min(order_items.created_at) as first_order,
    max(order_items.created_at) as last_order
    from order_items
    group by user_id
    ;;

  }

  dimension: user_id {
    primary_key: yes
  }

  dimension: lifetime_items {
    type: number
    sql: COALESCE(${TABLE}.total_lifetime_items,0) ;;
  }

  dimension: lifetime_orders {
    type: number
    sql: COALESCE(${TABLE}.total_lifetime_orders,0) ;;
  }


  dimension: customer_lifetime_orders {
    type: tier
    tiers: [0,1,2,5,10]
    style: integer
    sql: ${total_lifetime_orders] ;;
  }

  dimension: customer_lifetime_revenue {
    type: tier
    style: integer
    tiers: [0,4.99,19.99, 49.99, 99.99, 499.99, 999.00]
    value_format: "$#,##0"
  }

























  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: dt_order_items {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
