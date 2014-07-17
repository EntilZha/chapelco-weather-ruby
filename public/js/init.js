$(document).ready(function() {
    $('#temp-plot').highcharts({
        title: {
            text: "Past Temperatures",
            x: -20
        },
        xAxis: {
            title: {
                text: 'Time'
            },
            categories: data['times']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [
            {
                data: data['temps'],
                name: 'Temperature (°C)'
            }
        ]
    });
    $('#temp-card').click(function() {
        $('#temp-modal').modal('show');
    });
});