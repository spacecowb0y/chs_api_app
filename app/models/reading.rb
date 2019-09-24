class Reading < ApplicationRecord
  belongs_to :thermostat

  before_save do |reading|
    reading.tracking_number = reading.add_tracking_number
  end
  
  def add_tracking_number
    entries = Reading.where(thermostat_id: self.thermostat_id)
    tracking_number = entries.any? ? entries.last.tracking_number+1 : 1
  end
end
