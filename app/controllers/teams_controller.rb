class TeamsController < ApplicationController

  get '/teams' do
    if session[:playerr_id]
      @teams = Team.all
      erb :"teams/teams"
    else
      redirect to '/login'
    end
  end

  get '/teams/new' do
    if session[:playerer_id]
      erb :"teams/create"
    else
      redirect to '/login'
    end
  end

  post '/teams' do
    if params[:name] == "" && params[:mascot] == "" && params[:colors] == ""
      redirect to "/teams/new"
    else
      player = Player.find_by_id(session[:player_id])
      @team = Team.create(params)
      redirect to "/teams/#{@team.id}"
    end
  end

  get '/teams/:id' do
    if session[:player_id]
      @team = Team.find_by_id(params[:id])
      erb :"teams/show"
    else
      redirect to '/login'
    end
  end

  get '/teams/:id/edit' do
    if session[:player_id]
      @team = Team.find_by_id(params[:id])
      if @team.player_id == session[:player_id]
        erb :"teams/edit"
      else
        redirect to '/teams'
      end
    else
      redirect to '/login'
    end
  end

  patch '/teams/:id' do
    if params[:name] == "" && params[:mascot] == "" && params[:colors] == ""
      redirect to "/teams/#{params[:id]}/edit"
    else
      @team = Team.find_by_id(params[:id])
      @team.name = params[:name]
      @team.mascot = params[:mascot]
      @team.colors = params[:colors]
      @team.save
      redirect to "/teams/#{@team.id}"
    end
  end

  delete '/teams/:id/delete' do
    @team = Team.find_by_id(params[:id])
    if session[:player_id]
      @team = Team.find_by_id(params[:id])
      if @team.player_id == session[:player_id]
        @team.delete
        redirect to '/teams'
      else
        redirect to '/teams'
      end
    else
      redirect to '/login'
    end
  end

end
