$(document).ready ->

  $('#calendar_filter').fullCalendar
    editable: false,
    defaultView: 'month',
    height: 500
    events: 'event_categories/0.json'
    eventTextColor: 'black'

    eventClick: (event) ->
      link = event.url
      window.open(link.slice(0,-5),"_self")
      return false

updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event:
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description


