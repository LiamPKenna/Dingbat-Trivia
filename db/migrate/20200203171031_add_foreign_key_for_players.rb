class AddForeignKeyForPlayers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :players, :rooms
  end
end
