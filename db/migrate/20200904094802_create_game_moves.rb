class CreateGameMoves < ActiveRecord::Migration[5.1]
  def change
    create_table :game_moves do |t|
      t.references :game_user, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
