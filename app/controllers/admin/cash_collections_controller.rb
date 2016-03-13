class Admin::CashCollectionsController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_cash_collection, only: [:destroy]

  def index
    @cash_collections = CashCollection.all
  end

  def new
    @cash_collection = CashCollection.new
  end

  def create
    @cash_collection = CashCollection.new(cash_collection_params)

    respond_to do |format|
      if @cash_collection.save
        format.html { redirect_to admin_cash_collections_path, notice: 'Cash collection was successfully created.' }
        format.json { render :show, status: :created, location: @cash_collection }
      else
        format.html { render :new }
        format.json { render json: @cash_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cash_collection.destroy
    respond_to do |format|
      format.html { redirect_to admin_cash_collections_url, notice: 'Cash collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_cash_collection
      @cash_collection = CashCollection.find(params[:id])
    end

    def cash_collection_params
      params.require(:cash_collection).permit(:amount, :office_id, :admin_id)
    end
end
