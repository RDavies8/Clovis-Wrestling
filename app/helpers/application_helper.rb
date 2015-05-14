module ApplicationHelper
  require 'tweets'

	def is_active (name)
		if  params[:controller] == name 
			return 'active'
		end
		return ''
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    return current_user.admin if current_user
    return false
  end

end
