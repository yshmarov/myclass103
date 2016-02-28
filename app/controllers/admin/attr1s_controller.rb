class Admin::Attr1sController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_attr1, only: [:show, :edit, :update, :destroy]

  # GET /attr1s
  # GET /attr1s.json
  def index
    @attr1s = Attr1.all
  end

  # GET /attr1s/1
  # GET /attr1s/1.json
  def show
  end

  # GET /attr1s/new
  def new
    @attr1 = Attr1.new
  end

  # GET /attr1s/1/edit
  def edit
  end

  # POST /attr1s
  # POST /attr1s.json
  def create
    @attr1 = Attr1.new(attr1_params)

    respond_to do |format|
      if @attr1.save
        format.html { redirect_to [:admin, @attr1], notice: 'Attr1 was successfully created.' }
        format.json { render :show, status: :created, location: @attr1 }
      else
        format.html { render :new }
        format.json { render json: @attr1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attr1s/1
  # PATCH/PUT /attr1s/1.json
  def update
    respond_to do |format|
      if @attr1.update(attr1_params)
        format.html { redirect_to [:admin, @attr1], notice: 'Attr1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @attr1 }
      else
        format.html { render :edit }
        format.json { render json: @attr1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attr1s/1
  # DELETE /attr1s/1.json
  def destroy
    @attr1.destroy
    respond_to do |format|
      format.html { redirect_to admin_attr1s_url, notice: 'Attr1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attr1
      @attr1 = Attr1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attr1_params
      params.require(:attr1).permit(:name)
    end
end
