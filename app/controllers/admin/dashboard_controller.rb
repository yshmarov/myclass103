class Admin::DashboardController < Admin::BaseController

  def index
  	@events = Event.all
    @attendances = Attendance.all
	@totalduepayment = @attendances.map(&:duepayment).sum
    @totaldueexpence = @events.map(&:dueexpence).sum
  end
  def stats
  	@events = Event.all
  end
end