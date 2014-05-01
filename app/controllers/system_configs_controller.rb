class SystemConfigsController < ApplicationController
  before_action :set_system_config, only: [:show, :edit, :update, :destroy]

  # GET /system_configs
  # GET /system_configs.json
  def index
    @system_configs = SystemConfig.all
  end

  # GET /system_configs/1
  # GET /system_configs/1.json
  def show
  end

  # GET /system_configs/new
  def new
    @system_config = SystemConfig.new
  end

  # GET /system_configs/1/edit
  def edit
  end

  # POST /system_configs
  # POST /system_configs.json
  def create
    @system_config = SystemConfig.new(system_config_params)

    respond_to do |format|
      if @system_config.save
        format.html { redirect_to @system_config, notice: 'System config was successfully created.' }
        format.json { render action: 'show', status: :created, location: @system_config }
      else
        format.html { render action: 'new' }
        format.json { render json: @system_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_configs/1
  # PATCH/PUT /system_configs/1.json
  def update
    respond_to do |format|
      if @system_config.update(system_config_params)
        format.html { redirect_to system_configs_path, notice: "#{@system_config.description} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @system_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_configs/1
  # DELETE /system_configs/1.json
  def destroy
    @system_config.destroy
    respond_to do |format|
      format.html { redirect_to system_configs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_config
      @system_config = SystemConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_config_params
      params.require(:system_config).permit(:name, :value, :description)
    end
end
