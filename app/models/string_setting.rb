class StringSetting < ApplicationSetting

  def typecast_value
    self.value
  end
end