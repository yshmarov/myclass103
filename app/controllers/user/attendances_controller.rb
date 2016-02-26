class User::AttendancesController < User::BaseController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = Attendance.all
  end

  def tasks
    @attendances = Attendance.where(attendance_rate_id: [1, 3])
    render 'index'
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to [:user, @attendance], notice: 'Attendance was successfully updated.' }
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
      format.html { redirect_to user_attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
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
