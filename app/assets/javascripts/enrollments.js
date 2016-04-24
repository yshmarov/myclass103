// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery ->
	event_groups = $('#enrollment_event_group_id').html()
	$('#enrollment_service_id').change ->
		service = $('#enrollment_service_id :selected').text()
		options = $(event_groups).filter("optgroup[label='#{service}']").html()
		if options
			$('#enrollment_event_group_id').html(options)
		else
			$('#enrollment_event_group_id').empty()
