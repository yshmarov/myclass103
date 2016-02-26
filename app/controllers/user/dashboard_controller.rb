class User::DashboardController < User::BaseController

  def index
  	@events = Event.all
  end
end