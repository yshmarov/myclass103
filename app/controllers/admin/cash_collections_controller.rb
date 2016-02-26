class Admin::CashCollectionsController < Admin::BaseController
  before_action :set_cash_collection, only: [:show, :edit, :update, :destroy]

  # GET /cash_collections
  # GET /cash_collections.json
  def index
    @cash_collections = CashCollection.all
  end

  # GET /cash_collections/1
  # GET /cash_collections/1.json
  def show
  end

  # GET /cash_collections/new
  def new
    @cash_collection = CashCollection.new
  end

  # GET /cash_collections/1/edit
  def edit
  end

  # POST /cash_collections
  # POST /cash_collections.json
  def create
    @cash_collection = CashCollection.new(cash_collection_params)

    respond_to do |format|
      if @cash_collection.save
        format.html { redirect_to [:admin, @cash_collection], notice: 'Cash collection was successfully created.' }
        format.json { render :show, status: :created, location: @cash_collection }
      else
        format.html { render :new }
        format.json { render json: @cash_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_collections/1
  # PATCH/PUT /cash_collections/1.json
  def update
    respond_to do |format|
      if @cash_collection.update(cash_collection_params)
        format.html { redirect_to [:admin, @cash_collection], notice: 'Cash collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_collection }
      else
        format.html { render :edit }
        format.json { render json: @cash_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_collections/1
  # DELETE /cash_collections/1.json
  def destroy
    @cash_collection.destroy
    respond_to do |format|
      format.html { redirect_to admin_cash_collections_url, notice: 'Cash collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_collection
      @cash_collection = CashCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_collection_params
      params.require(:cash_collection).permit(:amount, :office_id, :admin_id)
    end
end
