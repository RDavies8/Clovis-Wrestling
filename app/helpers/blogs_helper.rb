module BlogsHelper
	def current_blog? (id) 
		if  params[:id].to_s == id.to_s 
			return 'active'
		end
		return ''
	end
end
