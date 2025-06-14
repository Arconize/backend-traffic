class Api::V1::MonitoringsController < ApplicationController
  before_action :set_api_v1_monitoring, only: %i[ show edit update destroy ]

  # GET /api/v1/monitorings or /api/v1/monitorings.json
  def index
    @api_v1_monitorings = Api::V1::Monitoring.all
  end

  # GET /api/v1/monitorings/1 or /api/v1/monitorings/1.json
  def show
  end

  # GET /api/v1/monitorings/new
  def new
    @api_v1_monitoring = Api::V1::Monitoring.new
  end

  # GET /api/v1/monitorings/1/edit
  def edit
  end

  # POST /api/v1/monitorings or /api/v1/monitorings.json
  def create
    @api_v1_monitoring = Api::V1::Monitoring.new(api_v1_monitoring_params)

    respond_to do |format|
      if @api_v1_monitoring.save
        format.html { redirect_to @api_v1_monitoring, notice: "Monitoring was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_monitoring }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/monitorings/1 or /api/v1/monitorings/1.json
  def update
    respond_to do |format|
      if @api_v1_monitoring.update(api_v1_monitoring_params)
        format.html { redirect_to @api_v1_monitoring, notice: "Monitoring was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_monitoring }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/monitorings/1 or /api/v1/monitorings/1.json
  def destroy
    @api_v1_monitoring.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_monitorings_path, status: :see_other, notice: "Monitoring was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_monitoring
      @api_v1_monitoring = Api::V1::Monitoring.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def api_v1_monitoring_params
      params.fetch(:api_v1_monitoring, {})
    end
end
