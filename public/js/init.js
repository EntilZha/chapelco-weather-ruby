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
            categories: data['datetimes'],
            labels: {
                rotation: 45,
                step: 6
            }
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
    $('#dew-plot').highcharts({
        title: {
            text: "Past Dew Points",
            x: -20
        },
        xAxis: {
            title: {
                text: 'Time'
            },
            categories: data['datetimes'],
            labels: {
                rotation: 45,
                step: 6
            }
        },
        yAxis: {
            title: {
                text: 'Dew Point (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [
            {
                data: data['dew_points'],
                name: 'Dew points (°C)'
            }
        ]
    });
    $('#humidity-plot').highcharts({
        title: {
            text: "Past Relative Humidities",
            x: -20
        },
        xAxis: {
            title: {
                text: 'Time'
            },
            categories: data['datetimes'],
            labels: {
                rotation: 45,
                step: 6
            }
        },
        yAxis: {
            title: {
                text: 'Relative Humidity (%)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [
            {
                data: data['relative_humidities'],
                name: 'Relative Humidity (%)'
            }
        ]
    });
    $('#pressure-plot').highcharts({
        title: {
            text: "Past Local Pressure",
            x: -20
        },
        xAxis: {
            title: {
                text: 'Time'
            },
            categories: data['datetimes'],
            labels: {
                rotation: 45,
                step: 6
            }
        },
        yAxis: {
            title: {
                text: 'Local Pressure (hPa)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [
            {
                data: data['local_pressures'],
                name: 'Local Pressure (hPa)'
            }
        ]
    });
    $('#abspressure-plot').highcharts({
        title: {
            text: "Past Absolute Pressure",
            x: -20
        },
        xAxis: {
            title: {
                text: 'Time'
            },
            categories: data['datetimes'],
            labels: {
                rotation: 45,
                step: 6
            }
        },
        yAxis: {
            title: {
                text: 'Absolute Pressure (hPa)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        series: [
            {
                data: data['absolute_pressures'],
                name: 'Absolute Pressure (hPa)'
            }
        ]
    });
    $('#temp-card').click(function() {
        $('#temp-modal').modal('show');
    });
    $('#dew-card').click(function() {
        $('#dew-modal').modal('show');
    });
    $('#humidity-card').click(function() {
        $('#humidity-modal').modal('show');
    });
    $('#pressure-card').click(function() {
        $('#pressure-modal').modal('show');
    });
    $('#abspressure-card').click(function() {
        $('#abspressure-modal').modal('show');
    });
});