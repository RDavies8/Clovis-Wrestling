class CommentsController < ApplicationController
  def create
    if !session[:user_id]
      flash[:error] = 'Must be Signed in to Post Comments'
      redirect_to blog_path params[:comment][:blog_id]
      return
    end

    new_comment = Comment.new(content: params[:comment][:content], user: User.find(session[:user_id]), blog: Blog.find(params[:comment][:blog_id]))
    if new_comment.save
      flash[:notice] = 'Comment Posted'
      redirect_to blog_path params[:comment][:blog_id]
    else
      if new_comment.content.blank?
        flash[:error] = 'Cannot Post Blank Comment'
      else
        flash[:error] = 'Comment Unable to Save'
      end
      redirect_to blog_path params[:comment][:blog_id]
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    redirect_to blog_path comment.blog.id

    if comment.destroy
      flash[:notice] = 'Comment Removed'
    else
      flash[:error] = 'Comment Could Not be Removed'
    end
  end
end
