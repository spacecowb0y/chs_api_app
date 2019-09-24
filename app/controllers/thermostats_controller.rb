class ThermostatsController < ApplicationController
  before_action :set_thermostat, only: [:show]
  skip_before_action :authenticate, only: [:create]

  # GET /thermostats
  def index
    @thermostats = Thermostat.limit(10)
    render json: @thermostats
  end

  # GET /thermostats/1
  def show
    render json: @thermostat
  end

  # POST /thermostats
  def create
    @thermostat = Thermostat.new(thermostat_params)

    if @thermostat.save
      render json: @thermostat, status: :created, location: @thermostat
    else
      render json: @thermostat.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thermostat
      @thermostat = Thermostat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def thermostat_params
      params.require(:thermostat).permit(:location)
    end
end
