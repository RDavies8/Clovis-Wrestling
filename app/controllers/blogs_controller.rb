class BlogsController < ApplicationController
	def index
    per_page = 5
    @page = params[:page].to_i
    @page = 1 if @page == 0
    num_blogs = Blog.count
    @num_pages = (num_blogs / per_page)
    @num_pages += 1 if @num_pages != 0
		if num_blogs > per_page then
      @blogs = Blog.offset((@page-1) * per_page).last(per_page).reverse
    else
      @blogs = Blog.all.reverse
    end
	end


	def show
		@blog = Blog.find(params[:id])
		@blogs = Blog.last(3).reverse

    @comment = @blog.comments.new if session[:user_id]
    @comments = @blog.comments.all
	end

	def new
    # return redirect_to blogs_path if !session[:user_id] or !User.find(session[:user_id]).admin
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
      render :edit
    end
  end

  def edit
    return redirect_to blog_path(params[:id]) if !session[:user_id] or !User.find(session[:user_id]).admin

    @blog = Blog.find(params[:id])
    if !@blog
      return redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    return redirect_to new_blog_path if !@blog

    if params[:blog][:author].blank?
      params[:blog][:author] = 'Clovis Wrestling'
    else
      @blog.coach = Coach.find(params[:blog][:author])
      params[:blog][:author] = @blog.coach.name
    end

    if params[:blog][:image]
      image_filename = params[:blog][:image].original_filename
      path = Rails.root.join('app', 'assets', 'images', image_filename)
      File.open(path, 'wb') do |f|
        f.write(params[:blog][:image].read)
      end
      @blog.image_id = image_filename
    end

    if @blog.update_attributes blog_params(params[:blog])
      flash[:notice_title] =  @blog.title
      flash[:notice] = 'Blog Successfully Updated'
      redirect_to edit_blog_path @blog.id
    else
      render :edit
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
      flash[:notice] = 'Blog Deleted'
      redirect_to blogs_path
    else
      flash[:error] = 'Blog could not be deleted'
      redirect_to edit_blog_path(blog.id)
    end

  end

  def change_image
    @blog = Blog.find(params[:blog_id])
  end

  def search
    @results = Blog.filter params[:substring]
    render :json => @results
  end

  def blog_params(params)
    return params.permit :title, :author, :article, :image_id
  end
end
