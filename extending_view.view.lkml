include: "flights.view"
view: extending_view {
#   extension: required
  extends: [flights]


  measure: average_extends {
    type: average
    drill_fields: [id, airport_name]
  }

  }
