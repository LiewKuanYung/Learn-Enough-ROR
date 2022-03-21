class SessionsController < ApplicationController
  
  def new
  end

  def create
    # receive { session: { password: "foobar", email: "example@example.com" } }
    user = User.find_by(email: params[:session][:email].downcase)

    # same as
    # if user && user.authenticate(params[:session][:password])
    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      reset_session
      log_in user
      redirect_to user
    else
      # Create an error message.
      # flash.now: error message will disappear once there's additional request
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
