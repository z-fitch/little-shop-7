class Holiday 
  attr_reader :holiday_1,
              :holiday_2,
              :holiday_3
              
  def initialize(data)
    @holiday_1 = data[0][:localName]
    @holiday_2 = data[1][:localName]
    @holiday_3 = data[2][:localName]
  end
end