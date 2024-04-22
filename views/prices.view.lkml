view: prices {
  sql_table_name: `DS_public.Prices` ;;
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
    sql: ${TABLE}.currencyId ;;
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
  dimension: pricing_book_id {
    type: number
    sql: ${TABLE}.pricingBookId ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.productId ;;
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
    type: number
    sql: ${TABLE}.value ;;
  }
  measure: count {
    type: count
    drill_fields: [id, products.product_name, products.sku_name, products.id]
  }
}
