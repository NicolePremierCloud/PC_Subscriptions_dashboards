view: products {
  sql_table_name: `DS_public.Products` ;;
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
  dimension: flexible_price_cad {
    type: number
    sql: ${TABLE}.flexiblePriceCad ;;
  }
  dimension: flexible_price_eur {
    type: number
    sql: ${TABLE}.flexiblePriceEur ;;
  }
  dimension: flexible_price_usd {
    type: number
    sql: ${TABLE}.flexiblePriceUsd ;;
  }
  dimension: is_isv_product {
    type: yesno
    sql: ${TABLE}.is_isv_product ;;
  }
  dimension: is_premiercloud_product {
    type: yesno
    sql: ${TABLE}.is_premiercloud_product ;;
  }
  dimension: price_cad {
    type: number
    sql: ${TABLE}.priceCad ;;
  }
  dimension: price_eur {
    type: number
    sql: ${TABLE}.priceEur ;;
  }
  dimension: price_usd {
    type: number
    sql: ${TABLE}.priceUsd ;;
  }
  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.productId ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.productName ;;
  }
  dimension: sku_description {
    type: string
    sql: ${TABLE}.skuDescription ;;
  }
  dimension: sku_id {
    type: string
    sql: ${TABLE}.skuId ;;
  }
  dimension: sku_name {
    type: string
    sql: ${TABLE}.skuName ;;
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
	product_name,
	sku_name,
	products.product_name,
	products.sku_name,
	products.id,
	prices.count,
	products.count
	]
  }

}
