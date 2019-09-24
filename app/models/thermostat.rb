class Thermostat < ApplicationRecord
  has_many :readings
  
  before_create do |thermostat|
    thermostat.household_token = thermostat.generate_household_token
  end
  
  def generate_household_token
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless Thermostat.exists?(household_token: token)
    end
  end
end
