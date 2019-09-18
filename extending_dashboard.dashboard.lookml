- dashboard: extending_dashboard
  extends: localized_dashboard
  title: Extending Dashboard Title
  elements:
  - name: Localized Look
    title: extended look title
    name: Number of Engines
    model: e_faa_mysql
    explore: flights
    type: looker_bar
    fields:
    - flights.air_carrier
    - flights.number_of_engines
    - flights.count
    pivots:
    - flights.number_of_engines
    filters:
      flights.count: NOT NULL
      flights.air_carrier: "-EMPTY"
    sorts:
    - flights.count desc 0
    - flights.number_of_engines
    limit: 5
    query_timezone: America/Los_Angeles
    series_types: {}
    listen: {}
    width: 19
    height: 6
