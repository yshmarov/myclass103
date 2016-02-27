class User::AttendancesController < User::BaseController
  before_action :set_attendance, only: [:show]
  def alltasks
    @attendances = Attendance.where(attendance_rate_id: [1, 3])
    render 'index'
  end

  def mytasks
    @attendances = current_user.attendances.where(attendance_rate_id: [1, 3])
    #@attendances = Attendance.on_user_events(current_user)
    #@attendances = Attendance.joins(:event).where(:user_id => current_user.id)
    render 'index'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:guest_id, :attendance_rate_id, :event_id)
    end
end
