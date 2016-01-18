class ServiceNamesController < ApplicationController
  before_action :set_service_name, only: [:show, :edit, :update, :destroy]

  # GET /service_names
  # GET /service_names.json
  def index
    @service_names = ServiceName.all
  end

  # GET /service_names/1
  # GET /service_names/1.json
  def show
  end

  # GET /service_names/new
  def new
    @service_name = ServiceName.new
  end

  # GET /service_names/1/edit
  def edit
  end

  # POST /service_names
  # POST /service_names.json
  def create
    @service_name = ServiceName.new(service_name_params)

    respond_to do |format|
      if @service_name.save
        format.html { redirect_to @service_name, notice: 'Service name was successfully created.' }
        format.json { render :show, status: :created, location: @service_name }
      else
        format.html { render :new }
        format.json { render json: @service_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_names/1
  # PATCH/PUT /service_names/1.json
  def update
    respond_to do |format|
      if @service_name.update(service_name_params)
        format.html { redirect_to @service_name, notice: 'Service name was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_name }
      else
        format.html { render :edit }
        format.json { render json: @service_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_names/1
  # DELETE /service_names/1.json
  def destroy
    @service_name.destroy
    respond_to do |format|
      format.html { redirect_to service_names_url, notice: 'Service name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_name
      @service_name = ServiceName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_name_params
      params.require(:service_name).permit(:name)
    end
end
