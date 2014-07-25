require 'sinatra'
require './models/weather_observation'
require 'dbf'
require 'json'
require 'open-uri'

get '/' do
  weather_db = open('https://docs.google.com/uc?id=0B06ZoNF0o91ncXRPdVRuZjBDaE0&export=download')
  widgets = DBF::Table.new(weather_db).to_a
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