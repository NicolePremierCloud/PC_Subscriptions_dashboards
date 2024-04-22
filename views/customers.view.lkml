view: customers {
  sql_table_name: `DS_public.Customers` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: billing_currency_id {
    type: number
    sql: ${TABLE}.billingCurrencyId ;;
  }
  dimension: billing_cycle {
    type: string
    sql: ${TABLE}.billingCycle ;;
  }
  dimension: billing_day {
    type: string
    sql: ${TABLE}.billingDay ;;
  }
  dimension: billing_language_code {
    type: string
    sql: ${TABLE}.billingLanguageCode ;;
  }
  dimension: billing_type {
    type: string
    sql: ${TABLE}.billingType ;;
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
  dimension: due_date_id {
    type: number
    sql: ${TABLE}.dueDateId ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }
  dimension: freshbooks_id {
    type: string
    sql: ${TABLE}.freshbooksId ;;
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
  dimension: payment_method_id {
    type: number
    sql: ${TABLE}.paymentMethodId ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: pricing_book_id {
    type: number
    sql: ${TABLE}.pricingBookId ;;
  }
  dimension: pricing_book_type {
    type: string
    sql: ${TABLE}.pricingBookType ;;
  }
  dimension: region_code {
    type: string
    sql: ${TABLE}.regionCode ;;
  }
  dimension_group: start_billing {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.startBillingDate ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: street_address {
    type: string
    sql: ${TABLE}.streetAddress ;;
  }
  dimension: timezone_offset {
    type: number
    sql: ${TABLE}.timezoneOffset ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updatedAt ;;
  }
  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zipCode ;;
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
	discounts.count,
	contacts.count,
	activities.count,
	ds_public_invoices.count,
	google_customers.count,
	google_ids.count,
	notifications.count,
	subscription_pricing_books.count,
	taxes.count,
	daily_change_prices.count,
	subscriptions.count,
	daily_changes.count,
	daily_usage_prices.count,
	daily_usages.count,
	daily_usages_suspended.count,
	google_usages.count,
	gcp_detailed_usages.count,
	monthly_usages.count,
	gcp_usages.count,
	invoice_histories.count,
	subscriptions_logs.count,
	ds_public_invoices.count,
	subscriptions_tracking.count,
	subscriptions_tracking_prices.count
	]
  }

}
