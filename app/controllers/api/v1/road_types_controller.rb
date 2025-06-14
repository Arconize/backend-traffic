class Api::V1::RoadTypesController < ApplicationController
  before_action :set_api_v1_road_type, only: %i[ show edit update destroy ]

  # GET /api/v1/road_types or /api/v1/road_types.json
  def index
    @api_v1_road_types = Api::V1::RoadType.all
  end

  # GET /api/v1/road_types/1 or /api/v1/road_types/1.json
  def show
  end

  # GET /api/v1/road_types/new
  def new
    @api_v1_road_type = Api::V1::RoadType.new
  end

  # GET /api/v1/road_types/1/edit
  def edit
  end

  # POST /api/v1/road_types or /api/v1/road_types.json
  def create
    @api_v1_road_type = Api::V1::RoadType.new(api_v1_road_type_params)

    respond_to do |format|
      if @api_v1_road_type.save
        format.html { redirect_to @api_v1_road_type, notice: "Road type was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_road_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_road_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/road_types/1 or /api/v1/road_types/1.json
  def update
    respond_to do |format|
      if @api_v1_road_type.update(api_v1_road_type_params)
        format.html { redirect_to @api_v1_road_type, notice: "Road type was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_road_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_road_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/road_types/1 or /api/v1/road_types/1.json
  def destroy
    @api_v1_road_type.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_road_types_path, status: :see_other, notice: "Road type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_road_type
      @api_v1_road_type = Api::V1::RoadType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def api_v1_road_type_params
      params.fetch(:api_v1_road_type, {})
    end
end
