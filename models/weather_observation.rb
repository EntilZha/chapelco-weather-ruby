class WeatherObservation
  attr_accessor :temp, :relative_humidity, :dew_point, :local_pressure, :absolute_pressure, :rain_sum, :datetime
  attr_writer :datetime
  def initialize
    @temp = nil
    @relative_humidity = nil
    @dew_point = nil
    @local_pressure = nil
    @absolute_pressure = nil
    @rain_sum = nil
    @datetime = nil
  end

  def self.parse_dbf_record(record)
    observation = WeatherObservation.new
    observation.temp = record['CHN1_DEG']
    observation.relative_humidity = record['CHN1_RF']
    observation.dew_point = record['CHN1_DEW']
    observation.local_pressure = record['PRES_LOC']
    observation.absolute_pressure = record['PRES_ABS']
    observation.rain_sum = record['RAIN_SUM']
    observation.datetime = WeatherObservation.convert_time(record['DATE_TIME'])
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
end