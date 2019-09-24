class StatsController < ApplicationController
  before_action :set_thermostat, only: [:show]

  # GET /readings
  def index
    @readings = Reading.limit(100)
    render json: @readings
  end


  def show
    if @thermostat && @thermostat.readings.any?
      @stats = {
        thermostat_id: @thermostat.id,
        household_token: @thermostat.household_token,
        location: @thermostat.location,
        temperature: {
          min: @thermostat.readings.minimum(:temperature).round(2),
          max: @thermostat.readings.maximum(:temperature).round(2),
          avg: @thermostat.readings.average(:temperature).round(2)
        },
        humidity: {
          min: @thermostat.readings.minimum(:humidity).round(2),
          max: @thermostat.readings.maximum(:humidity).round(2),
          avg: @thermostat.readings.average(:humidity).round(2)
        },
        battery_charge: {
          min: @thermostat.readings.minimum(:battery_charge).round(2),
          max: @thermostat.readings.maximum(:battery_charge).round(2),
          avg: @thermostat.readings.average(:battery_charge).round(2)
        }
      }
      render json: @stats
    else
      render json: @thermostat.errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thermostat
      @thermostat = Thermostat.find(params[:id])
    end
end
