view: sql_trigger_if {
  derived_table: {
    sql_trigger_if: SELECT
CASE WHEN ((SELECT COUNT(*) FROM flights) > (SELECT COUNT(*) FROM ontime)) THEN TRUE
ELSE FALSE
END;;
    explore_source: flights {
      column: air_carrier {}
      column: event_id {}
    }
  }

  dimension: air_carrier {}
  dimension: event_id {}
  }
