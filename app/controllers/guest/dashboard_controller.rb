class Guest::DashboardController < Guest::BaseController
  before_action :authenticate_guest!

  def index
  	@events = Event.all
  end
end