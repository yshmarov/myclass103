class Admin::AttendanceRatesController < Admin::BaseController
  before_action :set_attendance_rate, only: [:destroy]

  # GET /attendance_rates
  # GET /attendance_rates.json
  def index
    @attendance_rates = AttendanceRate.all
  end

  # GET /attendance_rates/1
  # GET /attendance_rates/1.json
  def show
  end

  # GET /attendance_rates/new
  def new
    @attendance_rate = AttendanceRate.new
  end

  # GET /attendance_rates/1/edit
  def edit
  end

  # POST /attendance_rates
  # POST /attendance_rates.json
  def create
    @attendance_rate = AttendanceRate.new(attendance_rate_params)

    respond_to do |format|
      if @attendance_rate.save
        format.html { redirect_to admin_attendance_rates_path, notice: 'Attendance rate was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /attendance_rates/1
  # PATCH/PUT /attendance_rates/1.json
  # DELETE /attendance_rates/1
  # DELETE /attendance_rates/1.json
  def destroy
    @attendance_rate.destroy
    respond_to do |format|
      format.html { redirect_to admin_attendance_rates_url, notice: 'Attendance rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_rate
      @attendance_rate = AttendanceRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_rate_params
      params.require(:attendance_rate).permit(:name, :rate)
    end
end
