view: meta_data {
  sql_table_name: `DS_public.MetaData` ;;
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
  dimension_group: from {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`from` ;;
  }
  dimension: is_default {
    type: yesno
    sql: ${TABLE}.is_default ;;
  }
  dimension: iso_code {
    type: string
    sql: ${TABLE}.iso_code ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension_group: to {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.`to` ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
