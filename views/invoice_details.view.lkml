view: invoice_details {
  sql_table_name: `DS_public.InvoiceDetails` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
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
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.endDate ;;
  }
  dimension: invoice_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.invoiceId ;;
  }
  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
  }
  dimension: sku_description {
    type: string
    sql: ${TABLE}.skuDescription ;;
  }
  dimension: sku_discount {
    type: number
    sql: ${TABLE}.skuDiscount ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.skuId ;;
  }
  dimension: sku_name {
    type: string
    sql: ${TABLE}.skuName ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.startDate ;;
  }
  dimension: taxes {
    type: string
    sql: ${TABLE}.taxes ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  measure: count {
    type: count
    drill_fields: [id, sku_name, ds_public_invoices.id]
  }
}
