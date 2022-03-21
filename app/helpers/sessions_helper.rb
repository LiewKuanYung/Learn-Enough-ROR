module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    # session is rails' built in feature
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      # uses 'or equal' operator
      # if @current_user != nil, return @current_user
      # else User.find_by(id)
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end
end
