class BlogsController < ApplicationController
	def index
		#redirect_to '/blogs/3'
		@blogs = Blog.last(3).reverse
	end


	def show
		@blog = Blog.find(params[:id])
		@blogs = Blog.last(3).reverse
	end

	def new
		@blog = Blog.new
	end

	def create
		blog = Blog.new
		blog.title = params[:blog][:title]
		blog.author = params[:blog][:author]
		blog.article = params[:blog][:article]

		image_filename = params[:blog][:image].original_filename
		path = Rails.root.join('app', 'assets', 'images', image_filename)
		File.open(path, "wb") do |f|
			f.write(params[:blog][:image].read)
		end

		blog.image_id = image_filename

		blog.save
		redirect_to blogs_path
	end

end
