module BlogsHelper
	def current_blog? (id) 
		if  params[:id].to_s == id.to_s 
			return 'active'
		end
		return ''
  end

  def current_page? id
    page = params[:page]
    page = 1 if !page
    if page.to_i == id
      return 'active'
    end
    return ''
  end
  def first_page?
    if params[:page].to_i > 1
      return ''
    end
    return 'disabled'
  end

  def last_page?
    if params[:page].to_i < @num_pages
      return ''
    end
    return 'disabled'
  end

  def page_down
    page = params[:page].to_i - 1
    page = 1 if page < 1
    return page
  end

  def page_up
    page = params[:page].to_i + 1
    page = @num_pages if page > @num_pages
    return page
  end

end
