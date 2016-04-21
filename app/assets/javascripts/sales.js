// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery ->
	event_groups = $('#sale_event_group_id').html()
	$('#sale_service_id').change ->
		service = $('#sale_service_id :selected').text()
		options = $(event_groups).filter("optgroup[label='#{service}']").html()
		if options
			$('#sale_event_group_id').html(options)
		else
			$('#sale_event_group_id').empty()
