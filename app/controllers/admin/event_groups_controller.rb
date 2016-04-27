class Admin::EventGroupsController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_event_group, only: [:show, :edit, :update, :destroy]

  def index
    @event_groups = EventGroup.all
    @q = EventGroup.ransack(params[:q])
    @event_groups = @q.result.includes(:attr1, :attr2, :attr3, :service)
  end

  def active
    @event_groups = EventGroup.where(status: [:active])
    @q = EventGroup.ransack(params[:q])
    @event_groups = @q.result.includes(:attr1, :attr2, :attr3, :service)
    render 'index'
  end

  def show
    @events = @event_group.events
    @attendances = @event_group.attendances
    @past_events = @event_group.events.where('starts_at < ?', Time.now).order('starts_at ASC')
    @future_events = @event_group.events.where('starts_at > ?', Time.now).order('starts_at ASC')
    @enrollments = @event_group.enrollments
    @totalduepaymentguest = @attendances.map(&:duepayment).sum
    @guests = @event_group.guests
    #@guest.attendances = @event_group.guest.attendances
  end

  def new
    @offices = Office.all
    @event_group = EventGroup.new
  end

  def edit
    @offices = Office.all
    @event_group.events.build
    @event_group.attendances.build
  end

  def create
    @event_group = EventGroup.new(event_group_params)

    respond_to do |format|
      if @event_group.save
        format.html { redirect_to [:admin, @event_group], notice: 'Event group was successfully created.' }
        format.json { render :show, status: :created, location: @event_group }
      else
        format.html { render :new }
        format.json { render json: @event_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @offices = Office.all
    respond_to do |format|
      if @event_group.update(event_group_params)
        format.html { redirect_to [:admin, @event_group], notice: 'Event group was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_group }
      else
        format.html { render :edit }
        format.json { render json: @event_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event_group.destroy
    respond_to do |format|
      format.html { redirect_to admin_event_groups_url, notice: 'Event group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_event_group
      @event_group = EventGroup.find(params[:id])
    end

    def event_group_params
      params.require(:event_group).permit(:name, :status, :service_id, :attr1_id, :attr2_id, :attr3_id, events_attributes: [ :id, :starts_at, :duration, :room_id, :user_id, :_destroy, attendances_attributes: [ :id, :attendance_rate_id, :guest_id, :_destroy ]])
    end
end
