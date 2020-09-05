class GameMovesController < ApplicationController
  def create

    if GameMove.moveAlreadyMade?(params[:game_user_id],params[:position])
      render json: {status:'ERROR',message:'Position taken'},status: 400
    else
      game_move = GameMove.new(game_move_params)
      if game_move.save
        if GameMove.hasWon?(params[:game_user_id])
          render json: {status:'SUCCESS',message:'Saved Game Move', data:game_move, hasWon:true},status: :ok
        elsif GameMove.isDraw?(params[:game_user_id])
          render json: {status:'SUCCESS',message:'Saved Game Move', data:game_move, isDraw:true},status: :ok
        else
          render json: {status:'SUCCESS',message:'Saved Game Move', data:game_move},status: :ok
        end
      else
        render json: {status:'ERROR',message:'Saving Game Move failed', data:game_move},status: 400
      end
    end
  end

  private

    def game_move_params
      params.require(:game_move).permit(:game_user_id,:position)
    end
end
