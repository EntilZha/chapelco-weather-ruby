require 'sinatra'
require './models/weather_observation'
require 'dbf'

widgets = DBF::Table.new('SinusOrg.dbf')

get '/' do
  weather_record = WeatherObservation.new
  weather_record.parse_dbf_record(widgets.find(widgets.record_count - 1).attributes)
  erb :index, :locals => { record: weather_record }
end