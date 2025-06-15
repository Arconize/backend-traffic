class Api::V1::VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/vehicles
  def index
    @vehicles = ::Vehicle.all
    render json: @vehicles, status: :ok
  end

  # GET /api/v1/vehicles/:id
  def show
    render json: @vehicle, status: :ok
  end

  # POST /api/v1/vehicles
  def create
    @vehicle = ::Vehicle.new(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created
    else
      render json: { errors: @vehicle.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/vehicles/:id
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle, status: :ok
    else
      render json: { errors: @vehicle.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/vehicles/:id
  def destroy
    @vehicle.destroy
    head :no_content
  end

  # GET /api/v1/vehicles/by_plate/:plate
  def by_plate
    @vehicle = ::Vehicle.find_by!(veh_plate: params[:plate])
    render json: @vehicle, status: :ok
  rescue ActiveRecord::RecordNotFound
    not_found
  end

  # GET /api/v1/vehicles/search
  #
  # Available search parameters:
  # - veh_plate
  # - veh_color
  # - veh_type
  # - veh_fuel_type
  # - veh_pollution_lvl
  # - veh_create_date
  #
  # String fields perform a case-insensitive partial match,
  # while the create date is matched exactly.
  def search
    allowed_filters = params.slice(:veh_plate, :veh_color, :veh_type, :veh_fuel_type, :veh_pollution_lvl, :veh_create_date , :veh_update_date)
    vehicles = ::Vehicle.all

    allowed_filters.each do |key, value|
      next if value.blank?

      # For create dates we assume an exact match
      if key == "veh_create_date"
        vehicles = vehicles.where(veh_create_date: value)
      elsif key == "veh_update_date"
        vehicles = vehicles.where(veh_update_date: value)
      else
        vehicles = vehicles.where("#{key} LIKE ?", "%#{value}%")
      end
    end

    render json: vehicles, status: :ok
  end

  private

  def set_vehicle
    @vehicle = ::Vehicle.find_by!(veh_plate: params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(
      :veh_plate,
      :veh_type,
      :veh_color,
      :veh_create_date,
      :veh_pollution_lvl,
      :veh_fuel_type
    )
  end

  def not_found
    render json: { error: "Vehicle not found" }, status: :not_found
  end
end