class GuestsController < ApplicationController

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
  end
  def create
    @guest = Guest.new(guest_params)
    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
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
