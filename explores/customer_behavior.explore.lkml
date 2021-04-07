# include: "/views/users.view"
# include: "/views/order_items.view"

# explore: customer_behavior {
#   group_label: "Customer Behavior"
#   view_name: users

#   join: order_items {
#     sql_on: ${users.id} = ${order_items.user_id}  ;;
#     relationship: one_to_one
#   }
# }
