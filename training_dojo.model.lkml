connection: "looker_dojo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
#
    explore: sales_data {
      join: store_master {
        type: left_outer
        relationship: many_to_one
        sql_on: ${sales_data.store_id} = ${store_master.store_id};;
        }
      }
    explore: sales_data_summary {
      join: sales_data {
        type: left_outer
        relationship: many_to_one
        sql_on: DATEADD(year,1,${sales_data_summary.sales_day_2019}) = ${sales_data.sales_date_month} ;;
        }
      }
      explore: budget_data {
        join: sales_data {
          type: left_outer
          relationship: many_to_one
          sql_on: ${budget_data.store_id} = ${sales_data.store_id} ;;
        }
      }

      explore: store_master {
        join: budget_data {
          type: left_outer
          relationship: many_to_one
          sql_on: ${store_master.store_id} = ${budget_data.store_id} ;;
        }
      }

      explore: product_master {
        extends: [sales_data,category_master]
        join: sales_data {
          type: left_outer
          relationship: one_to_many
          sql_on: ${product_master.product_id} = ${sales_data.product_id} ;;
        }
        join: category_master {
          type: left_outer
          relationship: many_to_one
          sql_on: ${product_master.category_id} = ${category_master.category_id} ;;
        }
      }

      explore: category_master {
        join: product_master {
          type: left_outer
          relationship: one_to_many
          sql_on: ${category_master.category_id} = ${product_master.category_id} ;;
        }
      }

      explore: member_info {
        join: sales_data {
          type: left_outer
          relationship: one_to_many
          sql_on: ${member_info.customer_id} = ${sales_data.customer_id} ;;
        }
      }
