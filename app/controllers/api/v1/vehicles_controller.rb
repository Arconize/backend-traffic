class Api::V1::VehiclesController < ApplicationController
  before_action :set_api_v1_vehicle, only: %i[ show edit update destroy ]

  # GET /api/v1/vehicles or /api/v1/vehicles.json
  def index
    @api_v1_vehicles = Api::V1::Vehicle.all
  end

  # GET /api/v1/vehicles/1 or /api/v1/vehicles/1.json
  def show
  end

  # GET /api/v1/vehicles/new
  def new
    @api_v1_vehicle = Api::V1::Vehicle.new
  end

  # GET /api/v1/vehicles/1/edit
  def edit
  end

  # POST /api/v1/vehicles or /api/v1/vehicles.json
  def create
    @api_v1_vehicle = Api::V1::Vehicle.new(api_v1_vehicle_params)

    respond_to do |format|
      if @api_v1_vehicle.save
        format.html { redirect_to @api_v1_vehicle, notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/vehicles/1 or /api/v1/vehicles/1.json
  def update
    respond_to do |format|
      if @api_v1_vehicle.update(api_v1_vehicle_params)
        format.html { redirect_to @api_v1_vehicle, notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/vehicles/1 or /api/v1/vehicles/1.json
  def destroy
    @api_v1_vehicle.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_vehicles_path, status: :see_other, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_vehicle
      @api_v1_vehicle = Api::V1::Vehicle.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def api_v1_vehicle_params
      params.fetch(:api_v1_vehicle, {})
    end
end
