# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
show_trail_buttons = ->
  $('#get_updates_button').show()
  $('#add_trail_button').show()
  $('#show_trail_button').show()

hide_trail_buttons = ->
  $('#get_updates_button').hide()
  $('#add_trail_button').hide()
  $('#show_trail_button').hide()

set_trail_html = (trails) ->
  activity = $('#activity_id :selected').text()
  state = $('#state_id :selected').text()
  if activity == 'Select an activity' || state == 'Select a state'
  else
    options = $(trails).filter("optgroup[label='#{state},#{activity}']").html()
  if options 
    $('#trail_id').html(options)
    $('#trail_id').show()
    show_trail_buttons()
    $('#trail_selection_message').hide()
  else
    $('#trail_id').hide()
    hide_trail_buttons()
    $('#trail_selection_message').show()	

page_load = ->	
  trails = $('#trail_id').html()
  $('#trail_id').hide()
  hide_trail_buttons()
  $('#trail_selection_message').hide()

  $('#state_id').change ->
    set_trail_html(trails)

  $('#activity_id').change ->
    set_trail_html(trails)

  $('#get_updates_button').click (event) ->
    event.preventDefault()
    trail_id = $('#trail_id :selected').val()
    orighref = $('#get_updates_button').data('request-path')
    $.ajax
      url: orighref
      type: 'GET'
      dataType: "script"
      data: trail_id: trail_id    

  $('#show_trail_button').click (event) ->
    event.preventDefault()
    trail_id = $('#trail_id :selected').val()
    new_url = ['/common/trails', trail_id].join('/')
    location.replace new_url
       
$(document).ready ->
  page_load()

$(document).on "page:change", ->
  page_load()


