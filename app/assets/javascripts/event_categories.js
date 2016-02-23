// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
   $('#category_category_id').change(function () {
      value= $( "#category_category_id option:selected" ).val();

             url = '/event_categories/' + value + ".json";
       $('#category_category_id').fullCalendar('removeEvents');
       $('#category_category_id').fullCalendar('addEventSource', url);
       $('#category_category_id').fullCalendar('refetchEvents');
   })
});