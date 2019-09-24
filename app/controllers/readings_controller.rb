class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show]

  # GET /readings
  def index
    @readings = Reading.limit(10)
    render json: @readings
  end

  # GET /readings/1
  def show
    render json: @reading
  end

  # POST /readings
  def create
    @reading = Reading.new(reading_params)
    LogEntryJob.perform_now @reading

    if @reading.valid?
      render json: @reading, status: :created, location: @reading
    else
      render json: @reading.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.where(thermostat_id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_params
      params.require(:reading).permit(:thermostat_id, :tracking_number, :temperature, :humidity, :battery_charge)
    end
end
