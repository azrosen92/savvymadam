module SessionsHelper

  #sign in user
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  #returns whether a user is signed in
  def signed_in?
    !current_user.nil?
  end

  #assigns the user as the current user
  def current_user=(user)
    @current_user = user
  end

  #assigns the user found by the remember token to @current_user only if
  #@current_user is undefined
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  #returns whether the current user is the user parameter
  def current_user?(user)
    user == current_user
  end

  #signs out the current user
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  #stores the current page, so we can redirect back to it later
  def store_location
    session[:return_to] = request.fullpath
  end

  #redirects back to stored page or a default page
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #checks if user is signed in before doing some action
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end



end
