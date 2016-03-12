class Admin::Attr1sController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_attr1, only: [:show, :edit, :update, :destroy]

  def index
    @attr1s = Attr1.all
  end

  def new
    @attr1 = Attr1.new
  end

  def edit
  end

  def create
    @attr1 = Attr1.new(attr1_params)

    respond_to do |format|
      if @attr1.save
        format.html { redirect_to admin_attr1s_path, notice: 'Attr1 was successfully created.' }
        format.json { render :show, status: :created, location: @attr1 }
      else
        format.html { render :new }
        format.json { render json: @attr1.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attr1.update(attr1_params)
        format.html { redirect_to admin_attr1s_path, notice: 'Attr1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @attr1 }
      else
        format.html { render :edit }
        format.json { render json: @attr1.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attr1.destroy
    respond_to do |format|
      format.html { redirect_to admin_attr1s_url, notice: 'Attr1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attr1
      @attr1 = Attr1.find(params[:id])
    end

    def attr1_params
      params.require(:attr1).permit(:name)
    end
end
