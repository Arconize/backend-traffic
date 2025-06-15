class Api::V1::CamerasController < ApplicationController
  before_action :set_camera, only: %i[show update destroy toggle_status calibrate]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/cameras
  def index
    @cameras = ::Camera.all
    render json: @cameras, status: :ok
  end

  # GET /api/v1/cameras/active
  def active
    @cameras = ::Camera.where(status: 'active')
    render json: @cameras, status: :ok
  end

  # GET /api/v1/cameras/:id
  def show
    render json: @camera, status: :ok
  end

  # POST /api/v1/cameras
  def create
    @camera = ::Camera.new(camera_params)

    if @camera.save
      render json: @camera, status: :created
    else
      render json: { errors: @camera.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/cameras/:id
  def update
    if @camera.update(camera_params)
      render json: @camera, status: :ok
    else
      render json: { errors: @camera.errors }, status: :unprocessable_entity
    end
  end

  # PATCH /api/v1/cameras/:id/toggle_status
  def toggle_status
    new_status = @camera.active? ? 'inactive' : 'active'
    if @camera.update(status: new_status)
      render json: @camera, status: :ok
    else
      render json: { errors: @camera.errors }, status: :unprocessable_entity
    end
  end

  # POST /api/v1/cameras/:id/calibrate
  def calibrate
    # منطق کالیبراسیون اینجا پیاده‌سازی می‌شود
    render json: { message: "Calibration started for camera #{@camera.id}" }, status: :accepted
  end

  # DELETE /api/v1/cameras/:id
  def destroy
    @camera.destroy
    head :no_content
  end

  private

  def set_camera
    @camera = ::Camera.find(params[:id])
  end

  def search
    filters = params.slice(:camera_id, :status, :x_position , :y_position , :angle)
    cameras = ::Camera.all

    filters.each do |key, value|
      next if value.blank?
      cameras = cameras.where("#{key} LIKE ?", "%#{value}%")
    end

    render json: cameras, status: :ok
  end
  def camera_params
    params.require(:camera).permit(
      :range,
      :road_id,
      :status,
      :camera_type,
      :x_position,
      :y_position,
      :angle
    )
  end

  def not_found
    render json: { error: "Camera not found" }, status: :not_found
  end
end