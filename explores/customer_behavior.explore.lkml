# include: "/views/users.view"
# include: "/views/order_items.view"

# explore: customer_behavior {
#   group_label: "Customer Behavior"
#   view_name: users

#   join: order_items {
#     sql_on: ${account.pk_id} = ${sf_opportunity_facts.account_id}  ;;
#     relationship: one_to_one
#   }
