class User::UsersController < User::BaseController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
	
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @user =  current_user
    @events = @user.events
    @total_price = @user.services.sum(:uprice)
    @income = @user.expences.sum(:amount)
    @expences = @user.expences
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      format.html do
        if @user.update(user_params)
          sign_in(@user, :bypass => true) if @user == current_user
          redirect_to user_user_path(current_user), notice: 'User was successfully updated.'
        else
          render :edit
        end
      end
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
