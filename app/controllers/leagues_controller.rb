class LeaguesController < ApplicationController

  get '/leagues' do
    @leagues = League.all
    erb :'leagues/index'
  end

  get '/leagues/new' do
    erb :'leagues/new'
  end

  get '/leagues/:id' do
    @league = League.find(params[:id])
    erb :'leagues/show'
  end

  get '/leagues/:id/edit' do
    @league = League.find(params[:id])
    erb :'leagues/edit'
  end

  post "/leagues" do
    if params[:name].blank?
      redirect to '/leagues'
    else
      League.create(:name => params["team"]["name"])
      redirect '/leagues'
    end
  end

  # delete '/leagues/:id/delete' do
  #   @league = League.find_by_id(params[:id])
  #   if logged_in? && current_user
  #     league.destroy
  #   end
  #   redirect '/leagues/show'
  # end

  post '/leagues/:id' do
    @league = League.find(params[:id])
    @league.update(params[:league])

    if !params[:team][:name].empty?
      @league.teams << Team.create(params[:team])
    end

    if !params[:user][:name].empty?
      @league.users << User.create(params[:user])
    end

    @league.save
    redirect to "/leagues/#{@league.id}"
  end

end
