view: ds_public_invoices {
  sql_table_name: `DS_public.Invoices` ;;
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
  dimension_group: due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dueDate ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.endDate ;;
  }
  dimension: freshbooks_id {
    type: string
    sql: ${TABLE}.freshbooksId ;;
  }
  dimension: freshbooks_invoice_id {
    type: number
    sql: ${TABLE}.freshbooksInvoiceId ;;
  }
  dimension: freshbooks_invoice_number {
    type: string
    sql: ${TABLE}.freshbooksInvoiceNumber ;;
  }
  dimension: freshbooks_invoice_status {
    type: string
    sql: ${TABLE}.freshbooksInvoiceStatus ;;
  }
  dimension: freshbooks_url {
    type: string
    sql: ${TABLE}.freshbooksUrl ;;
  }
  dimension: payment_status {
    type: string
    sql: ${TABLE}.paymentStatus ;;
  }
  dimension: sent_to_freshbooks {
    type: yesno
    sql: ${TABLE}.sentToFreshbooks ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.startDate ;;
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
	customers.firstname,
	customers.id,
	customers.lastname,
	invoice_details.count,
	daily_changes.count,
	daily_usages.count,
	monthly_usages.count,
	gcp_usages.count,
	subscriptions_tracking.count
	]
  }

}
