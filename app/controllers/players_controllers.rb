class PlayersController < ApplicationController

  get '/signup' do
    erb :"players/signup"
  end

end
