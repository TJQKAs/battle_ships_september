require 'sinatra/base'
require_relative 'game'


class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}

  # GAME = Game.new

  get '/' do
    erb :index
  end

  post '/player_registered' do
    redirect '/no-name' if params[:name] == ""
    @player_1 = params[:name]
    erb :player_registered
  end

  get '/no-name' do
    erb :no_name
  end

  # get '/newgame' do
  #   "What's your name?"
  #   @visitor = params[:name]
  #   if @visitor == nil
  #     erb :no_name
  #   else
  #     erb :player1
  #   end
  # end

  get '/add' do
    number_1 = params[:number_1]
    number_2 = params[:number_2]
    @result = Calculator.add(number_1, number_2)
    erb :result
  end

# get '/new_game' do
#   erb :new_game
# end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
