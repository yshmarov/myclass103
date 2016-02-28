class Admin::EventsController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_event, only: [:edit, :update]

  def index
    @events = Event.all
    @totaldueexpence = @events.map(&:dueexpence).sum
  end

  def edit
    @event.attendances.build
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [:admin, @event.event_group], notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:starts_at, :duration, :room_id, :user_id, :event_group_id, attendances_attributes: [ :id, :attendance_rate_id, :guest_id, :_destroy ])
    end
end
