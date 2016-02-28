class User::AttendancesController < User::BaseController
  before_action :authenticate_user!
  before_action :set_attendance, only: [:show]
  def alltasks
    @attendances = Attendance.where(attendance_rate_id: [1, 3])
    render 'index'
  end

  def mytasks
    @attendances = current_user.attendances.where(attendance_rate_id: [1, 3])
    render 'index'
  end

  private

    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:guest_id, :attendance_rate_id, :event_id)
    end
end
