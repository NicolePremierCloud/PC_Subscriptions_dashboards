view: contacts {
  sql_table_name: `DS_public.Contacts` ;;
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
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }
  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension: to_be_notified {
    type: yesno
    sql: ${TABLE}.toBeNotified ;;
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
	firstname,
	lastname,
	customers.firstname,
	customers.id,
	customers.lastname
	]
  }

}
