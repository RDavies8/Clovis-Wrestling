module ApplicationHelper
	def is_active (name) 
		if  params[:controller] == name 
			return 'active'
		end
		return ''
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
