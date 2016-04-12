class Admin::AttendancesController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :set_attendance, only: [:edit, :update]

  def index
    @attendances = Attendance.all
    @totalduepayment = @attendances.map(&:duepayment).sum
    #@future_attendances = @attendances.where('startz > ?', Time.now)
    #@future_events = @event_group.events.where('starts_at > ?', Time.now).order('starts_at ASC')
  end

  def alltasks
    @attendances = Attendance.where(attendance_rate_id: [1, 3])
    render 'index'
  end

  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to [:admin, @attendance], notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to admin_attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:guest_id, :attendance_rate_id, :event_id)
    end
end
