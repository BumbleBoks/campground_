# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# this loads the calendar and sets the date for log
logs_load = ->
  userDate = null;
  patharray = window.location.pathname.split("/")
  length = patharray.length

  if patharray[length - 1] != "new"
    if length > 5
      userDate = new Date()
      userDate.setFullYear(patharray[3])
      userDate.setMonth(patharray[4]-1)
      userDate.setDate(patharray[5])
  
  $("#corner_log_log_date").bind 'date_change', (event) ->
    selectedDate = datePicker.selectedDate
    year = selectedDate.getFullYear()
    month = selectedDate.getMonth() + 1
    day = selectedDate.getDate()
    new_url = ['/corner/logs', year, month, day].join('/')
    location.replace new_url

  if !datePicker
    datePicker = new DatePicker
    datePicker.initialize($("#date_picker"), $("#corner_log_log_date"), userDate)

# this updates tags for the log
update_log_tags = ->
  $("#add_log_tag").click (event) ->
    event.preventDefault()
    new_tag = $("#corner_log_tags_name").val().trim(" ", "\t", "\n")
    $("#corner_log_tags_name").val("")
    tag_names = $("li input")
    dup_tag_name = false
    dup_tag_name = true for tag in tag_names when $(tag).val() is new_tag

    if dup_tag_name == true
      popup = new MessagePopup($("body"))
      popup.show("This tag has already been added")
    else
      input_string = "<input id=\"corner_log_tag_names_\" type=\"hidden\" value=#{new_tag}  
        name=\"corner_log[tag_names][]\">"
      link_string = ' <a id="delete_log_tag" class="log_tag_button" href="#">x</a>'
      append_string = input_string + new_tag + link_string
      $("#log_tags ul").append("<li></li>")
      $("#log_tags li").last().append(append_string)

  $('#log_tags ul').on 'click', $("a#delete_log_tag"), (event) ->
    $(event.target).closest('li').remove()



$(document).on "page:load", ->
  logs_load()

$(document).ready ->
  logs_load()
  update_log_tags()

$(document).on "page:change", ->
  update_log_tags()
      
