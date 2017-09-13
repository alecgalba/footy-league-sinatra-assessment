module Helpers

  def logged_in?
    !!session[:player_id]
  end

  def current_user
    Player.find(session[:player_id])
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/login'
    end
  end

end
