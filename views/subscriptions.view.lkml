view: subscriptions {
  sql_table_name: `DS_public.Subscriptions` ;;
  drill_fields: [subscription_id]

  dimension: subscription_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.subscriptionId ;;
  }
  dimension: billing_method {
    type: string
    sql: ${TABLE}.billingMethod ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createdAt ;;
  }
  dimension: creation_time {
    type: string
    sql: ${TABLE}.creationTime ;;
  }
  dimension: customer_domain {
    type: string
    sql: ${TABLE}.customerDomain ;;
  }
  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.customerId ;;
  }
  dimension: datastream_metadata__source_timestamp {
    type: number
    sql: ${TABLE}.datastream_metadata.source_timestamp ;;
    group_label: "Datastream Metadata"
    group_item_label: "Source Timestamp"
  }
  dimension: datastream_metadata__uuid {
    type: string
    sql: ${TABLE}.datastream_metadata.uuid ;;
    group_label: "Datastream Metadata"
    group_item_label: "Uuid"
  }
  dimension: end_time {
    type: string
    sql: ${TABLE}.endTime ;;
  }
  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: is_commitment_plan {
    type: yesno
    sql: ${TABLE}.isCommitmentPlan ;;
  }
  dimension: is_in_trial {
    type: yesno
    sql: ${TABLE}.isInTrial ;;
  }
  dimension: is_not_google_product {
    type: yesno
    sql: ${TABLE}.is_not_google_product ;;
  }
  dimension: is_removed {
    type: yesno
    sql: ${TABLE}.is_removed ;;
  }
  dimension: licensed_number_of_seats {
    type: number
    sql: ${TABLE}.licensedNumberOfSeats ;;
  }
  dimension: margin {
    type: number
    sql: ${TABLE}.margin ;;
  }
  dimension: maximum_number_of_seats {
    type: number
    sql: ${TABLE}.maximumNumberOfSeats ;;
  }
  dimension: number_of_seats {
    type: number
    sql: ${TABLE}.numberOfSeats ;;
  }
  dimension: plan_name {
    type: string
    sql: ${TABLE}.planName ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.skuId ;;
  }
  dimension: sku_name {
    type: string
    sql: ${TABLE}.skuName ;;
  }
  dimension: start_time {
    type: string
    sql: ${TABLE}.startTime ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: trial_end_time {
    type: string
    sql: ${TABLE}.trialEndTime ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	subscription_id,
	plan_name,
	sku_name,
	customers.firstname,
	customers.id,
	customers.lastname,
	discounts.count,
	activities.count,
	notifications.count,
	subscription_pricing_books.count,
	daily_change_prices.count,
	daily_changes.count,
	daily_usage_prices.count,
	daily_usages.count,
	daily_usages_suspended.count,
	subscriptions_logs.count,
	subscriptions_tracking.count,
	subscriptions_tracking_prices.count
	]
  }

}
