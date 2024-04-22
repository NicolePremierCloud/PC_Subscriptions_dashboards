view: notifications {
  sql_table_name: `DS_public.Notifications` ;;
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
  dimension: event_type {
    type: string
    sql: ${TABLE}.eventType ;;
  }
  dimension: message_id {
    type: string
    sql: ${TABLE}.messageId ;;
  }
  dimension_group: publish {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.publishTime ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.skuId ;;
  }
  dimension: subscription {
    type: string
    sql: ${TABLE}.subscription ;;
  }
  dimension: subscription_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.subscriptionId ;;
  }
  dimension: subscription_suspension_reason {
    type: string
    sql: ${TABLE}.subscriptionSuspensionReason ;;
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
