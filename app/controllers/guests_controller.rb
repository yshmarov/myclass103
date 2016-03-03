class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  def index
    @guests = Guest.all
  end
  def show
    @guest =  Guest.find(params[:id])
    @events = @guest.events
    @attendances = @guest.attendances
    @totalduepaymentguest = @attendances.map(&:duepayment).sum
  end
  def new
    @guest = Guest.new
  end
  def edit
    @guest = Guest.find(params[:id])
  end
  def create
    respond_to do |format|
      @guest = Guest.new(guest_params)
      if @guest.save
        sign_in(@guest, :bypass => true) if @guest == current_guest
        redirect_to guests_path, notice: 'Client was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    #update without changing password
    if params[:guest][:password].blank?
      params[:guest].delete(:password)
      params[:guest].delete(:password_confirmation)
    end
    #usual actions
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      sign_in(@guest, :bypass => true) if @guest == current_guest
      redirect_to guests_path, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    guest = Guest.find(params[:id])
    guest.destroy
    redirect_to guests_path, :notice => "Client deleted"
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end
    def guest_params
      params.require(:guest).permit(:email, :password, :password_confirmation)
    end
end
