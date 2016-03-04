module EventsHelper
  def events_chart_data
  	(1.year.ago.to_date..Date.today).map do |date|
  		{
  			starts_at: date,
  			id: Event.where("date(starts_at) =?", date).count(:id)
  		}
  	end
  end
end
