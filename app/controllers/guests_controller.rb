class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update]

  def index
    @guests = Guest.all
    @q = Guest.ransack(params[:q])
    @guests = @q.result(distinct: true)
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
        format.html do
          @guest = Guest.new(guest_params)
          if @guest.save
            redirect_to guests_path, notice: 'Client was successfully created.'
          else
            render :new
          end
        end
      end
  end

  def update
    #update without changing password - if devise :registerable
    #if params[:guest][:password].blank?
    #  params[:guest].delete(:password)
    #  params[:guest].delete(:password_confirmation)
    #end
    #usual actions
    @guest = Guest.find(params[:id])
    if @guest.update_attributes(guest_params)
      sign_in(@guest, :bypass => true) if @guest == current_guest
      redirect_to guests_path, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end
    def guest_params
      params.require(:guest).permit(:email, :password, :password_confirmation, :first_name, :second_name, :last_name, :birthday, :sex, :address, :photo, :active, :lead_source_id)
    end
end