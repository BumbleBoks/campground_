# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

$(document).on "page:load", ->
  logs_load()

$(document).ready ->
  logs_load()
      
