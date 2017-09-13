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

  post '/leagues' do
    @league = League.create(params["league"])
    if !params[:team][:name].empty?
      @league.teams << Team.create(params[:team])
    end

    @league.save
    redirect to "/leagues/#{@league.id}"
  end

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
