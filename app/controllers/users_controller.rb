class UsersController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
      @user = params[:user]
      redirect_to home_index_path
  end
end
