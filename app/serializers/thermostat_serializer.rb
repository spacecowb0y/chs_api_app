class ThermostatSerializer < ActiveModel::Serializer
  attributes :id, :household_token, :location
  has_many :readings
end
