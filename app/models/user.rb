class User < ApplicationRecord
    has_many :game_moves
    has_many :game_users
end
