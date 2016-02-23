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

  def destroy
    guest = Guest.find(params[:id])
    guest.destroy
    redirect_to guests_path, :notice => "Client deleted"
  end
end
