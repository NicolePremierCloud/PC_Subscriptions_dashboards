view: ranked_subscription_data {

    derived_table: {
      sql: WITH ranked_data AS (
        SELECT
          day,
          subscription_id,
          customer_id,
          domain,
          product,
          plan_name,
          subscription_status,
          -- Redefine number_of_seats based on the CASE statement
          CASE
            WHEN maximum_number_of_seats > 49999 OR maximum_number_of_seats = number_of_seats THEN number_of_seats
            ELSE maximum_number_of_seats
          END AS number_of_seats,
          LAG(
            CASE
              WHEN maximum_number_of_seats > 49999 OR maximum_number_of_seats = number_of_seats THEN number_of_seats
              ELSE maximum_number_of_seats
            END
          ) OVER (PARTITION BY subscription_id ORDER BY day DESC) AS previous_seats
        FROM
          billingautomation.DS_public.subscriptions_logs
      )

      SELECT
        day,
        subscription_id,
        customer_id,
        domain,
        product,
        plan_name,
        subscription_status,
        number_of_seats AS current_seats,
        IFNULL(previous_seats, 0) AS previous_seats,
        number_of_seats - IFNULL(previous_seats, 0) AS change_in_seats,
        abs(number_of_seats - IFNULL(previous_seats, 0)) AS change_in_seats_absolute,
        CASE
          WHEN IFNULL(previous_seats, 0) = 0 THEN 0  -- The percentage change is zero if the previous number of seats is zero.
          ELSE ROUND((number_of_seats - IFNULL(previous_seats, 0)) / IFNULL(previous_seats, 1) * 100, 2)
        END AS percentage_change
      FROM
        ranked_data
      ORDER BY
        day DESC, subscription_id ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: day {
      type: date
      datatype: date
      sql: ${TABLE}.day ;;
    }

    dimension: subscription_id {
      type: string
      sql: ${TABLE}.subscription_id ;;
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

    dimension: subscription_status {
      type: string
      sql: ${TABLE}.subscription_status ;;
    }

    dimension: current_seats {
      type: number
      sql: ${TABLE}.current_seats ;;
    }

    dimension: previous_seats {
      type: number
      sql: ${TABLE}.previous_seats ;;
    }

    dimension: change_in_seats {
      type: number
      sql: ${TABLE}.change_in_seats ;;
    }

    dimension: change_in_seats_absolute {
      type: number
      sql: ${TABLE}.change_in_seats_absolute ;;
    }

    dimension: percentage_change {
      type: number
      sql: ${TABLE}.percentage_change ;;
    }

  measure: sum_current_seats {
    type: sum
    sql: ${current_seats} ;;
  }

  measure: sum_change_in_seats_absolute {
    type: sum
    sql: ${change_in_seats_absolute} ;;
  }

  measure: sum_change_in_seats {
    type: sum
    sql: ${change_in_seats} ;;
  }

  measure: sum_previous_seats {
    type: sum
    sql: ${previous_seats} ;;
  }

  measure: consolidated_change {
    type: number
    sql: CASE
    WHEN ${sum_current_seats} = 0 AND ${sum_change_in_seats_absolute} != 0 THEN -1
    WHEN ${sum_current_seats} = 0 AND $(${sum_previous_seats} THEN 0 -- Handle division by zero when sum_current_seats is zero
    ELSE (${sum_change_in_seats} / ${sum_current_seats})
    END ;;
  }

    set: detail {
      fields: [
        day,
        subscription_id,
        customer_id,
        domain,
        product,
        plan_name,
        subscription_status,
        current_seats,
        previous_seats,
        change_in_seats,
        change_in_seats_absolute,
        percentage_change
      ]
    }
  }
