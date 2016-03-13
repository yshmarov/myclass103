class Admin::ExpencesController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_expence, only: [:show, :edit, :update, :destroy]

  def index
    @expences = Expence.all
  end

  def new
    @expence = Expence.new
  end

  def create
    @expence = Expence.new(expence_params)

    respond_to do |format|
      if @expence.save
        format.html { redirect_to admin_expences_path, notice: 'Expence was successfully created.' }
        format.json { render :show, status: :created, location: @expence }
      else
        format.html { render :new }
        format.json { render json: @expence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expence.destroy
    respond_to do |format|
      format.html { redirect_to admin_expences_url, notice: 'Expence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_expence
      @expence = Expence.find(params[:id])
    end

    def expence_params
      params.require(:expence).permit(:amount, :description, :user_id)
    end
end
