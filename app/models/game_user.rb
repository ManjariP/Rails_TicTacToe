class GameUser < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many   :gane_moves

  def self.getUserId(id)
    GameUser.find(id).user_id
  end
end
