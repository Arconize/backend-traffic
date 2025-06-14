class Api::V1::RoadsController < ApplicationController
  before_action :set_api_v1_road, only: %i[ show edit update destroy ]

  # GET /api/v1/roads or /api/v1/roads.json
  def index
    @api_v1_roads = Api::V1::Road.all
  end

  # GET /api/v1/roads/1 or /api/v1/roads/1.json
  def show
  end

  # GET /api/v1/roads/new
  def new
    @api_v1_road = Api::V1::Road.new
  end

  # GET /api/v1/roads/1/edit
  def edit
  end

  # POST /api/v1/roads or /api/v1/roads.json
  def create
    @api_v1_road = Api::V1::Road.new(api_v1_road_params)

    respond_to do |format|
      if @api_v1_road.save
        format.html { redirect_to @api_v1_road, notice: "Road was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_road }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_road.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/roads/1 or /api/v1/roads/1.json
  def update
    respond_to do |format|
      if @api_v1_road.update(api_v1_road_params)
        format.html { redirect_to @api_v1_road, notice: "Road was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_road }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_road.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/roads/1 or /api/v1/roads/1.json
  def destroy
    @api_v1_road.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_roads_path, status: :see_other, notice: "Road was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_road
      @api_v1_road = Api::V1::Road.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def api_v1_road_params
      params.fetch(:api_v1_road, {})
    end
end
