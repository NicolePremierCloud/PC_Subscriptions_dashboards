view: subscriptions_tracking {
  sql_table_name: `DS_public.subscriptions_tracking` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: customer_cloud_id {
    type: string
    sql: ${TABLE}.customer_cloud_id ;;
  }
  dimension: customer_domain {
    type: string
    sql: ${TABLE}.customer_domain ;;
  }
  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
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
  dimension_group: day {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day ;;
  }
  dimension: discount {
    type: string
    sql: ${TABLE}.discount ;;
  }
  dimension: invoice_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }
  dimension: is_used {
    type: string
    sql: ${TABLE}.is_used ;;
  }
  dimension: licence_type {
    type: string
    sql: ${TABLE}.licence_type ;;
  }
  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }
  dimension: price_cad {
    type: number
    sql: ${TABLE}.price_cad ;;
  }
  dimension: price_eur {
    type: number
    sql: ${TABLE}.price_eur ;;
  }
  dimension: price_usd {
    type: number
    sql: ${TABLE}.price_usd ;;
  }
  dimension: seats {
    type: number
    sql: ${TABLE}.seats ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.sku_id ;;
  }
  dimension: sku_name {
    type: string
    sql: ${TABLE}.sku_name ;;
  }
  dimension: subscription_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }
  dimension: with_extra_day_usage {
    type: yesno
    sql: ${TABLE}.with_extra_day_usage ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	sku_name,
	subscriptions.plan_name,
	subscriptions.sku_name,
	subscriptions.subscription_id,
	ds_public_invoices.id,
	customers.firstname,
	customers.id,
	customers.lastname
	]
  }

}
