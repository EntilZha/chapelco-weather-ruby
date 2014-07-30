require 'sinatra'
require './models/weather_observation'
require 'json'

get '/' do
  dbf_table = WeatherObservation.fetch_dbf_table
  current_weather = WeatherObservation.parse_dbf_record(dbf_table[-1])
  past_weather = WeatherObservation.dbf_fields_to_lists(dbf_table, n=144, time_format='%m/%d %k:%M')
  avg_precip = past_weather[:rain_sums][-1] - past_weather[:rain_sums][-7]
  erb :index, :locals => { record: current_weather, past_weather: JSON.generate(past_weather), avg_precip: avg_precip }
end