 class Guest::GuestsController < Guest::BaseController
  before_action :set_guest, only: [:show, :edit, :update]

  def show
    @guest =  current_guest
    @events = @guest.events
    @attendances = @guest.attendances
    @totalduepaymentguest = @attendances.map(&:duepayment).sum
  end

  def edit
    @guest = current_guest
  end

  def update
    #update without changing password - if devise :registerable
    #if params[:guest][:password].blank?
    #  params[:guest].delete(:password)
    #  params[:guest].delete(:password_confirmation)
    #end
    #usual actions
    @guest = current_guest
    if @guest.update_attributes(guest_params)
      sign_in(@guest, :bypass => true) if @guest == current_guest
      redirect_to guest_guest_path(current_guest), notice: 'Client was successfully updated.'
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