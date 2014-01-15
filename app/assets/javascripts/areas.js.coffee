ready = ->

  $("#area_type_block").hide()
  $("#area_belongs_to_kingdom").hide()
  $("#area_belongs_to_city").hide()

  ($ 'select#area_universe_id').change ->
    role = ($ 'select#area_universe_id :selected').text()
    if role isnt "Please select"
      $("#area_type_block").slideToggle "fast"

  ($ 'select#area_type').change ->
    type = ($ 'select#area_type :selected').text()
    if type is "Place"
      $("#area_belongs_to_kingdom").hide()
      $("#area_belongs_to_city").slideToggle "fast"
    if type is "City"
      $("#area_belongs_to_city").hide()
      $("#area_belongs_to_kingdom").slideToggle "fast"

$(document).ready(ready)
$(document).on('page:load', ready)

