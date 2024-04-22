view: google_customers {
  sql_table_name: `DS_public.GoogleCustomers` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: account_name {
    type: string
    sql: ${TABLE}.accountName ;;
  }
  dimension: country_code {
    type: string
    sql: ${TABLE}.countryCode ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.createdAt ;;
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
  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }
  dimension: language_code {
    type: string
    sql: ${TABLE}.languageCode ;;
  }
  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }
  dimension: locality {
    type: string
    sql: ${TABLE}.locality ;;
  }
  dimension: organization {
    type: string
    sql: ${TABLE}.organization ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: region_code {
    type: string
    sql: ${TABLE}.regionCode ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
	account_name,
	lastname,
	customers.firstname,
	customers.id,
	customers.lastname
	]
  }

}
