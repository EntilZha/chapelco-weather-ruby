require 'open-uri'
require 'dbf'

class WeatherObservation
  attr_accessor :temp, :relative_humidity, :dew_point, :local_pressure, :absolute_pressure, :rain_sum, :datetime
  attr_writer :datetime

  DBF_URL = 'https://docs.google.com/uc?id=0B06ZoNF0o91ncXRPdVRuZjBDaE0&export=download'
  def initialize
    @temp = nil
    @relative_humidity = nil
    @dew_point = nil
    @local_pressure = nil
    @absolute_pressure = nil
    @rain_sum = nil
    @datetime = nil
  end

  def self.fetch_dbf_table
    weather_db = open(DBF_URL)
    return DBF::Table.new(weather_db).to_a
  end

  def self.parse_dbf_record(record, time_format=nil)
    record = record.attributes
    observation = WeatherObservation.new
    observation.temp = record['CHN1_DEG']
    observation.relative_humidity = record['CHN1_RF']
    observation.dew_point = record['CHN1_DEW']
    observation.local_pressure = record['PRES_LOC']
    observation.absolute_pressure = record['PRES_ABS']
    observation.rain_sum = record['RAIN_SUM']
    unformatted_time = WeatherObservation.convert_time(record['DATE_TIME'])
    formatted_time = time_format.nil? ? unformatted_time : unformatted_time.strftime(time_format)
    observation.datetime = formatted_time
    return observation
  end
  def self.convert_time(t)
    Time.at((t - 25569) * 86400).utc
  end
  def to_hash
    observation = {}
    observation[:temp] = @temp
    observation[:relative_humidity] = @relative_humidity
    observation[:dew_point] = @dew_point
    observation[:local_pressure] = @local_pressure
    observation[:absolute_pressure] = @absolute_pressure
    observation[:rain_sum] = @rain_sum
    observation[:datetime] = @datetime
    return observation
  end
  def self.dbf_fields_to_lists(dbf, n, time_format=nil)
    fields = {
        temps: [],
        relative_humidities: [],
        dew_points: [],
        local_pressures: [],
        absolute_pressures: [],
        rain_sums: [],
        datetimes: []
    }
    initial_rain_sum = WeatherObservation.parse_dbf_record(dbf[0]).rain_sum
    dbf[-(n + 1)...-1].each do |e|
      record = WeatherObservation.parse_dbf_record(e)
      fields[:temps] << record.temp
      fields[:relative_humidities] << record.relative_humidity
      fields[:dew_points] << record.dew_point
      fields[:local_pressures] << record.local_pressure
      fields[:absolute_pressures] << record.absolute_pressure
      fields[:rain_sums] << record.rain_sum - initial_rain_sum
      formatted_time = time_format.nil? ? record.datetime : record.datetime.strftime(time_format)
      fields[:datetimes] << formatted_time
    end
    return fields
  end
end