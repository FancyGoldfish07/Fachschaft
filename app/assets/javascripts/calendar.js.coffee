$(document).ready ->
  $('#calendar').fullCalendar
    editable: false,
    theme: false,
    height: 900,

    header:
      left: 'prev,next today myCustomButton',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    defaultView: 'month',
    height: 500,
    slotMinutes: 30,


    eventSources: [{
      json: '/events',
    }],

    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

    events: '/events.json'

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);

  $('#calendar_prev').fullCalendar
    editable: false,
    defaultView: 'agendaWeek',
    height: 500
    events: '/events.json'

  $('#calendar_filter').fullCalendar
    editable: false,
    defaultView: 'month',
    height: 500
    events: '/events.json'

  $('#category_category_id').change =>
    selectedValue = $(this).text
    $('#calendar_filter').fullCalendar

    events:'/event_categories/'+selectedValue+'.json'

  $('#calendar_editable').fullCalendar
    editable: true,
    theme: false,
    height: 700,

    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    defaultView: 'month',
    height: 500,
    slotMinutes: 30,


    eventSources: [{
      json: '/events',
    }],

    timeFormat: 'h:mm t{ - h:mm t} ',
    dragOpacity: "0.5"

    events: '/events.json'

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);


updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event:
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description


