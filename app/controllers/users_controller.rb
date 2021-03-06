class UsersController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :"users/create"
    else
      redirect to "/teams"
    end
  end

  post '/signup' do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/teams'
    else
      @errors = { message: @user.errors.full_messages.join(', ') }
      erb :'users/create'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :"users/login"
    else
      redirect to '/teams'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/teams'
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil && logged_in?
      session.destroy
      redirect to '/'
    end
  end

end
