class Admin::Attr3sController < Admin::BaseController
  before_action :set_attr3, only: [:show, :edit, :update, :destroy]

  # GET /attr3s
  # GET /attr3s.json
  def index
    @attr3s = Attr3.all
  end

  # GET /attr3s/1
  # GET /attr3s/1.json
  def show
  end

  # GET /attr3s/new
  def new
    @attr3 = Attr3.new
  end

  # GET /attr3s/1/edit
  def edit
  end

  # POST /attr3s
  # POST /attr3s.json
  def create
    @attr3 = Attr3.new(attr3_params)

    respond_to do |format|
      if @attr3.save
        format.html { redirect_to [:admin, @attr3], notice: 'Attr3 was successfully created.' }
        format.json { render :show, status: :created, location: @attr3 }
      else
        format.html { render :new }
        format.json { render json: @attr3.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attr3s/1
  # PATCH/PUT /attr3s/1.json
  def update
    respond_to do |format|
      if @attr3.update(attr3_params)
        format.html { redirect_to [:admin, @attr3], notice: 'Attr3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @attr3 }
      else
        format.html { render :edit }
        format.json { render json: @attr3.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attr3s/1
  # DELETE /attr3s/1.json
  def destroy
    @attr3.destroy
    respond_to do |format|
      format.html { redirect_to admin_attr3s_url, notice: 'Attr3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attr3
      @attr3 = Attr3.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attr3_params
      params.require(:attr3).permit(:name)
    end
end
