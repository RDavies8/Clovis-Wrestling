class HomeController < ApplicationController
  def index
  	@post = Blog.last
  end

end
