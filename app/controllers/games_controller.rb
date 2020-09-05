class GamesController < ApplicationController
  def create
    game = Game.new(game_params)
    if game.save
      render json: {status:'SUCCESS',message:'Saved Game', data:game},status: :ok
    else
      render json: {status:'ERROR',message:'Saving Game failed', data:game},status: 400
    end
  end

  private

    def game_params
      params.require(:game).permit(:board_size)
    end
end
