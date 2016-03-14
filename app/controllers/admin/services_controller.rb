class Admin::ServicesController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_service, only: [:edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_services_path, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to admin_services_path, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:service_name_id, :event_quantity, :event_length, :uprice, :gprice, :gtype, :ctype, :is_active)
    end
end
