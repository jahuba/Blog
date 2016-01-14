# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success", "form#comments-form", (ev,data)->
	console.log data
	$(this).find("textarea").val("")
	$("#comments-box").append("<li>#{data.body} - #{}</li>")

# esto es lo equivalente a
# $(document).on("ajax:success", "form#comments-form", function(ev,data){
#	console.log(data);
# });


# para hacer debug a los erroes
$(document).on "ajax:error", "form#comments-form", (ev,data)->
	console.log data