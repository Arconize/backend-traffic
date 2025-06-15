class Api::V1::RoadTypesController < ApplicationController
  before_action :set_road_type, only: %i[show update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/road_types
  def index
    @road_types = ::RoadType.all
    render json: @road_types, status: :ok
  end

  # GET /api/v1/road_types/:id
  def show
    render json: @road_type, status: :ok
  end

  # POST /api/v1/road_types
  def create
    @road_type = ::RoadType.new(road_type_params)

    if @road_type.save
      render json: @road_type, status: :created
    else
      render json: { errors: @road_type.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/road_types/:id
  def update
    if @road_type.update(road_type_params)
      render json: @road_type, status: :ok
    else
      render json: { errors: @road_type.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/road_types/:id
  def destroy
    @road_type.destroy
    head :no_content
  end

  private

  def set_road_type
    @road_type = ::RoadType.find(params[:id])
  end

  def road_type_params
    params.require(:road_type).permit(
      :def_max_speed,
      :def_min_speed,
      :width_def,
      :line_count_def,
      :is_one_way_def,
      :description
    )
  end

  def not_found
    render json: { error: "Road type not found" }, status: :not_found
  end
end