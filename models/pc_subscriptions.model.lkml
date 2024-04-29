connection: "pc_subscriptions"

# include all the views
include: "/views/**/*.view.lkml"
include: "/subscription_logs.view.lkml"

datagroup: pc_subscriptions_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pc_subscriptions_default_datagroup

explore: subscription_logs {}

explore: customers {}

explore: discounts {
  join: customers {
    type: left_outer
    sql_on: ${discounts.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: subscriptions {
    type: left_outer
    sql_on: ${discounts.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }
}

explore: admin_roles {
  join: roles {
    type: left_outer
    sql_on: ${admin_roles.role_id} = ${roles.id} ;;
    relationship: many_to_one
  }

  join: admins {
    type: left_outer
    sql_on: ${admin_roles.admin_id} = ${admins.id} ;;
    relationship: many_to_one
  }
}

explore: contacts {
  join: customers {
    type: left_outer
    sql_on: ${contacts.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: admins {}

explore: activities {
  join: customers {
    type: left_outer
    sql_on: ${activities.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: subscriptions {
    type: left_outer
    sql_on: ${activities.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }
}


explore: meta_data {}

explore: freshbooks_tokens {}

explore: google_customers {
  join: customers {
    type: left_outer
    sql_on: ${google_customers.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: invoice_details {
  join: ds_public_invoices {
    type: left_outer
    sql_on: ${invoice_details.invoice_id} = ${ds_public_invoices.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${ds_public_invoices.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: permissions {}

explore: prices {
  join: products {
    type: left_outer
    sql_on: ${prices.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: google_ids {
  join: customers {
    type: left_outer
    sql_on: ${google_ids.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: roles {}

explore: notifications {
  join: customers {
    type: left_outer
    sql_on: ${notifications.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: subscriptions {
    type: left_outer
    sql_on: ${notifications.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }
}

explore: sequelize_meta {}

explore: subscription_pricing_books {
  join: customers {
    type: left_outer
    sql_on: ${subscription_pricing_books.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: subscriptions {
    type: left_outer
    sql_on: ${subscription_pricing_books.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }
}

explore: taxes {
  join: customers {
    type: left_outer
    sql_on: ${taxes.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: daily_change_prices {
  join: subscriptions {
    type: left_outer
    sql_on: ${daily_change_prices.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${daily_change_prices.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: daily_changes {
    type: left_outer
    sql_on: ${daily_change_prices.daily_change_id} = ${daily_changes.id} ;;
    relationship: many_to_one
  }

  join: ds_public_invoices {
    type: left_outer
    sql_on: ${daily_changes.invoice_id} = ${ds_public_invoices.id} ;;
    relationship: many_to_one
  }
}

explore: subscriptions {
  join: customers {
    type: left_outer
    sql_on: ${subscriptions.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: daily_changes {
  join: subscriptions {
    type: left_outer
    sql_on: ${daily_changes.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }

  join: ds_public_invoices {
    type: left_outer
    sql_on: ${daily_changes.invoice_id} = ${ds_public_invoices.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${daily_changes.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: daily_usage_prices {
  join: subscriptions {
    type: left_outer
    sql_on: ${daily_usage_prices.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${daily_usage_prices.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: daily_usage_checks {}

explore: daily_usages {
  join: subscriptions {
    type: left_outer
    sql_on: ${daily_usages.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }

  join: ds_public_invoices {
    type: left_outer
    sql_on: ${daily_usages.invoice_id} = ${ds_public_invoices.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${daily_usages.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: daily_usages_suspended {
  join: subscriptions {
    type: left_outer
    sql_on: ${daily_usages_suspended.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${daily_usages_suspended.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: google_usages {
  join: customers {
    type: left_outer
    sql_on: ${google_usages.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: gcp_detailed_usages {
  join: customers {
    type: left_outer
    sql_on: ${gcp_detailed_usages.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: monthly_usages {
  join: ds_public_invoices {
    type: left_outer
    sql_on: ${monthly_usages.invoice_id} = ${ds_public_invoices.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${monthly_usages.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: gcp_usages {
  join: ds_public_invoices {
    type: left_outer
    sql_on: ${gcp_usages.invoice_id} = ${ds_public_invoices.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${gcp_usages.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: invoice_histories {
  join: customers {
    type: left_outer
    sql_on: ${invoice_histories.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: subscriptions_logs {
  join: subscriptions {
    type: left_outer
    sql_on: ${subscriptions_logs.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${subscriptions_logs.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: ds_public_invoices {
  join: customers {
    type: left_outer
    sql_on: ${ds_public_invoices.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: subscriptions_tracking {
  join: subscriptions {
    type: left_outer
    sql_on: ${subscriptions_tracking.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }

  join: ds_public_invoices {
    type: left_outer
    sql_on: ${subscriptions_tracking.invoice_id} = ${ds_public_invoices.id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${subscriptions_tracking.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }
}

explore: subscriptions_tracking_prices {
  join: customers {
    type: left_outer
    sql_on: ${subscriptions_tracking_prices.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: subscriptions {
    type: left_outer
    sql_on: ${subscriptions_tracking_prices.subscription_id} = ${subscriptions.subscription_id} ;;
    relationship: many_to_one
  }
}
