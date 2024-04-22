view: subscription_pricing_books {
  sql_table_name: `DS_public.SubscriptionPricingBooks` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createdAt ;;
  }
  dimension: customer_id {
    type: number
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
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.endDate ;;
  }
  dimension: pricing_book_id {
    type: number
    sql: ${TABLE}.pricingBookId ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.startDate ;;
  }
  dimension: subscription_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.subscriptionId ;;
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
	id,
	customers.firstname,
	customers.id,
	customers.lastname,
	subscriptions.plan_name,
	subscriptions.sku_name,
	subscriptions.subscription_id
	]
  }

}
