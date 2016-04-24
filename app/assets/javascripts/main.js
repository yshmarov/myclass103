$(document).ready(function(){
    if ($('.selectize')){
        $('.selectize').selectize({
            sortField: 'text'
        });
    }


    $('form').on('cocoon:after-insert', function(e, addedItem) {
      $(addedItem).find('.selectize').selectize({
        sortField: 'text'
      })
    });



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
    new Morris.Bar({
      element: 'attendances_chart',
      data: $('#attendances_chart').data('events'),
      xkey: 'starts_at',
      ykeys: ['id'],
      labels: ['Events this day']
    });
    new Morris.Donut({
      element: 'attendances_pie',
      data: $('#attendances_pie').data('attendances'),
      ykeys: ['attendance_rate'],
      labels: ['Series A']
    });
    new Morris.Donut({
      element: 'donut-example',
      data: [
        {label: "Download enrollments", value: 12},
        {label: "In-Store enrollments", value: 30},
        {label: "Mail-Order enrollments", value: 20}
      ]
    });
});