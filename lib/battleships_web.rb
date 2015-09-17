require 'sinatra/base'
require_relative 'game'
require_relative 'board'
require_relative '../game_setup'

class BattleshipsWeb < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}

  $game = Game.new
  $player = Player.new

  get '/' do
    erb :index
  end

  post '/player_registered' do
    @player_1_name = params[:name]
    $player.name = @player_1_name
    erb :player_registered
  end


  get '/no_name' do
    erb :no_name
  end


  get '/board' do
     $player.board = Board.new(Cell) if $player.board == nil
     @ship1 = Ship.new(5)
     @ship2 = Ship.new(5)
     $player.board.place(@ship1, params[:place_ship1].to_sym, params[:orientation1].to_sym) if params[:place_ship1] != nil
     $player.board.place(@ship2, params[:place_ship2].to_sym, params[:orientation2].to_sym) if params[:place_ship2] != nil
     @ship1_position = params[:place_ship1]
    #  session[:orientation1] = params[:orientation1]
    #  session[:ship_2_position] = params[:place_ship2]
    #  session[:orientation2] = params[:orientation2]
     erb :place
   end




  # get '/add' do
  #   number_1 = params[:number_1] = 33
  #   number_2 = params[:number_2] = 44
  #   @result = Calculator.add(number_1, number_2)
  #   erb :result
  # end

# get '/new_game' do
#   erb :new_game
# end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
