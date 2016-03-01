class UsersController < ApplicationController
	
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

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted"
  end
end
