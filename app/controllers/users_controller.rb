class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
	
  def index
    @users = User.all
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
            redirect_to users_path, notice: 'User was successfully created.'
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
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted"
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
