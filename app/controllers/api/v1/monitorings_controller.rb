class Api::V1::MonitoringsController < ApplicationController
  before_action :set_monitoring, only: %i[show update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/monitorings
  def index
    @monitorings = ::Monitoring.all
    render json: @monitorings, status: :ok
  end

  # GET /api/v1/monitorings/recent
  def recent
    @monitorings = ::Monitoring.where('time >= ?', 1.week.ago)
    render json: @monitorings, status: :ok
  end

  # GET /api/v1/monitorings/by_vehicle/:vehicle_plate
  def by_vehicle
    @monitorings = ::Monitoring.where(veh_plate: params[:vehicle_plate])
    render json: @monitorings, status: :ok
  end

  # GET /api/v1/monitorings/by_camera/:camera_id
  def by_camera
    @monitorings = ::Monitoring.where(camera_id: params[:camera_id])
    render json: @monitorings, status: :ok
  end

  # GET /api/v1/monitorings/by_date/:date
  def by_date
    date = Date.parse(params[:date]) rescue nil
    if date
      @monitorings = ::Monitoring.where(time: date.beginning_of_day..date.end_of_day)
      render json: @monitorings, status: :ok
    else
      render json: { error: "Invalid date format" }, status: :bad_request
    end
  end

  # GET /api/v1/monitorings/:id
  def show
    render json: @monitoring, status: :ok
  end

  # POST /api/v1/monitorings
  def create
    @monitoring = ::Monitoring.new(monitoring_params)

    if @monitoring.save
      render json: @monitoring, status: :created
    else
      render json: { errors: @monitoring.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/monitorings/:id
  def update
    if @monitoring.update(monitoring_params)
      render json: @monitoring, status: :ok
    else
      render json: { errors: @monitoring.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/monitorings/:id
  def destroy
    @monitoring.destroy
    head :no_content
  end

  private

  def set_monitoring
    @monitoring = ::Monitoring.find_by!(
      camera_id: params[:camera_id],
      veh_plate: params[:veh_plate],
      time: params[:time]
    )
  end

  def monitoring_params
    params.require(:monitoring).permit(
      :camera_id,
      :veh_plate,
      :time,
      :line
    )
  end

  def not_found
    render json: { error: "Monitoring record not found" }, status: :not_found
  end
end