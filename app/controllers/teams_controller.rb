class TeamsController < ApplicationController

  get '/teams' do
    @teams = Team.all
    erb :'teams/index'
  end

  get '/teams/new' do
    erb :"teams/new"
  end

  post "/teams" do
    if params["team"]["name"] == "" || params["team"]["mascot"] == "" || params["team"]["colors"] == ""
      erb :"teams/new"
    else
      #@team = Team.new(:name => params["team"]["name"], :mascot => params["team"]["mascot"], :colors => params["team"]["colors"])
      @team = current_user.teams.build(:name => params["team"]["name"], :mascot => params["team"]["mascot"], :colors => params["team"]["colors"])
      @team.save
      redirect "/teams/#{@team.id}"
    end
  end

  get '/teams/:id' do
    @teams = Team.find_by_id(params[:id])
    erb :"teams/show"
  end

  get '/teams/:id/edit' do
    @team = Team.find_by_id(params[:id])
    if @team.user_id == current_user.id
      erb :"teams/edit"
    else
      redirect "/teams"
    end
  end

  patch '/teams/:id' do
    @team = Team.find_by_id(params[:id])
    @team.name = params["team"]["name"]
    @team.mascot = params["team"]["mascot"]
    @team.colors = params["team"]["colors"]
    @team.save
    redirect to "/teams"
  end

  delete '/teams/:id/delete' do
    @team = Team.find_by_id(params[:id])
    @team.delete
    redirect "/teams"
  end

end
