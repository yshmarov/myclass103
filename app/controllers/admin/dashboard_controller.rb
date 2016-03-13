class Admin::DashboardController < Admin::BaseController
  before_action :authenticate_admin!

  def index
  	@events = Event.all
    @attendances = Attendance.all
  	@totalduepayment = @attendances.map(&:duepayment).sum
    @totaldueexpence = @events.map(&:dueexpence).sum
  end
  def stats
  	@events = Event.all
  end
  def docs
  end
end