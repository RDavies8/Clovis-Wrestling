class BlogsController < ApplicationController
	def index
    per_page = 5
    @page = params[:page].to_i
    @page = 1 if !@page
    @num_pages = (Blog.count+1) / per_page
		@blogs = Blog.offset((@page-1) * per_page).last(per_page).reverse
	end


	def show
		@blog = Blog.find(params[:id])
		@blogs = Blog.last(3).reverse

    @comment = @blog.comments.new if session[:user_id]
    @comments = @blog.comments.all
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new
		@blog.title = params[:blog][:title]
    author = params[:blog][:author]
    if author.blank?
      @blog.author = 'Clovis Wrestling'
    else
      @blog.coach = Coach.find(params[:blog][:author])
      @blog.author = @blog.coach.name
    end
		@blog.article = params[:blog][:article]

    if params[:blog][:image]
      image_filename = params[:blog][:image].original_filename
      path = Rails.root.join('app', 'assets', 'images', image_filename)
      File.open(path, 'wb') do |f|
        f.write(params[:blog][:image].read)
      end
    else
      image_filename = 'clovisC.png'
    end


		@blog.image_id = image_filename

		if @blog.save
      flash[:notice_title] = @blog.title
      flash[:notice] = 'Successfully Posted'
      redirect_to blog_path @blog.id
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    if !@blog
      return redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    return redirect_to new_blog_path if !@blog

    if user.update_attributes blog_params(params[:blog])
      flash[:notice_title] =  @blog.title
      flash[:notice] = 'Blog Successfully Updated'
      redirect_to edit_blog_path @blog.id
    else
      flash[:error] = ''
    end
  end

  def blog_params(params)
    return params.permit :title, :author, :article, :image_id
  end
end
