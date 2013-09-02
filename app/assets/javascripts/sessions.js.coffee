# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$("form#new_session")
		.bind 'ajax:beforeSend', () ->
			$("#session_submit").attr("disabled", "disabled")
		.bind 'ajax:success', (evt, xhr, settings) -> 
			window.location = "/orders/new"
		.bind 'ajax:error', (evt, xhr, settings) ->
			message = JSON.parse(xhr.responseText).message
			$("#login_alert").html message
			$("#session_submit").removeAttr("disabled")
