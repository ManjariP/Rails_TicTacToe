class Game < ApplicationRecord
    has_many :game_moves
    has_many :game_users

    def self.boardSize(id)
        Game.find(id).board_size
    end

    def self.updateWinner(id,user_id)
       rec = Game.find(id)
       rec.update_attribute(:winner,user_id)
    end

    def self.updateIsDraw(id)
       rec = Game.find(id)
       rec.update_attribute(:is_draw,true)
    end
end
