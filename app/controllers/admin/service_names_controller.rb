class Admin::ServiceNamesController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_service_name, only: [:show, :edit, :update, :destroy]

  def index
    @service_names = ServiceName.all
  end

  def new
    @service_name = ServiceName.new
  end

  def edit
  end

  def create
    @service_name = ServiceName.new(service_name_params)

    respond_to do |format|
      if @service_name.save
        format.html { redirect_to admin_service_names_path, notice: 'Service name was successfully created.' }
        format.json { render :show, status: :created, location: @service_name }
      else
        format.html { render :new }
        format.json { render json: @service_name.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service_name.update(service_name_params)
        format.html { redirect_to admin_service_names_path, notice: 'Service name was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_name }
      else
        format.html { render :edit }
        format.json { render json: @service_name.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service_name.destroy
    respond_to do |format|
      format.html { redirect_to admin_service_names_url, notice: 'Service name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_service_name
      @service_name = ServiceName.find(params[:id])
    end

    def service_name_params
      params.require(:service_name).permit(:name)
    end
end
