class Admin::Attr2sController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_attr2, only: [:show, :edit, :update, :destroy]

  def index
    @attr2s = Attr2.all
  end

  def new
    @attr2 = Attr2.new
  end

  def edit
  end

  def create
    @attr2 = Attr2.new(attr2_params)

    respond_to do |format|
      if @attr2.save
        format.html { redirect_to admin_attr2s_path, notice: 'Attr2 was successfully created.' }
        format.json { render :show, status: :created, location: @attr2 }
      else
        format.html { render :new }
        format.json { render json: @attr2.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attr2.update(attr2_params)
        format.html { redirect_to admin_attr2s_path, notice: 'Attr2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @attr2 }
      else
        format.html { render :edit }
        format.json { render json: @attr2.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attr2.destroy
    respond_to do |format|
      format.html { redirect_to admin_attr2s_url, notice: 'Attr2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attr2
      @attr2 = Attr2.find(params[:id])
    end

    def attr2_params
      params.require(:attr2).permit(:name)
    end
end
