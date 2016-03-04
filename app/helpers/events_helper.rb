module EventsHelper
  def events_chart_data
  	(3.weeks.ago.to_date..Date.today).map do |date|
  		{
  			created_at: date,
  			id: Event.where("date(created_at) =?", date).count(:id)
  		}
  	end
  end
end
