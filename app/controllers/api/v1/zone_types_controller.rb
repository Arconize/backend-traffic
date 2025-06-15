class Api::V1::ZoneTypesController < ApplicationController
  before_action :set_zone_type, only: %i[show update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/zone_types
  def index
    @zone_types = ::ZoneType.all
    render json: @zone_types, status: :ok
  end

  # GET /api/v1/zone_types/:id
  def show
    render json: @zone_type, status: :ok
  end

  # POST /api/v1/zone_types
  def create
    @zone_type = ::ZoneType.new(zone_type_params)

    if @zone_type.save
      render json: @zone_type, status: :created
    else
      render json: { errors: @zone_type.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/zone_types/:id
  def update
    if @zone_type.update(zone_type_params)
      render json: @zone_type, status: :ok
    else
      render json: { errors: @zone_type.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/zone_types/:id
  def destroy
    @zone_type.destroy
    head :no_content
  end

  private

  def set_zone_type
    @zone_type = ::ZoneType.find(params[:id])
  end

  def zone_type_params
    params.require(:zone_type).permit(
      :land_name,
      :def_max_speed,
      :def_min_speed,
      :description
    )
  end

  def not_found
    render json: { error: "Zone type not found" }, status: :not_found
  end
end