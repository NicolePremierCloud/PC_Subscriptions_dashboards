view: daily_usages_suspended {
  sql_table_name: `DS_public.daily_usages_suspended` ;;

  dimension: content_json {
    type: string
    sql: ${TABLE}.content_json ;;
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
  dimension: subscription_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
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
	customers.lastname
	]
  }

}
