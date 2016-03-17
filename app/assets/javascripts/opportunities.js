// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
jQuery ->
	event_groups = $('#opportunity_event_group_id').html()
	$('#opportunity_service_id').change ->
		service = $('#opportunity_service_id :selected').text()
		options = $(event_groups).filter("optgroup[label='#{service}']").html()
		if options
			$('#opportunity_event_group_id').html(options)
		else
			$('#opportunity_event_group_id').empty()
