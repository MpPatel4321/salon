module ApplicationHelper
	def show_taken_time(taken_time)
		taken_time = taken_time.strftime("%H:%M").split(":")
		taken_time_string = ""
		if (taken_time[0].to_i == 0)
			taken_time_string = "#{taken_time[1]} minutes"
		elsif (taken_time[1].to_i == 0)
			taken_time_string = "#{taken_time[0]} hour"
		else
			taken_time_string = "#{taken_time[0]} hour #{taken_time[1]} minutes"
		end
		taken_time_string
	end
end
