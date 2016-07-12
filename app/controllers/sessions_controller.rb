class SessionsController < ApplicationController
  #skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:id])
    redirect_to user_path(@user)
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
