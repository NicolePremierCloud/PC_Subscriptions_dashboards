view: gcp_detailed_usages {
  sql_table_name: `DS_public.gcp_detailed_usages` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }
  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createdAt ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
  dimension: currency_id {
    type: number
    sql: ${TABLE}.currency_id ;;
  }
  dimension: customer_cloud_id {
    type: string
    sql: ${TABLE}.customer_cloud_id ;;
  }
  dimension: customer_cost {
    type: number
    sql: ${TABLE}.customer_cost ;;
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
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }
  dimension: service {
    type: string
    sql: ${TABLE}.service ;;
  }
  dimension: sku_description {
    type: string
    sql: ${TABLE}.sku_description ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.sku_id ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  dimension: usage_amount {
    type: number
    sql: ${TABLE}.usage_amount ;;
  }
  dimension_group: usage_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_end_time ;;
  }
  dimension_group: usage_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_start_time ;;
  }
  dimension: usage_unit {
    type: string
    sql: ${TABLE}.usage_unit ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	project_name,
	account_name,
	customers.firstname,
	customers.id,
	customers.lastname
	]
  }

}
