class Api::V1::CamerasController < ApplicationController
  before_action :set_api_v1_camera, only: %i[ show edit update destroy ]

  # GET /api/v1/cameras or /api/v1/cameras.json
  def index
    @api_v1_cameras = Api::V1::Camera.all
  end

  # GET /api/v1/cameras/1 or /api/v1/cameras/1.json
  def show
  end

  # GET /api/v1/cameras/new
  def new
    @api_v1_camera = Api::V1::Camera.new
  end

  # GET /api/v1/cameras/1/edit
  def edit
  end

  # POST /api/v1/cameras or /api/v1/cameras.json
  def create
    @api_v1_camera = Api::V1::Camera.new(api_v1_camera_params)

    respond_to do |format|
      if @api_v1_camera.save
        format.html { redirect_to @api_v1_camera, notice: "Camera was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_camera }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/cameras/1 or /api/v1/cameras/1.json
  def update
    respond_to do |format|
      if @api_v1_camera.update(api_v1_camera_params)
        format.html { redirect_to @api_v1_camera, notice: "Camera was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_camera }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/cameras/1 or /api/v1/cameras/1.json
  def destroy
    @api_v1_camera.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_cameras_path, status: :see_other, notice: "Camera was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_camera
      @api_v1_camera = Api::V1::Camera.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def api_v1_camera_params
      params.fetch(:api_v1_camera, {})
    end
end
