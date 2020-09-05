class GameMove < ApplicationRecord
  belongs_to :game_user

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def self.moveAlreadyMade?(game_user_id,position)
    movesMade(game_user_id).include?(position)
  end

  def self.hasWon?(game_user_id)
    user_positions = GameMove.where("game_user_id = ?",game_user_id).pluck(:position)
    res = WINNING_COMBINATIONS.any? do |combo|
      combo.select{ |x| !user_positions.include?(x) }.empty?
    end
    if res 
      user_id = GameUser.getUserId(game_user_id)
      game_id = respectiveGameId(game_user_id)
      if !game_id.nil?
        Game.updateWinner(game_id,user_id)
      end
    end
    res
  end

  def self.isDraw?(game_user_id)
    game_id = respectiveGameId(game_user_id)
    if !game_id.nil?
      board_size = Game.boardSize(game_id)
      res = movesMade(game_user_id).length == (board_size * board_size)
      if res 
        game_id = respectiveGameId(game_user_id)
        if !game_id.nil?
          Game.updateIsDraw(game_id)
        end
      end
      res
    end
  end

  private
    def self.joinWithGameUser
      GameMove.joins(:game_user)
    end

    def self.respectiveGameId(game_user_id)
      joinWithGameUser.where("game_user_id = ?",game_user_id).pluck(:game_id)[0]
    end

    def self.movesMade(game_user_id)
      game_id = respectiveGameId(game_user_id)
      if !game_id.nil?
        joinWithGameUser.where("game_id = ?",game_id).pluck(:position)
      else
        []
      end
    end

end
