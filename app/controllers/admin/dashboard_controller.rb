class Admin::DashboardController < Admin::BaseController

  def index
  	@events = Event.all
  end
end