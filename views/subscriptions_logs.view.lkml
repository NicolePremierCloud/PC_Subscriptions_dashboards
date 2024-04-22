view: subscriptions_logs {
  sql_table_name: `DS_public.subscriptions_logs` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: creation {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.creation_date ;;
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
  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }
  dimension: licensed_number_of_seats {
    type: number
    sql: ${TABLE}.licensed_number_of_seats ;;
  }
  dimension: maximum_number_of_seats {
    type: number
    sql: ${TABLE}.maximum_number_of_seats ;;
  }
  dimension: number_of_seats {
    type: number
    sql: ${TABLE}.number_of_seats ;;
  }
  dimension: plan_name {
    type: string
    sql: ${TABLE}.plan_name ;;
  }
  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  dimension: subscription_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }
  dimension: subscription_status {
    type: string
    sql: ${TABLE}.subscription_status ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	plan_name,
	subscriptions.plan_name,
	subscriptions.sku_name,
	subscriptions.subscription_id,
	customers.firstname,
	customers.id,
	customers.lastname
	]
  }

}
