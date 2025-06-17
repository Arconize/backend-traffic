class Api::V1::ZonesController < ApplicationController
  before_action :set_zone, only: %i[show update destroy traffic_patterns]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /api/v1/zones
  def index
    @zones = ::Zone.includes(:zone_type).all
    render json: @zones, include: :zone_type, status: :ok
  end

  # GET /api/v1/zones/:id
  def show
    render json: @zone, include: :zone_type, status: :ok
  end

  # GET /api/v1/zones/:id/traffic_patterns
  def traffic_patterns
    render json: {
      patterns: "Traffic patterns for zone #{@zone.id}",
      peak_hours: ["08:00-10:00", "17:00-19:00"]
    }, status: :ok
  end

  # GET /api/v1/zones/search
  def search
    zones = ::Zone.all

    # Apply filters by the date fields if present.
    filters = params.slice(:created_at, :updated_at, :deleted_at)
    filters.each do |key, value|
      next if value.blank?
      zones = zones.where(key => value)
    end

    # Filter by land_name from the associated zone_type table.
    if params[:land_name].present?
      zones = zones.joins(:zone_type)
                   .where("zone_types.land_name LIKE ?", "%#{params[:land_name]}%")
    end

    render json: zones, status: :ok
  end

  # POST /api/v1/zones
  def create
    @zone = ::Zone.new(zone_params)

    if @zone.save
      render json: @zone, status: :created
    else
      render json: { errors: @zone.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/zones/:id
  def update
    if @zone.update(zone_params)
      render json: @zone, status: :ok
    else
      render json: { errors: @zone.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/zones/:id
  def destroy
    @zone.destroy
    head :no_content
  end

  private

  def set_zone
    @zone = ::Zone.find(params[:id])
  end

  def search
    filters = params.slice(:name, :zone_type, :description)
    zones = ::Zone.all

    filters.each do |key, value|
      next if value.blank?
      zones = zones.where("#{key} LIKE ?", "%#{value}%")
    end

    render json: zones, status: :ok
  end
  def zone_params
    params.require(:zone).permit(
      :zone_type_id,
      :upgraded_at,
      :deleted_at
    )
  end

  def not_found
    render json: { error: "Zone not found" }, status: :not_found
  end
end