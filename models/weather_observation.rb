class WeatherObservation
  attr_accessor :temp, :relative_humidity, :dew_point, :local_pressure, :absolute_pressure, :rain_sum, :datetime
  def initialize
    @temp = nil
    @relative_humidity = nil
    @dew_point = nil
    @local_pressure = nil
    @absolute_pressure = nil
    @rain_sum = nil
    @datetime = nil
  end

  def parse_dbf_record(record)
    @temp = record['CHN1_DEG']
    @relative_humidity = record['CHN1_RF']
    @dew_point = record['CHN1_DEW']
    @local_pressure = record['PRES_LOC']
    @absolute_pressure = record['PRES_ABS']
    @rain_sum = record['RAIN_SUM']
    @datetime = record['DATE_TIME']
  end
end