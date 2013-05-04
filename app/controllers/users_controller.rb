class UsersController < ApplicationController
  #before_filter :signed_in_user
  #before_filter :correct_user
  #before_filter :admin_user

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to the Savvy Madam!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_back_or(root_path) unless current_user.admin?
    end
end
