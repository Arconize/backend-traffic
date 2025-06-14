class Api::V1::ZonesController < ApplicationController
  before_action :set_api_v1_zone, only: %i[ show edit update destroy ]

  # GET /api/v1/zones or /api/v1/zones.json
  def index
    @api_v1_zones = Api::V1::Zone.all
  end

  # GET /api/v1/zones/1 or /api/v1/zones/1.json
  def show
  end

  # GET /api/v1/zones/new
  def new
    @api_v1_zone = Api::V1::Zone.new
  end

  # GET /api/v1/zones/1/edit
  def edit
  end

  # POST /api/v1/zones or /api/v1/zones.json
  def create
    @api_v1_zone = Api::V1::Zone.new(api_v1_zone_params)

    respond_to do |format|
      if @api_v1_zone.save
        format.html { redirect_to @api_v1_zone, notice: "Zone was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_zone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/zones/1 or /api/v1/zones/1.json
  def update
    respond_to do |format|
      if @api_v1_zone.update(api_v1_zone_params)
        format.html { redirect_to @api_v1_zone, notice: "Zone was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_zone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/zones/1 or /api/v1/zones/1.json
  def destroy
    @api_v1_zone.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_zones_path, status: :see_other, notice: "Zone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_zone
      @api_v1_zone = Api::V1::Zone.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def api_v1_zone_params
      params.fetch(:api_v1_zone, {})
    end
end
