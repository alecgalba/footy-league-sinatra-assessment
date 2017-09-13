class PlayersController < ApplicationController

  get '/signup' do
   if !session[:player_id]
     erb :"players/signup"
   else
     redirect to "/teams"
   end
 end

 get '/players/:slug' do
   @player = Player.find_by_slug(params[:slug])
   erb :"/players/show"
 end

 post '/signup' do
   if params[:email] == "" || params[:password] == ""
     redirect to '/signup'
   else
     @player = Player.new(:email => params[:email], :password => params[:password])
     @player.save
     session[:player_id] = @player.id
     redirect to '/teams'
   end
 end

 get '/login' do
   if !session[:player_id]
     erb :"players/login"
   else
     redirect to '/teams'
   end
 end

 post '/login' do
   @player = Player.find_by(email: params[:email])
   if @player && @player.authenticate(params[:password])
     session[:playerer_id] = @player.id
     redirect to '/teams'
   else
     redirect to '/signup'
   end
 end

 get '/logout' do
   if session[:player_id] != nil && logged_in?
     session.destroy
     redirect to '/login'
   end
   redirect to '/'
 end

  # get '/signup' do
  #   erb :"players/signup"
  # end
  #
  # get '/login' do
  #   if !logged_in?
  #     redirect_if_not_logged_in
  #   else
  #     erb :"players/index"
  #   end
  # end
  #
  # post '/signup' do
  #   if params[:player][:email].nil? || params[:player][:password].nil?
  #       flash.now[:signup_error] = "Must signup with email address and password"
  #       redirect '/signup'
  #   else
  #     @player = Player.create(params[:player])
  #     session[:id] = @player.id
  #     redirect '/players/index'
  #   end
  # end
  #
  # get '/index' do
  #   if logged_in?
  #     erb :'players/index'
  #   else
  #     flash.now[:login_error] = "To view your team sheet please login"
  #     erb :'players/index'
  #   end
  # end

end
