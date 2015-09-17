require 'sinatra/base'
require_relative 'game'
require_relative 'board'
require_relative '../game_setup'

class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}

  GAME = Game.new

  get '/' do
    erb :index
  end

  post '/player_registered' do
    redirect '/no_name' if params[:name] == ""
    @player_1 = params[:name]
    erb :player_registered
  end

  get '/no_name' do
    erb :no_name
  end

  get '/board' do
    @board = Board.new(Cell)
    @board.print_to_html
    @ship = Ship.new(5)
    @ship = @board.place(@ship, :E5, :horizontally)
    erb :board
  end






  get '/add' do
    number_1 = params[:number_1] = 33
    number_2 = params[:number_2] = 44
    @result = Calculator.add(number_1, number_2)
    erb :result
  end

# get '/new_game' do
#   erb :new_game
# end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
