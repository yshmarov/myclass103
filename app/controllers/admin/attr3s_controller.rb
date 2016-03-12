class Admin::Attr3sController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_attr3, only: [:show, :edit, :update, :destroy]

  def index
    @attr3s = Attr3.all
  end

  def new
    @attr3 = Attr3.new
  end

  def edit
  end

  def create
    @attr3 = Attr3.new(attr3_params)

    respond_to do |format|
      if @attr3.save
        format.html { redirect_to admin_attr3s_path, notice: 'Attr3 was successfully created.' }
        format.json { render :show, status: :created, location: @attr3 }
      else
        format.html { render :new }
        format.json { render json: @attr3.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attr3.update(attr3_params)
        format.html { redirect_to admin_attr3s_path, notice: 'Attr3 was successfully updated.' }
        format.json { render :show, status: :ok, location: @attr3 }
      else
        format.html { render :edit }
        format.json { render json: @attr3.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attr3.destroy
    respond_to do |format|
      format.html { redirect_to admin_attr3s_url, notice: 'Attr3 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attr3
      @attr3 = Attr3.find(params[:id])
    end

    def attr3_params
      params.require(:attr3).permit(:name)
    end
end
