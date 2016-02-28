class User::EventsController < User::BaseController
  before_action :authenticate_user!
  before_action :set_event, only: [:edit, :update]

  def edit
    @event.attendances.build
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [:user, @event.event_group], notice: 'Event was successfully updated.' }
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
      params.require(:event).permit(:starts_at, :room_id, :user_id, :event_group_id, attendances_attributes: [ :id, :attendance_rate_id, :guest_id, :_destroy ])
    end
end
