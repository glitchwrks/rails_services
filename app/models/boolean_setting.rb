class BooleanSetting < ApplicationSetting

  validates :value, :inclusion => { :in => ['true', 'false'], :message => 'Value must be true or false' }

  def typecast_value
    self.value.to_s.downcase == 'true'
  end
end