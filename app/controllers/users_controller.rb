class UsersController < ApplicationController
  def new
    if session[:user_id]
      redirect_to edit_user_path(session[:user_id])
      return
    end
    @new_user = User.new
  end


  def create
    @new_user = User.new user_params(params[:user])
    if @new_user.save
        flash[:notice] = 'Successfully Signed Up'
        session[:user_id] = @new_user.id
        flash[:notice_title] = @new_user.email
        redirect_to home_index_path
    else
        render :new
    end
  end

  def edit
    @user = User.find(session[:user_id])
    if !@user
      redirect_to new_user_path
      return
    end
  end

  def update
    @user = User.find(session[:user_id])
    if !@user
      redirect_to new_user_path
      return
    end

    if @user.update_attributes user_params(params[:user])
      flash[:notice_title] = @user.email
      flash[:notice] = 'Profile Successfully Updated'
      redirect_to edit_user_path session[:user_id]
    else
      render :edit
    end
  end

  def destroy
    user = User.find(session[:user_id])

    if user.destroy
      flash[:notice] = 'Profile Deleted'
      reset_session
      redirect_to home_index_path
    else
      flash[:error] = 'Profile Could Not Be Deleted'
      redirect_to edit_user_path(user.id)
    end

  end

  def post_login
    if params[:email].blank?
      return redirect_to login_user_path
    end

    @user = User.find_by_email(params[:email])
    if @user == nil || !@user.correct_password?(params[:password])
      flash[:error] = 'Email and/or Password are Incorrect'
      render :login
    else
      session[:user_id] = @user.id
      flash[:notice] = "You logged in #{@user.full_name}"
      redirect_to :back
    end
  end

  def login
    redirect_to home_index_path if session[:user_id]
  end

  def logout
    reset_session
    flash[:notice] = 'You have Logged Out'
    redirect_to :back
  end

  def user_params(params)
    return params.permit :email, :first_name, :last_name, :city, :state, :subscription, :username, :password, :password_confirmation
  end
end
