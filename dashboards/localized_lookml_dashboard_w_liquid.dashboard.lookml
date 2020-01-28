- dashboard: localized_dashboard_with_localized_filters
  title: Localizeddashboard
  layout: newspaper
#  filters:   <!--A test of _localization and _user_attributes at the dashboard level-->
#  - name: engine filter
#    title: engine filter
#    type: field_filter
#    default_value: "{{ _user_attributes['locale']}}"
#    default_value: "{{ _localization['number_of_engines']}}"
#    allow_multiple_values: true
#    required: false
#    explore: flights
#    model: e_faa_mysql
#    field: flights.number_of_engines
  elements:
  - name: Localized Look
    title: Localizedlook
    model: e_faa_mysql
    explore: flights
    type: table
    fields:
    - flights.air_carrier
    - flights.number_of_engines
    - flights.count
    pivots:
    - flights.number_of_engines
    filters:
      flights.count: NOT NULL
      flights.air_carrier: "{{ _localization['continental-en'] }}"
    sorts:
    - flights.count desc 0
    - flights.number_of_engines
    limit: 5
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - name: Domestic or International Flights
    title: FilteredTile
    model: e_faa_mysql
    explore: flights
    type: table
    fields: [flights.id, flights.air_carrier, flights.country, flights.from_US]
    filters:
      flights.id: '289,400,493,936'
      flights.from_US: "{{ _localization['domestic'] }}"
  #    flights.country: "{{ _user_attributes['timezone'] }}" <!--Just a test to make sure the _user_attributes drop works at the dashboard element level.-->
    sorts: [flights.id]
    limit: 5
    query_timezone: America/Los_Angeles
    series_types: {}
