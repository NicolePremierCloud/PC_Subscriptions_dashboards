view: google_ids {
  sql_table_name: `DS_public.GoogleIds` ;;
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
  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }
  dimension: free_domain {
    type: string
    sql: ${TABLE}.freeDomain ;;
  }
  dimension: google_id {
    type: string
    sql: ${TABLE}.googleId ;;
  }
  dimension: is_free_domain {
    type: yesno
    sql: ${TABLE}.is_free_domain ;;
  }
  dimension: sub_billing_account_id {
    type: string
    sql: ${TABLE}.sub_billing_account_id ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  measure: count {
    type: count
    drill_fields: [id, account_name, customers.firstname, customers.id, customers.lastname]
  }
}
