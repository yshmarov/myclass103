class Admin::UsersController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update]
	
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user =  User.find(params[:id])
    @events = @user.events
    @total_price = @user.services.sum(:uprice)
    @income = @user.expences.sum(:amount)
    @expences = @user.expences
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
      respond_to do |format|
        format.html do
          @user = User.new(user_params)
          if @user.save
            redirect_to admin_users_path, notice: 'User was successfully created.'
          else
            render :new
          end
        end
      end
  end

  def update
    #update without changing password
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    #usual actions
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :second_name, :last_name, :birthday, :sex, :address, :photo, :active)
    end
end
