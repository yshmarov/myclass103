class Admin::EventGroupsController < Admin::BaseController
  before_action :set_event_group, only: [:show, :edit, :update, :destroy]

  # GET /event_groups
  # GET /event_groups.json
  def index
    @event_groups = EventGroup.all
    @q = EventGroup.ransack(params[:q])
    @event_groups = @q.result.includes(:attr1, :attr2, :attr3, :service)
    @q.build_condition
  end

  # GET /event_groups/1
  # GET /event_groups/1.json
  def show
    @events = @event_group.events
    @attendances = @event_group.attendances
  end

  # GET /event_groups/new
  def new
    @event_group = EventGroup.new
    1.times do
      event = @event_group.events.build
      1.times { event.attendances.build }
    end
  end

  # GET /event_groups/1/edit
  def edit
    @event_group.events.build
    @event_group.attendances.build
  end

  # POST /event_groups
  # POST /event_groups.json
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

  # PATCH/PUT /event_groups/1
  # PATCH/PUT /event_groups/1.json
  def update
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

  # DELETE /event_groups/1
  # DELETE /event_groups/1.json
  def destroy
    @event_group.destroy
    respond_to do |format|
      format.html { redirect_to admin_event_groups_url, notice: 'Event group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_group
      @event_group = EventGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_group_params
      params.require(:event_group).permit(:name, :status, :service_id, :attr1_id, :attr2_id, :attr3_id, events_attributes: [ :id, :starts_at, :duration, :room_id, :user_id, :_destroy, attendances_attributes: [ :id, :attendance_rate_id, :guest_id, :_destroy ]])
    end
end
