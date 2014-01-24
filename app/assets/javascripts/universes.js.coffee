ready = ->

  console.log ('test')

  # $('.kingdoms').children().find('li').hide()
  $('.kingdoms li').first().hide()


  $ ->
    $('.parent-click').click ->
      childLi = $(this).next('li')
      childLi.slideToggle("fast")

  # $ ->
  #   $('.cities').click ->
  #     childLi = $(this).children().find('li')
  #     childLi.slideToggle("fast")

$(document).ready(ready)
$(document).on('page:load', ready)
