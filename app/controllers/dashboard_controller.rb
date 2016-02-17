class DashboardController < ApplicationController
  def index
  	@events = Event.all
    @attendances = Attendance.all

	@totalduepayment = @attendances.map(&:duepayment).sum

  end
end
