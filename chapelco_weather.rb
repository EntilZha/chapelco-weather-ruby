require 'sinatra'
require './models/weather_observation'
require 'dbf'
require 'json'

widgets = DBF::Table.new('SinusOrg.dbf').to_a

get '/' do
  weather_record = WeatherObservation.parse_dbf_record(widgets[-1].attributes)
  past_weather = {
      times: [],
      temps: []
  }
  widgets[-15...-1].each do |e|
    data = WeatherObservation.parse_dbf_record(e)
    past_weather[:times] << data.datetime.strftime('%m/%d %k:%M')
    past_weather[:temps] << data.temp
  end
  erb :index, :locals => { record: weather_record, past_weather: JSON.generate(past_weather) }
end