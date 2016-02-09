$(document).ready(function(){
    if ($('.selectize')){
        $('.selectize').selectize({
            sortField: 'text'
        });
    }

    $('#calendar').fullCalendar({
        lang: 'en',
        minTime: "09:00:00",
        maxTime: "20:00:00",
        defaultView: 'agendaWeek',
        firstDay: 1,
        allDaySlot: false,
        height: 510,
        slotMinutes: 30,
        events: app.vars.events,
        header: {
            center: 'month,basicWeek,basicDay,agendaWeek,agendaDay,timelineDay,agendaFourDay'
        }
    });
    new Morris.Line({
      element: 'attendances_chart',
      data: $('#attendances_chart').data('attendances'),
      xkey: 'created_at',
      ykeys: ['id'],
      labels: ['Series A']
    });
});