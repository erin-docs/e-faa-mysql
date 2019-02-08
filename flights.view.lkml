view: flights {
  label: "flight_info"
  sql_table_name: flightstats.accidents ;;

  dimension: id {
    label: "id"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: air_carrier {
    label: "airline"
    type: string
    sql: ${TABLE}.air_carrier ;;
  }

  dimension: country {
    label: "country"
    description: "country_of_departure"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: number_of_engines {
    label: "number_of_engines"
    type: string
    sql: ${TABLE}.number_of_engines ;;
  }

  dimension: location {
  #  label: "location"  <-- In the localization Docs, I use this as an example of something that doesn't have a label and so isn't localized
    type: string
    sql: ${TABLE}.location ;;
  }



  dimension: from_US {
    label: "from_us"
    type: string
    sql: CASE
         WHEN ${TABLE}.country = "United States" THEN "{{ _localization['domestic'] }}"
         ELSE "{{ _localization['international'] }}"
       END;;
  }




  dimension: purpose_of_flight {
    label: "Reason for Flying"
    type: string
    sql: ${TABLE}.purpose_of_flight ;;
  }

  dimension: injury_severity {
    label:"Severity of Injury"
    type: string
    sql: ${TABLE}.injury_severity ;;
  }

  dimension: accident_number {
    label: "Accident Number"
    type: string
    sql: ${TABLE}.accident_number ;;
  }


  dimension: aircraft_category {
    type: string
    sql: ${TABLE}.aircraft_category ;;
  }

  dimension: aircraft_damage {
    type: string
    sql: ${TABLE}.aircraft_damage ;;
  }

  dimension: airport_code {
    type: string
    sql: ${TABLE}.airport_code ;;
  }

  dimension: airport_name {
    type: string
    sql: ${TABLE}.airport_name ;;
  }

  dimension: amateur_built {
    type: string
    sql: ${TABLE}.amateur_built ;;
  }

  dimension: broad_phase_of_flight {
    type: string
    sql: ${TABLE}.broad_phase_of_flight ;;
  }


  dimension: engine_type {
    type: string
    sql: ${TABLE}.engine_type ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_date ;;
  }



  dimension: faa_event_date {
    group_item_label: "test"
    type: date_raw
    sql: ${TABLE}.event_date ;;
  }

  dimension_group: since_certification {
    type: duration
    intervals: [week, year]
    sql_start: ${TABLE}.event_date ;;
    sql_end: ${TABLE}.publication_date ;;
    }



#   dimension_group: enrolled {
#     type: duration
#     intervals: [week, year]
#     sql_start: ${TABLE}.enroll_date ;;
#     sql_end: ${TABLE}.graduation_date ;;
#   }
#


  dimension_group: enrolled {
    type: duration
    intervals: [week, year]
    sql_start: ${TABLE}.event_date ;;
    sql_end: ${TABLE}.publication_date ;;
  }

  dimension_group: since_event {
    type: duration
    intervals: [hour, day]
    sql_start: ${faa_event_date} ;;
    sql_end: current_timestamp();;
    }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: far_description {
    type: string
    sql: ${TABLE}.far_description ;;
  }

  dimension: investigation_type {
    type: string
    sql: ${TABLE}.investigation_type ;;
  }

  dimension: latitude {
    group_label: "GPS Coordinates"
    group_item_label: "GPS latitude"
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    group_label: "GPS Coordinates"
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: make {
    type: string
    sql: ${TABLE}.make ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: number_of_fatalities {
    type: string
    sql: ${TABLE}.number_of_fatalities ;;
  }

  dimension: number_of_minor_injuries {
    type: string
    sql: ${TABLE}.number_of_minor_injuries ;;
  }

  dimension: number_of_serious_injuries {
    type: string
    sql: ${TABLE}.number_of_serious_injuries ;;
  }

  dimension: number_of_uninjured {
    type: string
    sql: ${TABLE}.number_of_uninjured ;;
  }

  dimension_group: publication {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.publication_date ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: report_status {
    type: string
    sql: ${TABLE}.report_status ;;
  }

  dimension: schedule {
    type: string
    sql: ${TABLE}.schedule ;;
  }

  dimension: weather_condition {
    type: string
    sql: ${TABLE}.weather_condition ;;
  }

  measure: count {
    type: count
    drill_fields: [id, airport_name]
  }
}
