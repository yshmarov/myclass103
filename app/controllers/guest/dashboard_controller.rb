class Guest::DashboardController < Guest::BaseController

  def index
  	@events = Event.all
  end
end