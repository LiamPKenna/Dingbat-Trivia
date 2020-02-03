class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :player_count
      t.integer :current_question
      t.string :questions
      t.boolean :ready_for_next

      t.timestamps
    end
  end
end
