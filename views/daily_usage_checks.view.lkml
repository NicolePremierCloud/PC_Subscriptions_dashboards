view: daily_usage_checks {
  sql_table_name: `DS_public.daily_usage_checks` ;;

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createdAt ;;
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
  dimension: missed_subscriptions {
    type: string
    sql: ${TABLE}.missed_subscriptions ;;
  }
  dimension: nb_daily_usages_subscriptions {
    type: number
    sql: ${TABLE}.nb_daily_usages_subscriptions ;;
  }
  dimension: nb_google_subscriptions {
    type: number
    sql: ${TABLE}.nb_google_subscriptions ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  measure: count {
    type: count
  }
}
