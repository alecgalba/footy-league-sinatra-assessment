module Helpers

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/login'
    end
  end

  def current_user
    if !@user
      @user = User.find(session[:user_id])
    else
      @user
    end
  end

end
