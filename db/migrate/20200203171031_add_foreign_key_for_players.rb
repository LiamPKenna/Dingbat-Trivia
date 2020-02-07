class AddForeignKeyForPlayers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :players, :rooms, on_delete: :cascade
  end
end
