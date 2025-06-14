class Api::V1::ZoneTypesController < ApplicationController
  before_action :set_api_v1_zone_type, only: %i[ show edit update destroy ]

  # GET /api/v1/zone_types or /api/v1/zone_types.json
  def index
    @api_v1_zone_types = Api::V1::ZoneType.all
  end

  # GET /api/v1/zone_types/1 or /api/v1/zone_types/1.json
  def show
  end

  # GET /api/v1/zone_types/new
  def new
    @api_v1_zone_type = Api::V1::ZoneType.new
  end

  # GET /api/v1/zone_types/1/edit
  def edit
  end

  # POST /api/v1/zone_types or /api/v1/zone_types.json
  def create
    @api_v1_zone_type = Api::V1::ZoneType.new(api_v1_zone_type_params)

    respond_to do |format|
      if @api_v1_zone_type.save
        format.html { redirect_to @api_v1_zone_type, notice: "Zone type was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_zone_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_zone_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/zone_types/1 or /api/v1/zone_types/1.json
  def update
    respond_to do |format|
      if @api_v1_zone_type.update(api_v1_zone_type_params)
        format.html { redirect_to @api_v1_zone_type, notice: "Zone type was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_zone_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_zone_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/zone_types/1 or /api/v1/zone_types/1.json
  def destroy
    @api_v1_zone_type.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_zone_types_path, status: :see_other, notice: "Zone type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_zone_type
      @api_v1_zone_type = Api::V1::ZoneType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def api_v1_zone_type_params
      params.fetch(:api_v1_zone_type, {})
    end
end
