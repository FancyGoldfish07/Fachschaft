// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
  $(document).ready(function() {
    // page is now ready, initialize the calendar...
    $('#category_category_id').change(function(){
        if( $("#category_category_id :selected").val()<1){
            $('#calendar_filter').fullCalendar('removeEvents');
            $('#calendar_filter').fullCalendar('addEventSource', '/events.json');
        }else {
            $('#calendar_filter').fullCalendar('removeEvents');
            $('#calendar_filter').fullCalendar('addEventSource', '/event_categories/' + $("#category_category_id :selected").val() + '.json');
        }

    });
  });
