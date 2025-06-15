class Api::V1::RoadsController < ApplicationController
  before_action :set_road, only: %i[show update destroy traffic_data average_speed]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/roads
  def index
    @roads = ::Road.all
    render json: @roads, status: :ok
  end

  # GET /api/v1/roads/:id
  def show
    render json: @road, status: :ok
  end

  # GET /api/v1/roads/:id/traffic_data
  def traffic_data
    # منطق دریافت داده ترافیکی اینجا پیاده‌سازی می‌شود
    render json: { traffic_data: "Sample data for road #{@road.id}" }, status: :ok
  end

  # GET /api/v1/roads/:id/average_speed
  def average_speed
    # منطق محاسبه میانگین سرعت اینجا پیاده‌سازی می‌شود
    render json: { average_speed: "50 km/h" }, status: :ok
  end

  # POST /api/v1/roads
  def create
    @road = ::Road.new(road_params)

    if @road.save
      render json: @road, status: :created
    else
      render json: { errors: @road.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/roads/:id
  def update
    if @road.update(road_params)
      render json: @road, status: :ok
    else
      render json: { errors: @road.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/roads/:id
  def destroy
    @road.destroy
    head :no_content
  end

  private

  def set_road
    @road = ::Road.find(params[:id])
  end

  def road_params
    params.require(:road).permit(
      :road_type_id,
      :zone_id,
      :upgraded_at,
      :deleted_at
    )
  end

  def not_found
    render json: { error: "Road not found" }, status: :not_found
  end
end