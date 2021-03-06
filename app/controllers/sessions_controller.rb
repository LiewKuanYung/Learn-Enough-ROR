class SessionsController < ApplicationController
  
  def new
  end

  def create
    # receive { session: { password: "foobar", email: "example@example.com" } }
    @user = User.find_by(email: params[:session][:email].downcase)

    # same as
    # if @user && @user.authenticate(params[:session][:password])
    if @user&.authenticate(params[:session][:password])
      if @user.activated?
        # Log the user in and redirect to the user's show page.

        # save original url
        forwarding_url = session[:forwarding_url]
        
        # reset session, also clear forwarding_url in session
        reset_session

        # remember me feature
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)

        log_in @user
        redirect_to forwarding_url || @user # after logged in, redirect to user page
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # Create an error message.
      # flash.now: error message will disappear once there's additional request
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? # Only logging out if logged in
    redirect_to root_url
  end
end
