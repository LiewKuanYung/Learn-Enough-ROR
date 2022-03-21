class UsersController < ApplicationController
  
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

  private
    # restrict allowed access of field
    def user_params
      params.require(:user).permit(:name, 
                                   :email, 
                                   :password, 
                                   :password_confirmation)
    end
end
