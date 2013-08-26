# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$("form#new_user")
		.bind 'ajax:success', (evt, xhr, settings) -> 
			window.location = "/about"
		.bind 'ajax:error', (evt, xhr, settings) ->
			message = JSON.parse(xhr.responseText).message
			error_message = message.join ", "
			$("#signup_alert").html error_message
