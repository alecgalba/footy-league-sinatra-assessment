
class TeamsController < ApplicationController

  get '/teams' do
    @teams = Team.all
    erb :'teams/index'
  end

  get '/teams/new' do
    erb :"teams/new"
  end

  get '/teams/:id' do
    @teams = Team.find_by_id(params[:id])
    erb :"teams/show"
  end

  # delete '/teams/:id/delete' do #This was added!
  #   @team = Team.find_by_id(params[:id])
  #   if logged_in? && current_user
  #     team.destroy
  #   end
  #   redirect '/teams'
  # end

  get '/teams/:id/edit' do
    @team = Team.find(params[:id])
    erb :"teams/edit"
  end

  post '/teams/:id' do
    @team = Team.find(params[:id])
    @team.name = params["team"]["name"]
    @team.mascot = params["team"]["mascot"]
    @team.colors = params["team"]["colors"]
    @team.save
    redirect to "/teams/#{@team.id}"
  end

  post "/teams" do
    if params[:name] == "" || params[:mascot] == "" || params[:colors] == ""
      redirect to '/teams'
    else
      Team.create(:name => params["team"]["name"], :mascot => params["team"]["mascot"], :colors => params["team"]["colors"])
      redirect '/teams'
    end
  end

end
