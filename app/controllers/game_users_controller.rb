class GameUsersController < ApplicationController
  def create
    game_user = GameUser.new(game_user_params)
    if game_user.save
      render json: {status:'SUCCESS',message:'Saved Game User', data:game_user},status: :ok
    else
      render json: {status:'ERROR',message:'Saving Game User failed', data:game_user},status: 400
    end
  end

  private

    def game_user_params
      params.require(:game_user).permit(:game_id,:user_id,:symbol)
    end
end
