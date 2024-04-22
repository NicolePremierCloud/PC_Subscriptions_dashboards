view: daily_change_prices {
  sql_table_name: `DS_public.daily_change_prices` ;;

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createdAt ;;
  }
  dimension: currency_id {
    type: number
    sql: ${TABLE}.currencyId ;;
  }
  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }
  dimension: daily_change_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.dailyChangeId ;;
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
  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	subscriptions.plan_name,
	subscriptions.sku_name,
	subscriptions.subscription_id,
	customers.firstname,
	customers.id,
	customers.lastname,
	daily_changes.sku_name,
	daily_changes.id
	]
  }

}
