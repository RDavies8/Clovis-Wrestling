module ApplicationHelper
	def is_active (name) 
		if  params[:controller] == name 
			return "active"
		end
		return ""
	end
end
