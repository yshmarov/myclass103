class Admin::GuestsController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_guest, only: [:show, :edit, :update]

  def index
    @guests = Guest.all
    @q = Guest.ransack(params[:q])
    @guests = @q.result(distinct: true)
  end

  def show
    #@guest = Guest.find(params[:id])
    #for comments
    @comments = @guest.comments
    @comment = Comment.new
    #for payment / CRM tracking
    @opportunities = @guest.opportunities
    @event_groups = @guest.event_groups
      #test: group totalduepayment by event_group
    #@grouptotalduepayment =  @event_group.attendances.map(&:duepayment).sum
    #for calendar
    @events = @guest.events
    #for how much to pay per attendance
    @attendances = @guest.attendances
      #skips event_group & events. All guests attendances summed by payment
    @totalduepaymentguest = @attendances.map(&:duepayment).sum
      #past and future attendances
    #@past_attendances = @attendances.order('startz ASC') #.where('startz < ?', Time.now).order('startz ASC')
    #@future_attendances = @guest.attendances.where('event.starts_at > ?', Time.now) #.order('startz ASC')
    @totalatt = @guest.attendances.count
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
            redirect_to admin_guests_path, notice: 'Client was successfully created.'
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
      redirect_to admin_guests_path, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end
    def guest_params
      params.require(:guest).permit(:email, :password, :password_confirmation, :first_name, :second_name, :last_name, :birthday, :sex, :address, :photo, :active, :lead_source_id, :contact_1, :contact_2)
    end
end