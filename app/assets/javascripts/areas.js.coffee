ready = ->

  $("#area_type_block").hide()
  $("#area_belongs_to_block").hide()

  ($ 'select#area_universe_id').change ->
    role = ($ 'select#area_universe_id :selected').text()
    if role isnt "Please select"
      $("#area_type_block").slideToggle "fast"

$(document).ready(ready)
$(document).on('page:load', ready)

