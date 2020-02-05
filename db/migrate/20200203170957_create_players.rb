class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :room_id
      t.string :name
      t.integer :score, default: 0
      t.integer :current_answer, default: 0
      t.string :player_color
      t.string :player_icon

      t.timestamps
    end
  end
end
