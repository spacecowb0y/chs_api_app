class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :tracking_number, :temperature, :humidity, :battery_charge
  belongs_to :thermostat
end
