class Admin::Attr2sController < Admin::BaseController
  before_action :set_attr2, only: [:show, :edit, :update, :destroy]

  # GET /attr2s
  # GET /attr2s.json
  def index
    @attr2s = Attr2.all
  end

  # GET /attr2s/1
  # GET /attr2s/1.json
  def show
  end

  # GET /attr2s/new
  def new
    @attr2 = Attr2.new
  end

  # GET /attr2s/1/edit
  def edit
  end

  # POST /attr2s
  # POST /attr2s.json
  def create
    @attr2 = Attr2.new(attr2_params)

    respond_to do |format|
      if @attr2.save
        format.html { redirect_to [:admin, @attr2], notice: 'Attr2 was successfully created.' }
        format.json { render :show, status: :created, location: @attr2 }
      else
        format.html { render :new }
        format.json { render json: @attr2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attr2s/1
  # PATCH/PUT /attr2s/1.json
  def update
    respond_to do |format|
      if @attr2.update(attr2_params)
        format.html { redirect_to [:admin, @attr2], notice: 'Attr2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @attr2 }
      else
        format.html { render :edit }
        format.json { render json: @attr2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attr2s/1
  # DELETE /attr2s/1.json
  def destroy
    @attr2.destroy
    respond_to do |format|
      format.html { redirect_to admin_attr2s_url, notice: 'Attr2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attr2
      @attr2 = Attr2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attr2_params
      params.require(:attr2).permit(:name)
    end
end
