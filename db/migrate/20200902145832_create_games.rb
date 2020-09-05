class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :board_size
      t.boolean :is_draw
      t.integer :winner

      t.timestamps
    end
  end
end
