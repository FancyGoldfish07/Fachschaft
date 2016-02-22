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

    events: [
      {
        title  : 'event1',
        start  : '2016-02-01'
      },
      {
        title  : 'event2',
        start  : '2016-02-05',
        end    : '2016-02-07'
      },
      {
        title  : 'event3',
        start  : '2016-02-09T12:30:00',
        allDay : false
      }
    ]

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);

  $('#calendar_prev').fullCalendar
    defaultView: 'agendaWeek',
    height: 500,


updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event:
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description


