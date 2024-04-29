view: subscription_logs {
  sql_table_name: billingautomation.DS_public.subscriptions_logs ;;

  dimension_group: Date{
    type: time
    datatype: date
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.day ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: plan_name {
    type: string
    sql: ${TABLE}.plan_name ;;
  }

  dimension: subscription_id {
    type: string
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: subscription_status {
    type: string
    sql: ${TABLE}.subscription_status ;;
  }

  dimension: licensed_number_of_seats {
    type: number
    sql: ${TABLE}.licensed_number_of_seats ;;
  }

  dimension: number_of_seats {
    type: number
    sql: ${TABLE}.number_of_seats ;;
  }

  dimension: maximum_number_of_seats {
    type: number
    sql: ${TABLE}.maximum_number_of_seats ;;
  }

  dimension: asigned_seats {
    type: number
    sql: CASE
      WHEN ${TABLE}.maximum_number_of_seats > 49999 THEN ${TABLE}.licensed_number_of_seats
      WHEN ${TABLE}.maximum_number_of_seats = ${TABLE}.number_of_seats THEN ${TABLE}.licensed_number_of_seats
      ELSE ${TABLE}.number_of_seats
    END ;;
  }

  dimension: total_seats {
    type: number
    sql: CASE
      WHEN ${TABLE}.maximum_number_of_seats > 49999 THEN ${TABLE}.number_of_seats
      WHEN ${TABLE}.maximum_number_of_seats = ${TABLE}.number_of_seats THEN ${TABLE}.number_of_seats
      ELSE ${TABLE}.maximum_number_of_seats
    END ;;
  }
}
