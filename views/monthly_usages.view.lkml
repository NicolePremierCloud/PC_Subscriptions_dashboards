view: monthly_usages {
  sql_table_name: `DS_public.monthly_usages` ;;
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
  dimension: currency_id {
    type: number
    sql: ${TABLE}.currency_id ;;
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
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }
  dimension: invoice_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.invoice_id ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }
  dimension: resource_type {
    type: string
    sql: ${TABLE}.resource_type ;;
  }
  dimension: seats {
    type: number
    sql: ${TABLE}.seats ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  dimension: subscription {
    type: string
    sql: ${TABLE}.subscription ;;
  }
  dimension: unit {
    type: string
    sql: ${TABLE}.unit ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  measure: count {
    type: count
    drill_fields: [id, ds_public_invoices.id, customers.firstname, customers.id, customers.lastname]
  }
}
