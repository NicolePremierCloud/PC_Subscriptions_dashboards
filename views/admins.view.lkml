view: admins {
  sql_table_name: `DS_public.Admins` ;;
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
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }
  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }
  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }
  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  measure: count {
    type: count
    drill_fields: [id, firstname, lastname, admin_roles.count]
  }
}
