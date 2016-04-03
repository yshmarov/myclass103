class Admin::OfficesController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_office, only: [:show, :edit, :update, :destroy]

  def index
    @offices = Office.all
  #  @officereceived = @office.cash_collections.sum(:amount)
  end

  def show
    @events = @office.events
    @rooms = @office.rooms
    @officereceived = @office.cash_collections.sum(:amount)
  end

  def new
    @office = Office.new
  end

  def edit
  end

  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to [:admin, @office], notice: 'Office was successfully created.' }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to [:admin, @office], notice: 'Office was successfully updated.' }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to admin_offices_url, notice: 'Office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_office
      @office = Office.find(params[:id])
    end

    def office_params
      params.require(:office).permit(:name, :address, :email, :phone, :company_id)
    end
end
