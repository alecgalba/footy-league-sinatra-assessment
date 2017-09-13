require './config/environment'

class ApplicationController < Sinatra::Base
  include Helpers
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "soccer_safe"
  end

  get '/' do
    erb :index
  end



#   get '/players/index' do
#     "Hello World"
#   end
#
#   # get '/players/signup' do
#   #   @player = session[:user_id]
#   #   erb :"#{@player}/index"
#   # end
#
#   post '/login' do
#   @player = Player.find_by(email: params[:email])
#   if @player && @player.authenticate(params[:password])
#     session[:user_id] = @user.id
#     redirect to '/players/index'
#   else
#     redirect to '/signup'
#   end
# end
#
#   # post '/login' do
#   #   # "Hello World"
#   #   @player = Player.find_by_email(params[:player][:email])
#   #   if @player && @player.authenticate(params[:player][:password])
#   #     session[:id] = @player.id
#   #     redirect "/#{@player.id}/index"
#   #   else
#   #     flash.now[:login_error] = "Unable to authenticate. Please try again."
#   #     erb :'/index'
#   #   end
#   # end
#
#   get '/logout' do
#     session.clear
#     redirect '/'
#   end

end
