# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	#$("#items").tokenInput("/items.json", {"theme": "facebook"})

	#$("#new_order").bind 'keypress', (e) ->
	#	code = e.keycode || e.which
	#	if code == 13
	#		alert($("ul.token-input-list-facebook").children().last().children().first().val())
	#		$("#items").tokenInput("add", $("ul.token-input-list-facebook").children().last().children().first().val())
	#		return false

	$("form#new_order").bind 'keyup', (e) ->
		code = e.keycode || e.which
		items = $("#items").val().split(',')
		q = items[items.length - 1].trim();
		console.log $("#items").val()
		if q.length > 0
			$.ajax({
				type: "GET",
				url: "/items.json",
				data:  "q=" + q,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: (m) ->
					$("ul#suggestions").html('')
					$(m).each (key, value) ->
						$("ul#suggestions").append('<li>' + value.name + '</li>')
				error: (m) ->
			});
			$("ul#recommendations").hide()
			$("ul#suggestions").show()
		else
			$("ul#recommendations").show()
			$("ul#suggestions").hide()

	$("#editable").focus()
	$("#editable").bind 'keyup', (e) ->
		code = e.keycode || e.which
		items = $("#items").val().split(',')
		q = items[items.length - 1].trim();
		console.log $("#items").val()
		if q.length > 0
			$.ajax({
				type: "GET",
				url: "/items.json",
				data:  "q=" + q,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: (m) ->
					$("ul#suggestions").html('')
					$(m).each (key, value) ->
						$("ul#suggestions").append('<li>' + value.name + '</li>')
				error: (m) ->
			});
			$("ul#recommendations").hide()
			$("ul#suggestions").show()
		else
			$("ul#recommendations").show()
			$("ul#suggestions").hide()
	$('.selectpicker').selectpicker();


