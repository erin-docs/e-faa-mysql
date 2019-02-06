- dashboard: localized_dashboard
  title: Localized Dashboard
  layout: newspaper
  elements:
  - title: Localized Look
    name: Localized Look
    model: e_faa_mysql
    explore: extended_explore
    type: table
    fields:
    - flights.event_date
    - flights.number_of_engines
    sorts:
    - flights.event_date desc
    limit: 500
    query_timezone: America/Los_Angeles
    row: 0
    col: 0
    width: 8
    height: 6
