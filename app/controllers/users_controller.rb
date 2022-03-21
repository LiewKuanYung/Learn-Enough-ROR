class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update] 
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # logging in the user upon sign up
      reset_session
      log_in @user
      # a message that appears on the subsequent page 
      # and then disappears upon visiting a second page or on page reload.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # equivalent to redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

  # restrict allowed access of field
  def user_params
    params.require(:user)
          .permit(:name, 
                  :email, 
                  :password, 
                  :password_confirmation)
  end

  # before_action filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user # same as: `unless current_user?(@user)`
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
